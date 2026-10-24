const ROTULOS = {
    id_cliente: "ID cliente",
    id_contrato: "ID contrato",
    media_valor: "Média de valor",
    nome_funcionario: "Funcionário",
    nome_departamento: "Departamento",
    nome_cliente: "Cliente",
    nome_pacote: "Pacote",
    status_pagamento: "Status do pagamento",
};

function nomeColuna(c) {
    if (ROTULOS[c]) return ROTULOS[c];
    const t = c.replace(/_/g, " ");
    return t.charAt(0).toUpperCase() + t.slice(1);
}

function renderTabela(dados) {
    const box = document.getElementById("resultado-box");
    box.textContent = "";
    if (!Array.isArray(dados) || dados.length === 0) {
        box.textContent = "Nenhum resultado encontrado.";
        return;
    }
    const colunas = Object.keys(dados[0]);
    const tabela = document.createElement("table");
    const thead = tabela.createTHead().insertRow();
    colunas.forEach((c) => {
        const th = document.createElement("th");
        th.textContent = nomeColuna(c);
        thead.appendChild(th);
    });
    const tbody = tabela.createTBody();
    dados.forEach((linha) => {
        const tr = tbody.insertRow();
        colunas.forEach((c) => {
            tr.insertCell().textContent = linha[c] ?? "—";
        });
    });
    box.appendChild(tabela);
}

async function executarConsulta(rota) {
    try {
        const response = await fetch(`http://127.0.0.1:5000/${rota}`);
        const data = await response.json();
        renderTabela(data);
    } catch (error) {
        console.error(error);
        document.getElementById("resultado-box").textContent =
            "Erro ao consultar o servidor.";
    }
}

document.getElementById("consulta1").addEventListener("click", () => {
    executarConsulta("consulta1");
});

document.getElementById("consulta2").addEventListener("click", () => {
    executarConsulta("consulta2");
});

document.getElementById("consulta3").addEventListener("click", () => {
    executarConsulta("consulta3");
});

document.getElementById("consulta4").addEventListener("click", () => {
    executarConsulta("consulta4");
});

document.getElementById("consulta5").addEventListener("click", () => {
    executarConsulta("consulta5");
});

const API = "http://127.0.0.1:5000";

function mostrar(msg) {
    document.getElementById("resultado-box").textContent = msg;
}

document.getElementById("inserir").addEventListener("click", () => {
    document.getElementById("form-remover").hidden = true;
    document.getElementById("form-inserir").hidden = false;
});

document.getElementById("remover").addEventListener("click", () => {
    document.getElementById("form-inserir").hidden = true;
    document.getElementById("form-remover").hidden = false;
});

document.getElementById("cliente-form").addEventListener("submit", async (e) => {
    e.preventDefault();
    const dados = Object.fromEntries(new FormData(e.target));
    try {
        const r = await fetch(`${API}/clientes`, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(dados),
        });
        const j = await r.json();
        mostrar(r.ok ? `${j.mensagem} ID: ${j.id_cliente}` : `Erro: ${j.erro}`);
        if (r.ok) e.target.reset();
    } catch (err) {
        mostrar("Erro ao consultar o servidor.");
    }
});

document.getElementById("remover-form").addEventListener("submit", async (e) => {
    e.preventDefault();
    const id = new FormData(e.target).get("id");
    try {
        const r = await fetch(`${API}/clientes/${id}`, { method: "DELETE" });
        const j = await r.json();
        mostrar(r.ok ? j.mensagem : `Erro: ${j.erro}`);
        if (r.ok) e.target.reset();
    } catch (err) {
        mostrar("Erro ao consultar o servidor.");
    }
});