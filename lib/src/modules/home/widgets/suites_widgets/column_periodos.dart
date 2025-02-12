import 'package:flutter/material.dart';
import 'package:guia_moteis/src/shared/colors.dart';
import 'package:guia_moteis/src/shared/models/suite_entity.dart';
import 'package:guia_moteis/src/shared/screen_utils.dart';

class ColumnPeriodos extends StatelessWidget {
  const ColumnPeriodos({super.key, required this.suite});

  final SuiteEntity suite;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: suite.periodos
          .map(
            (p) => Padding(
              padding: EdgeInsets.symmetric(
                vertical: ScreenUtil.blockSizeVertical * 0.5,
                horizontal: ScreenUtil.blockSizeHorizontal * 2,
              ),
              child: Container(
                width: ScreenUtil.screenWidth * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(ScreenUtil.getRadiusBotoes(1)),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: ScreenUtil.blockSizeVertical,
                  horizontal: ScreenUtil.blockSizeHorizontal * 4,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: ScreenUtil.blockSizeVertical * 0.5,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(p.tempoFormatado),
                              Visibility(
                                visible: p.desconto > 0,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: ScreenUtil.blockSizeHorizontal,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(
                                      ScreenUtil.blockSizeHorizontal,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: greenPromo,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          ScreenUtil.getRadiusBotoes(20)),
                                    ),
                                    child: Text(
                                      '${p.desconto.toStringAsFixed(0)}% off',
                                      style: TextStyle(
                                        fontSize: 8,
                                        color: greenPromo,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  right: ScreenUtil.blockSizeHorizontal * 2),
                              child: Text(
                                'R\$ ${p.valor.toStringAsFixed(2).replaceAll('.', ',')}',
                                style: TextStyle(
                                  color:
                                      p.desconto > 0 ? greyColor : Colors.black,
                                  decoration: p.desconto > 0
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                ),
                              ),
                            ),
                            Visibility(
                              visible: p.desconto > 0,
                              child: Text(
                                'R\$ ${p.valor.toStringAsFixed(2).replaceAll('.', ',')}',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
