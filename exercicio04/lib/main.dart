// Exercicio 04 - Cadastro de Tarefas
// Permita cadastrar uma tarefa em uma lista dinâmica e removê-la por meio de um IconButton.

import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaTarefas(),
    );
  }
}

// 1. Precisa ser StatefulWidget porque a lista cresce e diminui
class TelaTarefas extends StatefulWidget {
  const TelaTarefas({super.key});

  @override
  State<TelaTarefas> createState() => _TelaTarefasState();
}

class _TelaTarefasState extends State<TelaTarefas> {
  final TextEditingController tarefaController = TextEditingController(); // ler o que o usuário vai digitar

  final List<String> tarefas = []; // lista inicia vazia

  void adicionarTarefa() { //função para add nova tarefa
    final String texto = tarefaController.text.trim();

    setState(() {
      tarefas.add(texto); // Adiciona na lista
    });
    tarefaController.clear(); // Limpa a caixinha de texto
  }

  // Função para remover uma tarefa pelo seu índice
  void removerTarefa(int index) {
    setState(() {
      tarefas.removeAt(index); // Remove o item da posição clicada
    });
  }

  @override
  void dispose() {
    tarefaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Tarefas')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: tarefaController,
              decoration: const InputDecoration(
                labelText: 'Nova Tarefa',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            // Botão de add tarefa
            ElevatedButton(
              onPressed: adicionarTarefa,
              child: const Text('Adicionar Tarefa'),
            ),
            const SizedBox(height: 20),

            // Expanded é obrigatório para o ListView funcionar dentro da Column
            Expanded(
              child: tarefas.isEmpty
                  ? const Center(child: Text('Nenhuma tarefa cadastrada.'))
                  : ListView.builder(
                      itemCount: tarefas.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: const Icon(Icons.check_circle_outline),
                            title: Text(
                              tarefas[index],
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            // IconButton para remover o item
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                removerTarefa(index);
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}