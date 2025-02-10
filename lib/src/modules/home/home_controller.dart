import 'package:guia_moteis/src/shared/models/motel_entity.dart';
import 'package:guia_moteis/src/shared/references/api_consult_interface.dart';
import 'package:guia_moteis/src/shared/services/api_consult_service.dart';

class HomeController {
  final IApiConsult apiService = ApiConsult();

  Future<List<MotelEntity>> buscarMoteis() async {
    List<MotelEntity> motels = [];

    try {
      motels = await apiService.buscaMoteis('https://jsonkeeper.com/b/1IXK');

      return motels;
    } catch (e) {
      rethrow;
    }
  }
}
