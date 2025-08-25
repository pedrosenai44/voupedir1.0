import 'database_helper.dart';
import 'restaurante.dart';

class RestauranteDAO {
  final dbHelper = DatabaseHelper();

  /// Insere restaurante no banco
  Future<int> inserir(Restaurante restaurante) async {
    final db = await dbHelper.db;
    return await db.insert('restaurante', {
      'nome': restaurante.nome,
      'latitude': restaurante.latitude,
      'longitude': restaurante.longitude,
      'usuario_id': restaurante.proprietario?.codigo,
      'tipo_id': restaurante.tipo?.codigo,
    });
  }

  /// Lista todos os restaurantes
  Future<List<Restaurante>> listar() async {
    final db = await dbHelper.db;
    final maps = await db.query('restaurante');
    return maps.map((map) {
      return Restaurante(
        codigo: map['id'],
        nome: map['nome'],
        latitude: map['latitude'],
        longitude: map['longitude'],
        // Os objetos Usuario e Tipo podem ser buscados separadamente se necessário
        proprietario: null,
        tipo: null,
      );
    }).toList();
  }

  /// Atualiza restaurante
  Future<int> atualizar(Restaurante restaurante) async {
    final db = await dbHelper.db;
    return await db.update(
      'restaurante',
      {
        'nome': restaurante.nome,
        'latitude': restaurante.latitude,
        'longitude': restaurante.longitude,
        'usuario_id': restaurante.proprietario?.codigo,
        'tipo_id': restaurante.tipo?.codigo,
      },
      where: 'id = ?',
      whereArgs: [restaurante.codigo],
    );
  }

  /// Deleta restaurante
  Future<int> deletar(int id) async {
    final db = await dbHelper.db;
    return await db.delete('restaurante', where: 'id = ?', whereArgs: [id]);
  }
}

