import 'package:flutter/material.dart';

class TelaCadRestaurante extends StatelessWidget{
  TelaCadRestaurante({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Restaurante')),
      body:  Padding(padding: const EdgeInsets.all(24),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Informações Do Restaurante: "),
      SizedBox(height: 30),
      Text("Tipo de Comida: "),
      DropdownButtonFormField(items: [
      DropdownMenuItem(value: 'Japonesa', child: Text('Japonesa')),
      DropdownMenuItem(value: 'Italiana', child: Text("Italiana")),
        DropdownMenuItem(value: 'Brasileira', child: Text('Brasileira')),
    ], onChanged: (value){}),
      TextFormField(
        decoration: const InputDecoration(hintText: 'Nome do Restauarnte'),
        validator: (String? value) {}
      ),
      TextFormField(
          decoration: const InputDecoration(hintText: 'Latitude'),
          validator: (String? value) {}
      ),
      TextFormField(
          decoration: const InputDecoration(hintText: 'Longitude'),
          validator: (String? value) {}
      ),
      SizedBox(height: 50),
      ElevatedButton(onPressed: (){}, child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(Icons.save),
    Text("Cadastrar")
    ],
      )),
    ],
    ),
      ),
    );
  }
}