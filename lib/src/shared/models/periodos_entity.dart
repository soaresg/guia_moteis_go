class PeriodosEntity {
  final String tempoFormatado;
  final String tempo;
  final double valor;
  final double valorTotal;
  final bool temCortesia;
  final double desconto;

  PeriodosEntity({
    required this.tempoFormatado,
    required this.tempo,
    required this.valor,
    required this.valorTotal,
    required this.temCortesia,
    required this.desconto,
  });

  factory PeriodosEntity.fromJson(Map<String, dynamic> json) {
    return PeriodosEntity(
      tempoFormatado: json['tempoFormatado'],
      tempo: json['tempo'],
      valor: json['valor'],
      valorTotal: json['valorTotal'],
      temCortesia: json['temCortesia'],
      desconto: json['desconto'] != null ? json['desconto']['desconto'] : 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tempoFormatado': tempoFormatado,
      'tempo': tempo,
      'valor': valor,
      'valorTotal': valorTotal,
      'temCortesia': temCortesia,
      'desconto': desconto,
    };
  }
}
