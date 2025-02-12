import 'package:guia_moteis/src/shared/models/motel_entity.dart';

abstract class IApiConsult {
  Future<List<MotelEntity>> buscaMoteis(String url);
}
