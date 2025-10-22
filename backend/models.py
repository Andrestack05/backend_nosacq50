# models.py
from sqlalchemy import Column, Integer, String, DateTime
from datetime import datetime
from database import Base

class Response(Base):
    __tablename__ = "responses"

    id = Column(Integer, primary_key=True, index=True)
    player_id = Column(String, index=True)
    question_number = Column(Integer)
    value = Column(Integer)
    section = Column(String)
    date = Column(DateTime, default=datetime.utcnow)
