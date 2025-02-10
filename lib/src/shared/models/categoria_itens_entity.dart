class CategoriaItensEntity {
  final String nome;
  final String icone;

  CategoriaItensEntity({
    required this.nome,
    required this.icone,
  });

  factory CategoriaItensEntity.fromJson(Map<String, dynamic> json) {
    return CategoriaItensEntity(
      nome: json['nome'],
      icone: json['icone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'icone': icone,
    };
  }
}
