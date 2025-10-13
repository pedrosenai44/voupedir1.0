import 'package:flutter/material.dart';
import 'package:pedrohenrique/banco/restaurante_dao.dart';
import 'package:pedrohenrique/banco/tipo_dao.dart';
import 'package:pedrohenrique/tipo.dart';

class TelaCadRestaurante extends StatefulWidget {
  TelaCadRestaurante({super.key});

  @override
  State<StatefulWidget> createState() {
    return TelaCadRestaurantesState();
  }
}

class TelaCadRestaurantesState extends State<TelaCadRestaurante> {
  final TextEditingController nomecontroller = TextEditingController();
  final TextEditingController latitudecontroller = TextEditingController();
  final TextEditingController longitudecontroller = TextEditingController();
  String? culinariaSelecionada;

  List<Tipo> tiposCulinaria = [];
  int? tipoCulinaria;

  @override
  void initState() {
    super.initState();
    carregarTipos();
  }

  Future<void> carregarTipos() async {
    final lista = await TipoDao.listarTipos();
    setState(() {
      tiposCulinaria = lista;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Restaurante')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Informações Do Restaurante: "),
            const SizedBox(height: 30),
            const Text("Tipo de Comida: "),
            DropdownButtonFormField<String>(
                value: culinariaSelecionada,
                items: tiposCulinaria.map((tipo) {
                  return DropdownMenuItem<String>(
                    value: tipo.nome,
                    child: Text(tipo.nome?? ''),
                  );
                }).toList(),
                onChanged: (String? novaCulinaria) {
                  setState(() {
                    culinariaSelecionada = novaCulinaria;
                    Tipo tipoSelecionado = tiposCulinaria.firstWhere(
                          (tipo) => tipo.nome == novaCulinaria,
                    );
                    tipoCulinaria = tipoSelecionado.codigo;
                  });
                }),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Nome do Restaurante'),
              validator: (String? value) {},
              controller: nomecontroller,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Latitude'),
              validator: (String? value) {},
              controller: latitudecontroller,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Longitude'),
              validator: (String? value) {},
              controller: longitudecontroller,
            ),
            const SizedBox(height: 50),
            ElevatedButton(
                onPressed: () async {
                  final sucesso = await RestauranteDAO.cadastrarRestaurante(
                    nomecontroller,
                    latitudecontroller,
                    longitudecontroller,
                    tipoCulinaria,
                  );
                  String msg = 'ERRO: restaurante não cadastrado.';
                  Color corFundo = Colors.red;
                  if (sucesso > 0) {
                    msg = '"${nomecontroller.text}" cadastrado! ID: $sucesso';
                    corFundo = Colors.green;
                  }
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(msg),
                    backgroundColor: corFundo,
                    duration: const Duration(seconds: 5),
                  ));
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.save), Text("Cadastrar")],
                )),
          ],
        ),
      ),
    );
  }
}