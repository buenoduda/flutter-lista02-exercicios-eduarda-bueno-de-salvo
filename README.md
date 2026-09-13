# Lista 2 de Exercícios - Flutter: Listas, Cards e Conteúdo Dinâmico

Repositório dedicado ao desenvolvimento e entrega da **Lista 2 de Exercícios Práticos de Flutter**, cobrindo a renderização de coleções em memória, widgets estruturados (`Card` e `ListTile`) e manipulação de estado dinâmico com inserção e remoção de itens.

---

## 👤 Identificação do Aluno

- **Nome Completo:** Eduarda Bueno de Salvo
- **Disciplina:** Programação para Dispositivos Móveis
- **Ambiente de Desenvolvimento:** Visual Studio Code (VS Code) & Flutter SDK
- **Plataforma de Testes:** Google Chrome (Web)

---

## 🎯 Objetivo e Escopo da Atividade

Evoluir a construção de interfaces reativas no Flutter, saindo do modelo de valores primitivos isolados (da Lista 1) para a representação visual direta de coleções de dados:

Coleção em Memória (Dart) -> ListView / ListView.builder -> Widgets de Apresentação (Card + ListTile)

### ⚠️ Limites do Escopo:
Em conformidade com as orientações do professor para este módulo, **não foram utilizados**:
- Navegação entre telas (`Navigator.push` / `Navigator.pop`).
- Interações de toque avançadas (`onTap` em `ListTile`).
- Mensagens flutuantes (`SnackBar`).
- Validações complexas de formulário com `Form` e `TextFormField`.

---

## 📖 Manual Prático: O que foi aprendido?

Este projeto serviu como guia prático para consolidar os tópicos:

## 1. Rolagem com `ListView`

## 2. Otimização com `ListView.builder`
- **Propriedades centrais:**
  - `itemCount`: (ex: `lista.length`).
  - `itemBuilder: (context, index)`: Função executada para cada item, onde `index` (0, 1, 2...) permite recuperar o dado correspondente via `lista[index]`.

## 3. Organização Visual com `Card` e `ListTile`

## 4. Modelagem com Classes (`List<Objeto>`)

## 5. Conteúdo Dinâmico e o uso do `Expanded`
- A lista é guardada no estado de um `StatefulWidget` e inicia vazia (`final List<Produto> produtos = [];`).
- **`add()`:** Insere novos objetos na coleção dentro de um `setState()`.
- **`removeAt(index)`:** Remove o item da posição exata clicada no `trailing`.
- **`isEmpty`:** Operador ternário que exibe uma mensagem amigável no centro da tela caso a coleção esteja zerada.
- **Obrigatório: `Expanded`:** Quando utilizamos `TextField` e `ListView` juntos dentro de uma `Column`, o `Expanded` é indispensável para delimitar a altura da lista, evitando o erro de altura infinita (*unbounded height*).

---

## 📁 Estrutura de Pastas do Repositório

```text
flutter-lista-listas-cards/
├── README.md
├── exercicio01/       # 01 - Lista de Linguagens (List<String> + ListView.builder + ListTile)
├── exercicio02/       # 02 - Catálogo de Livros (Modelagem de classe Livro + Card)
├── exercicio03/       # 03 - Lista de Alunos (Classe Aluno com title e subtitle)
├── exercicio04/       # 04 - Cadastro de Tarefas (Lista dinâmica com add e removeAt)
└── exercicio05/       # 05 - Controle de Estoque (Classe Produto, Expanded e isEmpty)
```

---

## 🚀 Como Executar Localmente

### Pré-requisitos
- [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado e configurado nas variáveis de ambiente.
- Visual Studio Code com as extensões oficiais **Flutter** e **Dart**.

### Passo a passo para testar:
1. Clone este repositório no seu computador:
   ```bash
   git clone https://github.com/[seu-usuario]/flutter-lista-listas-cards.git
   ```
2. Abra a pasta do repositório no VS Code:
   ```bash
   code flutter-lista-listas-cards
   ```
3. Acesse a pasta do exercício desejado e execute a aplicação:
   ```bash
   cd exercicio05
   flutter pub get
   flutter run
   ```

---

## 📌 Guia Rápido de Versionamento (Git)

Comandos utilizados no terminal do VS Code para salvar e sincronizar o progresso no GitHub:

```bash
# 1. Preparar alterações para o commit
git add .

# 2. Registrar commit descritivo
git commit -m "feat: conclui exercicios da lista 2 de listas e cards"

# 3. Enviar alterações para o repositório remoto
git push
```