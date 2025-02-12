import 'package:flutter/material.dart';
import 'package:guia_moteis/src/shared/colors.dart';
import 'package:guia_moteis/src/shared/models/motel_entity.dart';
import 'package:guia_moteis/src/shared/models/suite_entity.dart';
import 'package:guia_moteis/src/shared/screen_utils.dart';

class HighlightMotel extends StatelessWidget {
  const HighlightMotel({
    super.key,
    required this.suite,
    required this.motel,
  });

  final MotelEntity motel;
  final SuiteEntity suite;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil.blockSizeHorizontal * 1,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(ScreenUtil.getRadiusBotoes(2)),
            color: Colors.white,
          ),
          height: ScreenUtil.screenHeight * 0.23,
          width: ScreenUtil.screenWidth * 0.912,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil.blockSizeHorizontal * 2,
                  vertical: ScreenUtil.blockSizeVertical * 1,
                ),
                width: ScreenUtil.screenWidth * 0.4,
                height: ScreenUtil.screenHeight,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(ScreenUtil.getRadiusBotoes(2)),
                  child: Image.network(suite.fotos[0], fit: BoxFit.fill),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: ScreenUtil.blockSizeVertical * 2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '🔥 ${motel.fantasia}',
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: ScreenUtil.blockSizeHorizontal * 5,
                        bottom: ScreenUtil.blockSizeVertical * 1,
                      ),
                      child: Text(
                        motel.bairro,
                        style: const TextStyle(
                          fontSize: 8,
                        ),
                      ),
                    ),
                    Container(
                      width: ScreenUtil.screenWidth * 0.31,
                      color: greyColor,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: ScreenUtil.blockSizeVertical * 0.5,
                              left: ScreenUtil.blockSizeHorizontal * 5,
                              right: ScreenUtil.blockSizeHorizontal * 5,
                            ),
                            child: Text(
                              '${suite.periodos.firstWhere((element) => element.desconto > 0).desconto.toStringAsFixed(0)}% de desconto',
                              style: const TextStyle(
                                fontSize: 10,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: ScreenUtil.blockSizeVertical * 0.5,
                              horizontal: ScreenUtil.blockSizeHorizontal * 3,
                            ),
                            child: Container(
                              width: ScreenUtil.screenWidth * 0.4,
                              height: 1,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: ScreenUtil.blockSizeHorizontal * 5,
                              right: ScreenUtil.blockSizeHorizontal * 5,
                              bottom: ScreenUtil.blockSizeVertical * 0.5,
                            ),
                            child: Text(
                              'A partir de R\$ ${suite.periodos.firstWhere((element) => element.desconto > 0).valorTotal.toStringAsFixed(2).replaceAll('.', ',')}',
                              style: const TextStyle(
                                fontSize: 8,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil.screenHeight * 0.03,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: greenButton,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              onPressed: () =>
                                  debugPrint('Pressionou em reservar'),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'reservar',
                                    style: TextStyle(
                                      fontSize: 8,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: ScreenUtil.blockSizeHorizontal,
                                    ),
                                    child: const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 8,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
