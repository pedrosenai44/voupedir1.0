import 'package:pedrohenrique/banco/database_helper.dart';
import 'package:pedrohenrique/tipo.dart';

class tipodao{

  static Future<List<Tipo>> listarTipos() async{
    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.query('tb_tipo');

    return resultado.map((mapa){
      return Tipo(
        codigo: mapa['cd_tipo'] as int,
        nome: mapa['nm_tipo'] as String
      );
    }).toList();
  }
}