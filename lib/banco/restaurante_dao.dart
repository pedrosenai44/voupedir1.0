import 'dart:async';
import 'package:pedrohenrique/banco/database_helper.dart';
import 'package:pedrohenrique/restaurante.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:pedrohenrique/tipo.dart';

class RestauranteDAO{

static Future<List<Restaurante>> listarTodos() async{
  final db = await DatabaseHelper.getDatabase();
  final resultado = await db.query('tb_restaurante');
    return resultado.map((mapa){
      return Restaurante(
        codigo: mapa['cd_restaurante']as int,
        nome: mapa['nm_restaurante']as String,
      );
    }).toList();
  }
}