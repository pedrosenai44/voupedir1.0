import 'package:flutter/material.dart';
import 'usuario.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    Usuario u =  Usuario(
      codigo: 1,
      login: "pedro44",
        nome: "pedro",
      senha: "hackerbrabo"
    );
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: const Text("Meus Dados"),
      ),
      body: Center(
        child: Padding(padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Text("Nome: ${u.nome}"),
              Text("Código:${u.codigo}"),
              Text("Login:${u.login}"),
              Text("Senha:${u.senha}"),
          ],
    ),
      ),
      ),
    ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
