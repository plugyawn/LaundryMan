from flask import Flask, redirect, render_template, request
from flask_mysqldb import MySQL
from flask_login import LoginManager, UserMixin, login_user, login_required, logout_user
from flask import Flask, render_template, request, redirect, jsonify
from flask_login import LoginManager, login_user, logout_user, login_required
from flask_login import UserMixin
from flask import url_for

# MySQL configurations
users_with_roles = {
    'admin@example.com': {
        'password_hash': 'adminpass',
        'role': 'admin'
    },
    'user@example.com': {
        'password_hash': 'userpass',
        'role': 'user'
    }
}

app = Flask(__name__)
login_manager = LoginManager()
login_manager.init_app(app)
app.secret_key ='maujmasti'

class User(UserMixin):
    def __init__(self, email):
        self.id = email
        self.role = users_with_roles[email]['role']

@login_manager.user_loader
def load_user(user_id):
    if user_id in users_with_roles:
        return UserMixin()
    return None

@app.route('/adminindex')
def adminindex():
    admin_tables = ['belongs_to','customer','smart_laundry',' gsj_employee','`order`','item_of_clothing','vehicles','hostel','payment','washing','transaction','places_order','phone_number']
    return render_template('adminindex.html', table_names=admin_tables)

@app.route('/userindex')
def userindex():
    user_tables = ['customer','order','payment']
    return render_template('userindex.html', table_names=user_tables)

@app.route('/', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']
        user = users_with_roles.get(email)
        print(user)
        if user and (user['password_hash'] == password):
            user_obj = User(email)
            login_user(user_obj)
            print(user_obj.role)
            if user_obj.role == 'admin':
                    return jsonify({'redirect_url': url_for('adminindex')})
            else:
                    return jsonify({'redirect_url': url_for('userindex')})
        else:
            return 'Invalid email or password'
    return render_template('login.html')
                                            
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'pass'
app.config['MYSQL_DB'] = 'Laundry'
mysql = MySQL(app)

@app.route('/logout')
@login_required
def logout():
    logout_user()
    return redirect('/login')

@app.route('/get_records', methods=['GET'])
def get_records():
    table_name = request.args.get('table_name')
    if not table_name:
        return jsonify({'status': 'error', 'message': 'Table name is required'}), 400

    query = f"SELECT * FROM {table_name}"
    try:
        cursor = mysql.connection.cursor()
        cursor.execute(query)
        columns = [desc[0] for desc in cursor.description]
        data = [dict(zip(columns, row)) for row in cursor.fetchall()]
        cursor.close()
        return jsonify({'status': 'success', 'data': data})
    except Exception as e:
        return jsonify({'status': 'error', 'message': str(e)}), 500

@app.route('/get_column_names', methods=['GET'])
def get_column_names():
    table_name = request.args.get('table_name')
    if not table_name:
        return jsonify({'status': 'error', 'message': 'Table name is required'}), 400

    try:
        cursor = mysql.connection.cursor()
        query = f"SHOW COLUMNS FROM {table_name}"
        cursor.execute(query)
        columns = [row[0] for row in cursor.fetchall()]
        cursor.close()
        return jsonify({'status': 'success', 'data': columns})
    except Exception as e:
        return jsonify({'status': 'error', 'message': str(e)}), 500

@app.route('/run_query', methods=['POST'])
def run_query():
    query = 'SELECT * FROM customer'
    operation = request.form.get('operation')
    table_name = request.form.get('table_name')
    where_clause = request.form.get('where_clause')
    if operation == 'SELECT':
        if where_clause != "":
            query = f'{operation} * FROM {table_name} WHERE {where_clause}'
        else:
            query = f'{operation} * FROM {table_name}'
    elif operation == 'INSERT':
        values = tuple(request.form.getlist('values[]'))
        query = f'{operation} INTO {table_name} VALUES ({values})'
    elif operation == 'UPDATE':
        set_clause = request.form['set_clause']
        query = f'{operation} {table_name} SET {set_clause} WHERE {where_clause}'
    elif operation == 'DELETE':
        query = f'{operation} FROM {table_name} WHERE {where_clause}'
    try:   
        cursor = mysql.connection.cursor()
        cursor.execute(query)
        mysql.connection.commit()
        columns = [desc[0] for desc in cursor.description]
        data = [dict(zip(columns, row)) for row in cursor.fetchall()]
        cursor.close()
        return jsonify({'status': 'success', 'data': data})
    except Exception as e:
        mysql.connection.rollback()
        return jsonify({'status': 'error', 'message': str(e)})

@app.route('/update_record', methods=['POST'])
def update_record():
    # You may need to adjust the data extraction based on the format sent by your JavaScript code
    data = request.json
    record_id = data.get('id')
    table_name = data.get('table_name')
    updated_values = {k: v for k, v in data.items() if k not in ['id', 'table_name']}

    try:
        cursor = mysql.connection.cursor()
        # Generate the SQL UPDATE statement
        update_statements = ', '.join(f"{k}='{v}'" for k, v in updated_values.items())
        query = f"UPDATE {table_name} SET {update_statements} WHERE id={record_id}"
        cursor.execute(query)
        mysql.connection.commit()
        cursor.close()
        return jsonify({'status': 'success', 'message': 'Record updated successfully'})
    except Exception as e:
        mysql.connection.rollback()
        return jsonify({'status': 'error', 'message': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)
