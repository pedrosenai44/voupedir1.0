import 'package:flutter/material.dart';

class TelaHome extends StatelessWidget{
  TelaHome ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text ("seja bem vindo usuário:")),
      body: const Center(
        child: Text("Tela de Home"),
      ),
    );

  }
}