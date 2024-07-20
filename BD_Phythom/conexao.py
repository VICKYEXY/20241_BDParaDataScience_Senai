import pyodbc

# Replace with your connection details
server = 'NOTEBOOK\SQLEXPRESS'
database = 'comercio'
username = ''
password = ''


def connect_to_database():
  """Connects to the SQL Server database and returns the connection object"""
  connection_string = f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={server};DATABASE={database};UID={username};PWD={password}'
  try:
    connection = pyodbc.connect(connection_string)
    return connection
  except pyodbc.Error as ex:
    print('Erro ao conectar:', ex)
    return None


def insert_cliente(nome, nome_social, genero, data_nascimento, documento, tipo_documento):
  """Inserts a new client into the 'cliente' table"""
  connection = connect_to_database()
  if not connection:
    return

  cursor = connection.cursor()
  try:
    # Use parameterized query to prevent SQL injection attacks
    sql = """INSERT INTO cliente (nome, nomeSocial, genero, dataNascimento, documento, tipoDocumento)
              VALUES (?, ?, ?, ?, ?, ?)"""
    cursor.execute(sql, (nome, nome_social, genero, data_nascimento, documento, tipo_documento))
    connection.commit()
    print("Cliente inserido com sucesso!")
  except pyodbc.Error as ex:
    print("Erro ao inserir cliente:", ex)
  finally:
    connection.close()


def update_cliente(id_cliente, nome=None, nome_social=None, genero=None, data_nascimento=None, documento=None, tipo_documento=None):
  """Updates an existing client in the 'cliente' table"""
  connection = connect_to_database()
  if not connection:
    return

  cursor = connection.cursor()
  try:
    # Build the SET clause dynamically based on provided arguments
    set_clause = ""
    params = []
    if nome:
      set_clause += ", nome=?"
      params.append(nome)
    if nome_social:
      set_clause += ", nomeSocial=?"
      params.append(nome_social)
    if genero:
      set_clause += ", genero=?"
      params.append(genero)
    if data_nascimento:
      set_clause += ", dataNascimento=?"
      params.append(data_nascimento)
    if documento:
      set_clause += ", documento=?"
      params.append(documento)
    if tipo_documento:
      set_clause += ", tipoDocumento=?"
      params.append(tipo_documento)

    if not set_clause:
      print("Nenhum campo informado para atualização.")
      return

    # Remove the leading comma from the SET clause
    set_clause = set_clause[1:]
    sql = f"""UPDATE cliente SET {set_clause} WHERE id_cliente=?"""
    params.append(id_cliente)
    cursor.execute(sql, params)
    connection.commit()
    print(f"Cliente com ID {id_cliente} atualizado com sucesso!")
  except pyodbc.Error as ex:
    print("Erro ao atualizar cliente:", ex)
  finally:
    connection.close()


def delete_cliente(id_cliente):
  """Deletes a client from the 'cliente' table"""
  connection = connect_to_database()
  if not connection:
    return

  cursor = connection.cursor()
  try:
    sql = "DELETE FROM cliente WHERE id_cliente=?"
    cursor.execute(sql, (id_cliente,))
    connection.commit()
    print(f"Cliente com ID {id_cliente} deletado com sucesso!")
  except pyodbc.Error as ex:
    print("Erro ao deletar cliente:", ex)
  finally:
    connection.close()


def list_clientes():
  """Lists all clients from the 'cliente' table"""
  connection = connect_to_database()
  if not connection:
    return

  cursor = connection.cursor()
  try:
    sql = "SELECT * FROM cliente"
    cursor.execute(sql)
    rows = cursor.fetchall()
  except pyodbc.Error as ex:
    print("Erro ao deletar cliente:", ex)
    if not rows:
      print("Nenhum cliente encontrado.")
      return

    print
connect_to_database()
