from flask import Flask, render_template, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask import Flask, render_template, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import text
from sqlalchemy import inspect


app = Flask(__name__)
# Update the URI with your MySQL credentials and database name
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://root:hyperbeam150@localhost/laundryMan'
db = SQLAlchemy(app)

def get_table_names():
    inspector = inspect(db.engine)
    return inspector.get_table_names()

@app.route('/')
def index():
    table_names = get_table_names()
    return render_template('index.html', table_names=table_names)

@app.route('/run_query', methods=['POST'])
def run_query():
    query = text(request.form['query'])
    
    try:
        result = db.session.execute(query)
        db.session.commit()
        columns = [col[0] for col in result.cursor.description]
        data = [dict(zip(columns, row)) for row in result]
        return jsonify({'status': 'success', 'data': data})
    except Exception as e:
        db.session.rollback()
        return jsonify({'status': 'error', 'message': str(e)})
    

@app.route('/get_table_data/<table_name>')
def get_table_data(table_name):
    query = text(f"SELECT * FROM {table_name}")
    query = str(query)
    query += "`"
    query_word_list = query.split()
    query_word_list[-1] = "`" + query_word_list[-1]
    query = " ".join(query_word_list)
    query = text(query)
    try:
        result = db.session.execute(query)
        columns = [column["name"] for column in inspect(db.engine).get_columns(table_name)]
        data = [dict(zip(columns, row)) for row in result]
        return jsonify({'status': 'success', 'columns': columns, 'data': data})
    except Exception as e:
        return jsonify({'status': 'error', 'message': str(e)})

if __name__ == '__main__':
    app.run(debug=True)