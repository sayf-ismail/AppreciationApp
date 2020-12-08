require 'pg'

def run_sql(sql, params = [])
    db = PG.connect(dbname: 'appreciation_app_db')
    db.prepare(sql, sql)
    results = db.exec_prepared(sql, params)
    db.close
    return results
end