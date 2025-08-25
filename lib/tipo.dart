class Tipo {
  int? _codigo;
  String? _nome;

  Tipo({int? codigo, String? nome}) {
    _codigo = codigo;
    _nome = nome;
  }

//os getters
  int? get codigo => _codigo;

  String? get nome => _nome;

//os setters
  set codigo(int? codigo) => _codigo = codigo;

  set nome(String? nome) => _nome = nome;
}