import 'dart:convert';

import 'package:guia_moteis/src/shared/models/motel_entity.dart';
import 'package:guia_moteis/src/shared/references/api_consult_interface.dart';
import 'package:http/http.dart' as http;

class ApiConsult implements IApiConsult {
  @override
  Future<List<MotelEntity>> buscaMoteis(String url) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json;charset=UTF-8'},
      );

      if (response.statusCode == 200) {
        final dynamic returnMoteis =
            jsonDecode(utf8.decode(response.bodyBytes));
        List<MotelEntity> moteis = [];

        if (returnMoteis['sucesso']) {
          moteis = List<MotelEntity>.from(
              (returnMoteis['data']['moteis'] as List)
                  .map((x) => MotelEntity.fromJson(x)));

          return moteis;
        } else {
          throw Exception('Erro ao obter dados da API.');
        }
      } else {
        throw Exception('Error getting data from API: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error fetching data from API: $e');
    }
  }
}
