from sqlalchemy import Table, Column, Integer, String
from util import metadata

Category = Table('categories', metadata,
    Column('id', Integer, primary_key=True),
    Column('name', String(100), nullable=False),
    Column('icon', String(100), nullable=False),
    Column('reference_id', Integer, nullable=True)
)
