import 'dart:async';
import 'package:pedrohenrique/banco/database_helper.dart';
import 'package:pedrohenrique/banco/usuario_dao.dart';
import 'package:pedrohenrique/restaurante.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:pedrohenrique/tipo.dart';

class RestauranteDAO {

  static Future<List<Restaurante>> listarTodos() async {
    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.query('tb_restaurante',
        where: 'cd_usuario = ?',
        whereArgs: [UsuarioDAO.usuariologado.codigo]
    );
    return resultado.map((mapa) {
      return Restaurante(
        codigo: mapa['cd_restaurante'] as int,
        nome: mapa['nm_restaurante'] as String,
      );
    }).toList();
  }


  static Future<int> cadastrarRestaurante(TextEditingController nomeRestaurante,
      TextEditingController latitude,
      TextEditingController longitude,
      int? tipo) async {
    final db = await DatabaseHelper.getDatabase();
    final dadosRestaurante = {
      'cd_tipo': tipo,
      'nm_restaurante': nomeRestaurante.text,
      'latitude_restaurante': latitude.text,
      'longitude_restaurante': longitude.text,
      'cd_usuario': UsuarioDAO.usuariologado.codigo
    };
    try {
      final idRestaurante = await db.insert('tb_restaurante', dadosRestaurante);
      return idRestaurante;
    } catch (e) {
      print("Erro ao cadastrar restaurante: $e");
      return -1;
    }
  }
}
