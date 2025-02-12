import 'package:flutter/material.dart';
import 'package:guia_moteis/src/shared/models/suite_entity.dart';

class MotelEntity extends ChangeNotifier {
  final String fantasia;
  final String logo;
  final String bairro;
  final double distancia;
  final int qtdFavoritos;
  final List<SuiteEntity> suites;
  final int qtdAvaliacoes;
  final double media;

  MotelEntity({
    required this.fantasia,
    required this.logo,
    required this.bairro,
    required this.distancia,
    required this.qtdFavoritos,
    required this.suites,
    required this.qtdAvaliacoes,
    required this.media,
  });

  factory MotelEntity.fromJson(Map<String, dynamic> json) {
    return MotelEntity(
      fantasia: json['fantasia'],
      logo: json['logo'],
      bairro: json['bairro'],
      distancia: json['distancia'],
      qtdFavoritos: json['qtdFavoritos'],
      suites: List<SuiteEntity>.from(
        (json['suites'] as List).map((x) => SuiteEntity.fromJson(x)),
      ),
      qtdAvaliacoes: json['qtdAvaliacoes'],
      media: json['media'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fantasia': fantasia,
      'logo': logo,
      'bairro': bairro,
      'distancia': distancia,
      'qtdFavoritos': qtdFavoritos,
      'suites': List<dynamic>.from(suites.map((x) => x.toJson())),
      'qtdAvaliacoes': qtdAvaliacoes,
      'media': media,
    };
  }
}
