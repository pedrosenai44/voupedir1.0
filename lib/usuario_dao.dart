import 'database_helper.dart';
import 'usuario.dart';

class UsuarioDAO {
  final dbHelper = DatabaseHelper();

  /// Insere um novo usuário no banco
  Future<int> inserirUsuario(Usuario usuario) async {
    final db = await dbHelper.db;
    return await db.insert('usuario', {
      'nome': usuario.nome,
      'login': usuario.login,
      'senha': usuario.senha,
    });
  }

  /// Autentica usuário por login e senha
  Future<Usuario?> autenticar(String login, String senha) async {
    final db = await dbHelper.db;
    final result = await db.query(
      'usuario',
      where: 'login = ? AND senha = ?',
      whereArgs: [login, senha],
    );
    if (result.isNotEmpty) {
      final map = result.first;
      return Usuario(
        codigo: map['id'],
        nome: map['nome'],
        login: map['login'],
        senha: map['senha'],
      );
    }
    return null;
  }
}
