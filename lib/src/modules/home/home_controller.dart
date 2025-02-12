import 'package:flutter/material.dart';
import 'package:guia_moteis/src/modules/home/widgets/suites_widgets/ver_todas_button.dart';
import 'package:guia_moteis/src/shared/colors.dart';
import 'package:guia_moteis/src/shared/models/motel_entity.dart';
import 'package:guia_moteis/src/shared/models/suite_entity.dart';
import 'package:guia_moteis/src/shared/references/api_consult_interface.dart';
import 'package:guia_moteis/src/shared/screen_utils.dart';
import 'package:guia_moteis/src/shared/services/api_consult_service.dart';

class HomeController {
  final IApiConsult apiService = ApiConsult();
  int currentCarrouselIndex = 0;
  List<String> filterList = [
    'filtros',
    'com desconto',
    'disponíveis',
    'hidro',
    'piscina',
    'sauna',
    'ofurô',
    'decoração erótica',
    'decoração temática',
    'cadeira erótica',
    'pista de dança',
    'garagem privativa',
    'frigobar',
    'internet wi-fi',
    'suite para festas',
    'suite com acessibilidade',
  ];

  List<Widget> createSuitesCategoriaItensRow(SuiteEntity suite) {
    List<Widget> rowWidgets = suite.categoriaItens.map(
      (i) {
        if (suite.categoriaItens.indexOf(i) < 5) {
          return GestureDetector(
            onTap: () =>
                debugPrint('Usuário pressionou a categoria: ${i.nome}'),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil.blockSizeHorizontal),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(ScreenUtil.getRadiusBotoes(1)),
                  color: greyColor,
                ),
                child: Image.network(
                  i.icone,
                  scale: 4,
                ),
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    ).toList();

    if (rowWidgets.length >= suite.categoriaItens.length) {
      rowWidgets.add(VerTodosButton());
    }

    return rowWidgets;
  }

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
