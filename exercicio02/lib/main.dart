// exercicio 02 - Lista de Livros
// Crie uma classe Livro com título e autor. Apresente uma List<Livro> em Cards.

import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

//Definição da classe Livro 
class Livro {
  final String titulo;
  final String autor;

  Livro({
    required this.titulo,
    required this.autor,
  });
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaLivros(),
    );
  }
}

class TelaLivros extends StatelessWidget {
  const TelaLivros({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Livro> livros = [
      Livro(titulo: 'Jogos Vorazes', autor: 'Suzanne Collins'),
      Livro(titulo: 'Harry Potter', autor: 'J.K. Rowling'),
      Livro(titulo: 'Maze Runner: Correr ou Morrer', autor: 'James Dashner'),
      Livro(titulo: 'Divergente', autor: 'Veronica Roth'),
      Livro(titulo: 'A Hipótese do Amor', autor: 'Ali Hazelwood'),
      Livro(titulo: 'O Acordo', autor: 'Elle Kennedy'),
      Livro(titulo: 'Melhor do que nos Filmes', autor: 'Lynn Painter'),
      Livro(titulo: 'Amor, Teoricamente', autor: 'Ali Hazelwood'),
      Livro(titulo: 'Leitura de Verão', autor: 'Emily Henry'),
      Livro(titulo: 'Manual de Assassinato para Boas Garotas', autor: 'Holly Jackson'),
      Livro(titulo: 'O Príncipe Cruel', autor: 'Holly Black'),
      Livro(titulo: 'A Seleção', autor: 'Kiera Cass'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Livros')),
      body: ListView.builder(
        padding: const EdgeInsets.all(18),
        itemCount: livros.length,
        itemBuilder: (context, index) {
          final Livro livro = livros[index];

          return Card(
            child: ListTile(
              leading: const Icon(
                Icons.book_rounded,
                size: 35,
                color: Color.fromRGBO(202, 29, 144, 1.0),
              ),
              title: Text(
                livro.titulo,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(livro.autor),
            ),
          );
        },
      ),
    );
  }
}