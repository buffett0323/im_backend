from fastapi import APIRouter, Depends, File, UploadFile, HTTPException
from sqlalchemy.orm import Session
from typing import List
from sqlmodel import select
from fastapi import FastAPI, File, UploadFile
from io import StringIO
from sqlmodel import Session
from dotenv import load_dotenv
from db import get_session
from models import Document, Theme

import os
import openai
import pandas as pd

router = APIRouter()


# Function to process CSV and store data into the database
@router.post("/upload-document/")
async def upload_csv(file: UploadFile = File(...), session: Session = Depends(get_session)):
    content = await file.read()
    df = pd.read_csv(StringIO(content.decode('utf-8')))
    
    # TODO: extract theme and entity, media_type
    for _, row in df.iterrows():
        article = Document(
            article_name=row['article_name'],
            author=row['author'],
            publisher=row['publisher'],
            date=row['date'],
            full_text=row.get('full_text', ''),
        )
        session.add(article)
    session.commit()
    
    return {"message": "Data successfully uploaded to the database"}


@router.post("/process-document/{doc_id}")
async def process_document(doc_id: int, session: Session = Depends(get_session)):
    # Retrieve the document by its ID
    statement = select(Document).where(Document.id == doc_id)
    result = session.exec(statement)
    document = result.first()
    
    if not document:
        raise HTTPException(status_code=404, detail="Document not found")
    
    full_text = document.full_text
    
    # Retrieve the whole theme table
    theme_query = session.exec(select(Theme))
    themes = theme_query.all()

    
    # Create the GPT prompt with the full text and themes
    theme_descriptions = "\n".join([f"Theme: {theme.theme_name}\nDefinition: {theme.definition}" for theme in themes])
    
    prompt = f"""
    The following article text is provided:
    "{full_text}"

    Below are several themes with their definitions:
    {theme_descriptions}

    Identify which themes are present in the article and extract the quotes from the article that support the inference of these themes.
    For each theme, please return:
    1. The theme name
    2. The extracted quotes that support the theme
    """
    
    # Query GPT-4 or GPT-4o-mini with the prompt
    openai.api_key = os.getenv("OPENAI_API_KEY")
    response = openai.Completion.create(
        model="gpt-4o-mini",
        prompt=prompt,
        max_tokens=1500,
        temperature=0.5
    )
    
    return {"message": response.choices[0].text.strip()}