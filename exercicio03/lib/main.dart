// exercicio 03 - Lista de Livros
// Crie uma classe Aluno com nome e nota. Mostre nome no title e nota no subtitle.

import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

//Definição da classe
class Aluno {
  final String nome;
  final String nota;

  Aluno({
    required this.nome,
    required this.nota,
  });
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaAluno(),
    );
  }
}

class TelaAluno extends StatelessWidget {
  const TelaAluno({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Aluno> alunos = [
      Aluno(nome: 'Beatriz Almeida', nota: '9,0'),
      Aluno(nome: 'Lucas Fernandes', nota: '7,5'),
      Aluno(nome: 'Camila Rodrigues', nota: '8,2'),
      Aluno(nome: 'Rafael Silveira', nota: '6,8'),
      Aluno(nome: 'Mariana Duarte', nota: '10,0'),
      Aluno(nome: 'Gabriel Barbosa', nota: '5,5'),
      Aluno(nome: 'Juliana Castro', nota: '8,7'),
      Aluno(nome: 'Thiago Oliveira', nota: '7,0'),
      Aluno(nome: 'Larissa Moreira', nota: '9,4'),
      Aluno(nome: 'Felipe Santos', nota: '6,3'),
      Aluno(nome: 'Amanda Nogueira', nota: '8,9'),
      Aluno(nome: 'Bruno Carvalho', nota: '7,8'),
      Aluno(nome: 'Letícia Mendes', nota: '9,2'),
      Aluno(nome: 'Rodrigo Lima', nota: '4,5'),
      Aluno(nome: 'Fernanda Rocha', nota: '8,0'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Livros')),
      body: ListView.builder(
        padding: const EdgeInsets.all(18),
        itemCount: alunos.length,
        itemBuilder: (context, index) {
          final Aluno aluno = alunos[index];

          return Card(
            child: ListTile(
              leading: const Icon(
                Icons.grade,
                size: 35,
                color: Color.fromRGBO(1, 101, 233, 1),
              ),
              title: Text(
                aluno.nome,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(aluno.nota),
            ),
          );
        },
      ),
    );
  }
}

// final Aluno aluno = alunos[index];
// Aluno: a classe criada - o molde do objeto
// aluno: variável local temporária que guarda um único estudante desta linha
// alunos[index]: busca o item da lista 'alunos' na posição atual 'index' desenhada pelo builder