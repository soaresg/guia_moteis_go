import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis/src/core/model/motel_list_model.dart';
import 'package:guia_moteis/src/core/my_http_overrides.dart';
import 'package:guia_moteis/src/shared/models/motel_entity.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();

  test('Motel List Update', () async {
    MotelList motelList = MotelList();

    await motelList.updateMotelList('https://jsonkeeper.com/b/1IXK');

    expect(motelList.itens, isInstanceOf<List<MotelEntity>>());
  });
}
