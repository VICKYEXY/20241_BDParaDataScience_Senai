import pyodbc

# Função para conectar ao banco de dados
def conectar():
    try:
        conexao = pyodbc.connect(
            'DRIVER={ODBC Driver 17 for SQL Server};'
            'SERVER=NOTEBOOK01;'
            'DATABASE=comercio;'
            'Trusted_Connection=Yes;'
        )
        return conexao
    except Exception as e:
        print(f"Erro ao conectar ao banco de dados: {e}")
        return None

# Função para inserir dados na tabela cliente
def inserir_cliente(nome, nome_social, genero, data_nascimento, documento, tipo_documento):
    conexao = conectar()
    if conexao:
        cursor = conexao.cursor()
        try:
            cursor.execute('''
                INSERT INTO cliente (nome, nomeSocial, genero, dataNascimento, documento, tipoDocumento)
                VALUES (?, ?, ?, ?, ?, ?)
            ''', (nome, nome_social, genero, data_nascimento, documento, tipo_documento))
            conexao.commit()
            print("Cliente inserido com sucesso!")
        except Exception as e:
            print(f"Erro ao inserir cliente: {e}")
        finally:
            cursor.close()
            conexao.close()

# Função para atualizar dados na tabela cliente
def atualizar_cliente(id_cliente, nome=None, nome_social=None, genero=None, data_nascimento=None, documento=None, tipo_documento=None):
    conexao = conectar()
    if conexao:
        cursor = conexao.cursor()
        try:
            campos = []
            valores = []
            if nome:
                campos.append("nome = ?")
                valores.append(nome)
            if nome_social:
                campos.append("nomeSocial = ?")
                valores.append(nome_social)
            if genero:
                campos.append("genero = ?")
                valores.append(genero)
            if data_nascimento:
                campos.append("dataNascimento = ?")
                valores.append(data_nascimento)
            if documento:
                campos.append("documento = ?")
                valores.append(documento)
            if tipo_documento:
                campos.append("tipoDocumento = ?")
                valores.append(tipo_documento)
            
            valores.append(id_cliente)
            campos_str = ", ".join(campos)
            sql = f"UPDATE cliente SET {campos_str} WHERE id_cliente = ?"
            
            cursor.execute(sql, valores)
            conexao.commit()
            print("Cliente atualizado com sucesso!")
        except Exception as e:
            print(f"Erro ao atualizar cliente: {e}")
        finally:
            cursor.close()
            conexao.close()

# Função para deletar dados na tabela cliente
def deletar_cliente(id_cliente):
    conexao = conectar()
    if conexao:
        cursor = conexao.cursor()
        try:
            cursor.execute("DELETE FROM cliente WHERE id_cliente = ?", id_cliente)
            conexao.commit()
            print("Cliente deletado com sucesso!")
        except Exception as e:
            print(f"Erro ao deletar cliente: {e}")
        finally:
            cursor.close()
            conexao.close()

# Função para listar todos os clientes
def listar_clientes():
    conexao = conectar()
    if conexao:
        cursor = conexao.cursor()
        try:
            cursor.execute("SELECT * FROM cliente")
            clientes = cursor.fetchall()
            for cliente in clientes:
                print(cliente)
        except Exception as e:
            print(f"Erro ao listar clientes: {e}")
        finally:
            cursor.close()
            conexao.close()

# Exemplos de uso das funções
# Inserir cliente
inserir_cliente('Novo Cliente', 'n/a', 'Masculino', '1980-01-01', '123.456.789-00', 'CPF')

# Atualizar cliente
atualizar_cliente(1, nome='Cliente Atualizado')

# Deletar cliente
deletar_cliente(1)

# Listar clientes
listar_clientes()
