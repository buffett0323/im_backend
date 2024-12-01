from sqlmodel import SQLModel, Field

class Document(SQLModel, table=True):
    documentid: int = Field(default=None, primary_key=True)
    title: str
    publisher: str
    date: str  # You can adjust the type to datetime if needed
    summary: str
    author: str
    full_text: str
    analyze_state: str
    category: str