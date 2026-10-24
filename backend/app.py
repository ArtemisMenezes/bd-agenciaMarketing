# -*- coding: utf-8 -*-
import os
from decimal import Decimal

from dotenv import load_dotenv
from flask import Flask, jsonify, request
import psycopg2
from flask_cors import CORS

load_dotenv()

app = Flask(__name__)
app.json.sort_keys = False
CORS(app)

print("Tentando conectar ao PostgreSQL...")

conn = psycopg2.connect(
    host=os.getenv("DB_HOST", "localhost"),
    database=os.getenv("DB_NAME", "bd1"),
    user=os.getenv("DB_USER", "postgres"),
    password=os.getenv("DB_PASSWORD", ""),
    port=os.getenv("DB_PORT", "5432"),
)

print("Conectado com sucesso!")

def linhas_como_dicts(cur):
    """Converte o resultado da query em lista de dicts (coluna -> valor)."""
    colunas = [c[0] for c in cur.description]
    dados = []
    for row in cur.fetchall():
        item = {}
        for col, val in zip(colunas, row):
            item[col] = round(float(val), 2) if isinstance(val, Decimal) else val
        dados.append(item)
    return dados


@app.route("/")
def home():
    return "Servidor Flask + PostgreSQL funcionando!"

@app.route("/consulta1")
def consulta1():
    cur = conn.cursor()

    cur.execute("""
        SELECT 
            Id_Cliente, 
            nome, 
            email
        FROM Cliente
        WHERE Id_Cliente IN (
            SELECT Id_Cliente 
            FROM Contrato 
            WHERE Valor_Acordado >= 3000.00
        );
    """)

    dados = linhas_como_dicts(cur)
    cur.close()
    return jsonify(dados)

@app.route("/consulta2")
def consulta2():
    cur = conn.cursor()

    cur.execute("""
        SELECT cli.estado, AVG(c.Valor_Acordado) AS Media_Valor
        FROM Cliente cli
        INNER JOIN Contrato c ON cli.Id_Cliente = c.Id_Cliente
        GROUP BY cli.estado
        HAVING AVG(c.Valor_Acordado) > 1000.00;
    """)

    dados = linhas_como_dicts(cur)
    cur.close()

    return jsonify(dados)

@app.route("/consulta3")
def consulta3():
    cur = conn.cursor()

    cur.execute("""
        SELECT 
            f.Nome AS Nome_Funcionario, 
            f.Cargo, 
            d.Nome_Departamento, 
            d.Setor
        FROM Funcionario f
        INNER JOIN Departamento d 
        ON f.Nome_Departamento = d.Nome_Departamento;
    """)

    dados = linhas_como_dicts(cur)
    cur.close()

    return jsonify(dados)

@app.route("/consulta4")
def consulta4():
    cur = conn.cursor()

    cur.execute("""
        SELECT 
            cli.nome AS Nome_Cliente, 
            cli.telefone, 
            c.Id_Contrato, 
            c.Nome_Pacote
        FROM Cliente cli
        LEFT JOIN Contrato c 
        ON cli.Id_Cliente = c.Id_Cliente;
    """)

    dados = linhas_como_dicts(cur)
    cur.close()

    return jsonify(dados)

@app.route("/consulta5")
def consulta5():
    cur = conn.cursor()

    cur.execute("""
        SELECT 
            c.Id_Contrato, 
            c.Nome_Pacote, 
            c.Status_Pagamento
        FROM Contrato c
        WHERE EXISTS (
            SELECT 1
            FROM Recebe r
            WHERE r.Id_Contrato = c.Id_Contrato
        );
    """)

    dados = linhas_como_dicts(cur)
    cur.close()

    return jsonify(dados)

@app.route("/clientes", methods=["POST"])
def inserir_cliente():
    d = request.get_json(silent=True) or {}
    nome = (d.get("nome") or "").strip()
    if not nome:
        return jsonify({"erro": "O campo nome é obrigatório."}), 400

    campos = ["status", "email", "telefone", "cep", "rua",
              "numero", "cidade", "bairro", "estado"]
    valores = [(d.get(c) or "").strip() or None for c in campos]
    if valores[-1] and len(valores[-1]) != 2:
        return jsonify({"erro": "Estado deve ter 2 letras (ex: CE)."}), 400

    cur = conn.cursor()
    try:
        cur.execute(
            """
            INSERT INTO Cliente (nome, status, email, telefone, CEP, Rua,
                                 numero, cidade, bairro, estado)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
            RETURNING Id_Cliente;
            """,
            [nome] + valores,
        )
        novo_id = cur.fetchone()[0]
        conn.commit()
    except Exception as e:
        conn.rollback()
        return jsonify({"erro": str(e)}), 500
    finally:
        cur.close()
    return jsonify({"mensagem": "Cliente inserido.", "id_cliente": novo_id}), 201


@app.route("/clientes/<int:id_cliente>", methods=["DELETE"])
def remover_cliente(id_cliente):
    cur = conn.cursor()
    try:
        cur.execute("DELETE FROM Cliente WHERE Id_Cliente = %s;", (id_cliente,))
        apagados = cur.rowcount
        conn.commit()
    except psycopg2.errors.ForeignKeyViolation:
        conn.rollback()
        return jsonify({"erro": "Não é possível remover: o cliente possui contratos."}), 409
    except Exception as e:
        conn.rollback()
        return jsonify({"erro": str(e)}), 500
    finally:
        cur.close()
    if apagados == 0:
        return jsonify({"erro": "Cliente não encontrado."}), 404
    return jsonify({"mensagem": "Cliente removido."})


if __name__ == "__main__":
    app.run(debug=True)