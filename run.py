from sqlalchemy.sql import select
from sqlalchemy.engine.mock import MockConnection
from model import Category
from util import init_db_conn

def app(conn: MockConnection):
    category_alias = select([Category]).alias('categories')
    query = select([category_alias]).where(category_alias.c.name.ilike("%asd%")).apply_labels()
    payload = {
        'per_page': 10,
        'page': 1
    }
    # total = conn.execute(select([func.count()]).select_from(query.alias())).fetchone()[0]
    # print(select([func.count()]).select_from(query.alias()))
    # print(total)
    query = query.limit(payload['per_page']).offset((payload['page'] - 1) * payload['per_page'])
    results = conn.execute(query).fetchall()
    print(query)
    print([{index:value for index,value in result.items()} for result in results])
    # comment_db = conn.execute(query).fetchall()


if __name__ == '__main__':
    conn = init_db_conn()
    app(conn)
