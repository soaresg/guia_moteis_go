import 'package:guia_moteis/src/shared/models/categoria_itens_entity.dart';
import 'package:guia_moteis/src/shared/models/periodos_entity.dart';

class SuiteEntity {
  String nome;
  int qtd;
  bool exibirQtdDisponivel;
  List<String> fotos;
  List<String> itens;
  List<CategoriaItensEntity> categoriaItens;
  List<PeriodosEntity> periodos;

  SuiteEntity({
    required this.nome,
    required this.qtd,
    required this.exibirQtdDisponivel,
    required this.fotos,
    required this.itens,
    required this.categoriaItens,
    required this.periodos,
  });

  factory SuiteEntity.fromJson(Map<String, dynamic> json) {
    return SuiteEntity(
      nome: json['nome'],
      qtd: json['qtd'],
      exibirQtdDisponivel: json['exibirQtdDisponiveis'],
      fotos: List<String>.from((json['fotos'] as List).map((x) => x)),
      itens: List<String>.from((json['itens'] as List).map((x) => x['nome'])),
      categoriaItens: List<CategoriaItensEntity>.from(
        (json['categoriaItens'] as List)
            .map((x) => CategoriaItensEntity.fromJson(x)),
      ),
      periodos: List<PeriodosEntity>.from(
        (json['periodos'] as List).map((x) => PeriodosEntity.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'qtd': qtd,
      'exibirQtdDisponivel': exibirQtdDisponivel,
      'fotos': fotos,
      'itens': itens,
      'categoriaItens':
          List<dynamic>.from(categoriaItens.map((x) => x.toJson())),
      'periodos': List<dynamic>.from(periodos.map((x) => x.toJson())),
    };
  }
}
