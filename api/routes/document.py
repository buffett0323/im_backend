from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from typing import List
from sqlmodel import select
from fastapi import FastAPI, File, UploadFile
import pandas as pd
from io import StringIO
from sqlmodel import Session
from dotenv import load_dotenv
import os
from db import get_session
from models import Document

import pandas as pd

router = APIRouter()

# Function to process CSV and store data into the database
@router.post("/upload-document/")
async def upload_csv(file: UploadFile = File(...), session: Session = Depends(get_session)):
    content = await file.read()
    df = pd.read_csv(StringIO(content.decode('utf-8')))
    
    # Iterate through each row and add to the database
    for _, row in df.iterrows():
        article = Document(
            article_name=row['article_name'],
            author=row['author'],
            publisher=row['publisher'],
            date=row['date'],
            
        )
        session.add(article)
    session.commit()
    
    return {"message": "Data successfully uploaded to the database"}