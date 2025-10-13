import 'package:flutter/material.dart';
import 'usuario.dart';
import 'tela_login.dart';
import 'restaurante.dart';
import 'tipo.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaLogin(),
    );
  }

  TelaLogin() {}
}

/*@override
  Widget build(BuildContext context) {
    Usuario u =  Usuario(
        codigo: 1,
        login: "pedro44",
        nome: "pedro",
        senha: "hackerbrabo"
    ); */