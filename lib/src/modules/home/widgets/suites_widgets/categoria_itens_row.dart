import 'package:flutter/material.dart';
import 'package:guia_moteis/src/modules/home/home_controller.dart';
import 'package:guia_moteis/src/shared/models/suite_entity.dart';
import 'package:guia_moteis/src/shared/screen_utils.dart';

class CategoriaItensRow extends StatelessWidget {
  CategoriaItensRow({super.key, required this.suite});

  final SuiteEntity suite;
  final HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Padding(
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
        padding: EdgeInsets.symmetric(vertical: ScreenUtil.blockSizeVertical),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: controller.createSuitesCategoriaItensRow(suite),
        ),
      ),
    );
  }
}
