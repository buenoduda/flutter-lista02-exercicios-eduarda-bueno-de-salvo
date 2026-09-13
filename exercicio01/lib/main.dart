// exercicio 01 - Lista de Linguagens
// Crie uma List<String> com pelo menos oito linguagens e apresente-as com ListView.builder e ListTile

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaLinguagens(),
    );
  }
}

class TelaLinguagens extends StatelessWidget {
  const TelaLinguagens({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> linguagens = [
      'Flutter',
      'Python',
      'Java',
      'TypeScript',
      'C++',
      'Assembly',
      'R',
      'SQL',
      'Dart',
      'C',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Linguagens')),
      body: ListView.builder(
        itemCount: linguagens.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(
              Icons.code,
              size: 35,
              color: Color.fromRGBO(0, 103, 79, 1.0),
            ),
            title: Text(
              linguagens[index],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
    );
  }
}

// Usamos const em Widgets com valores fixos para criá-los na compilação e economizar memória.
// Widgets dinâmicos — como Text(linguagens[index]) — mudam em execução e não podem receber const.