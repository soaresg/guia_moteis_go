import 'package:flutter/material.dart';
import 'package:guia_moteis/src/shared/models/motel_entity.dart';
import 'package:guia_moteis/src/shared/references/api_consult_interface.dart';
import 'package:guia_moteis/src/shared/services/api_consult_service.dart';

class MotelList extends ChangeNotifier {
  List<MotelEntity> itens = [];

  void add(MotelEntity motelEntity) {
    itens.add(motelEntity);
    notifyListeners();
  }

  void addAll(List<MotelEntity> listMotelEntity) {
    itens.addAll(listMotelEntity);
    notifyListeners();
  }

  Future<void> updateMotelList(String url) async {
    IApiConsult apiConsult = ApiConsult();

    try {
      itens.clear();

      itens.addAll(await apiConsult.buscaMoteis(url));
    } catch (e) {
      throw Exception('Error getting data from the API');
    }
  }
}
