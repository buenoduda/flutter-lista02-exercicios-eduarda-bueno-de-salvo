// Exercicio 05 - Estoque Simples
// Crie Produto com nome, preço e quantidade. Cadastre itens e exiba os dados em Cards; a lista deve mostrar uma mensagem quando estiver vazia

import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

// Definindo a classe Produto com nome, preço e quantidade
class Produto {
  final String nome;
  final double preco;
  final int quantidade;

  Produto({
    required this.nome,
    required this.preco,
    required this.quantidade,
  });
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaEstoque(),
    );
  }
}

class TelaEstoque extends StatefulWidget {
  const TelaEstoque({super.key});

  @override
  State<TelaEstoque> createState() => _TelaEstoqueState();
}

class _TelaEstoqueState extends State<TelaEstoque> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController precoController = TextEditingController();
  final TextEditingController quantidadeController = TextEditingController();

  // 2. Lista dinâmica do tipo Produto iniciando vazia
  final List<Produto> estoque = [];

  void adicionarProduto() {
    final String nome = nomeController.text.trim();
    final double preco = double.tryParse(precoController.text.replaceAll(',', '.')) ?? 0;
    final int qtde = int.tryParse(quantidadeController.text) ?? 0;

    // Validação básica para evitar cadastros vazios
    if (nome.isEmpty || preco <= 0 || qtde <= 0) return;

    setState(() {
      estoque.add(
        Produto(
          nome: nome,
          preco: preco,
          quantidade: qtde,
        ),
      );
    });

    nomeController.clear();
    precoController.clear();
    quantidadeController.clear();
  }

  void removerProduto(int index) {
    setState(() {
      estoque.removeAt(index);
    });
  }

  void limparCampos() {
    nomeController.clear();
    precoController.clear();
    quantidadeController.clear();
  }

  @override
  void dispose() {
    nomeController.dispose();
    precoController.dispose();
    quantidadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Estoque')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Produto',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: precoController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Preço Unitário (R\$)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: quantidadeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantidade',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: adicionarProduto,
                  child: const Text('Adicionar Produto'),
                ),
                const SizedBox(width: 15),
                ElevatedButton(
                  onPressed: limparCampos,
                  child: const Text('Limpar'),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Expanded(
              child: estoque.isEmpty // mostrando mensagem caso a lista estiver vazia
                  ? const Center(
                      child: Text(
                        'Nenhum produto cadastrado.',
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      itemCount: estoque.length,
                      itemBuilder: (context, index) {
                        final Produto produto = estoque[index];

                        return Card(
                          child: ListTile(
                            leading: const Icon(
                              Icons.inventory_2_outlined,
                              size: 35,
                              color: Color.fromRGBO(0, 103, 79, 1.0),
                            ),
                            title: Text(
                              produto.nome,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'R\$ ${produto.preco.toStringAsFixed(2)} | Estoque: ${produto.quantidade}',
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                removerProduto(index);
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