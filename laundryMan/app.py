from flask import Flask, redirect, render_template, request, session
from flask_mysqldb import MySQL
from flask_login import LoginManager, UserMixin, login_user, login_required, logout_user
from flask import Flask, render_template, request, redirect, jsonify
from flask_login import LoginManager, login_user, logout_user, login_required
from flask_login import UserMixin
from flask import url_for
user_tables = ['customer','order','payment']
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
@login_required
def adminindex():
    if session['role'] != 'admin':
        return redirect('/')
    admin_tables = ['belongs_to','customer','smart_laundry',' gsj_employee','`order`','item_of_clothing','vehicles','hostel','payment','washing','transaction','places_order','phone_number']
    return render_template('adminindex.html', table_names=admin_tables)

@app.route('/userindex')
@login_required
def userindex():
    if session['role'] != 'user':
        return redirect('/')
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
            session['role'] = user_obj.role
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

@app.route('/get_table_data')
def get_table_data():
    table_name = request.args.get('table_name')
    cursor = mysql.connection.cursor()
    cursor.execute(f"SELECT * FROM {table_name}")
    records = cursor.fetchall()
    column_names = [desc[0] for desc in cursor.description]
    return jsonify({'status': 'success', 'columnNames': column_names, 'records': records})

@app.route('/run_query', methods=['POST'])
def run_query():
    query = 'SELECT * FROM customer'
    operation = request.form.get('operation')
    table_name = None
    if session['role'] == 'user':
       temp = request.form.get('customer')
       if temp  not in user_tables:
            table_name = 'customer'
    query = f'{operation} * FROM {table_name}'
    where_clause = request.form.get('where_clause')
    selected_columns = request.form.getlist('selected_columns')
    print(selected_columns)

    print(operation, table_name, where_clause)
    if operation == 'SELECT':
        if where_clause != "" and where_clause:
            if selected_columns:
                columns = ', '.join(selected_columns)
                query = f'{operation} {columns} FROM {table_name} WHERE {where_clause}'
                print(query)
                print('Got here!')
            else:
                print('Accidentally gott here!')
                query = f'{operation} * FROM {table_name} WHERE {where_clause}'
        else:
            if selected_columns:
                columns = ', '.join(selected_columns)
                query = f'{operation} {columns} FROM {table_name}'
            else:
                query = f'{operation} * FROM {table_name}'

    elif operation == 'INSERT':
        print('Got here! (INSERT)')
        values = str(request.form.get('values[]'))
        values = (tuple(values.split(',')))
        if values[0] == '':
            values = values[1:]
        print(values)
        query = f'{operation} INTO {table_name} VALUES {values}'
        print(query)
    elif operation == 'UPDATE':
        set_clause = request.form['set_clause']
        query = f'{operation} {table_name} SET {set_clause} WHERE {where_clause}'
    elif operation == 'DELETE':
        query = f'{operation} FROM {table_name} WHERE {where_clause}'
    try:   
        cursor = mysql.connection.cursor()
        cursor.execute(query)
        mysql.connection.commit()
        print(query)
        if operation == 'SELECT':
            columns = [desc[0] for desc in cursor.description]
            data = [dict(zip(columns, row)) for row in cursor.fetchall()]
        else:
            data = None
        cursor.close()
        return jsonify({'status': 'success', 'data': data})
    except Exception as e:
        mysql.connection.rollback()
        return jsonify({'status': 'error', 'message': str(e)})

@app.route('/update_record', methods=['POST'])
def update_record():
    data = request.json
    tableName = data['tableName']
    updatedRecord = data['updatedRecord']
    whereClause = data['whereClause']

    # Construct the SET clause for the UPDATE statement
    setClause = ', '.join([f"{key}='{value}'" for key, value in updatedRecord.items()])

    query = f"UPDATE {tableName} SET {setClause} WHERE {whereClause}"
    print(query)

    try:
        cursor = mysql.connection.cursor()
        cursor.execute(query)
        mysql.connection.commit()
        cursor.close()
        return jsonify({'status': 'success', 'message': 'Record updated successfully'})
    except Exception as e:
        mysql.connection.rollback()
        return jsonify({'status': 'error', 'message': str(e)})

app.config['SESSION_COOKIE_SECURE'] = True  # Only send cookies over HTTPS
app.config['SESSION_COOKIE_HTTPONLY'] = True  # Prevent client-side JS from accessing the session cookie

if __name__ == '__main__':
    app.run(debug=True)
