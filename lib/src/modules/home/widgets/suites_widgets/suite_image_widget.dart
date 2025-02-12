import 'package:flutter/material.dart';
import 'package:guia_moteis/src/shared/models/suite_entity.dart';
import 'package:guia_moteis/src/shared/screen_utils.dart';

class SuiteImage extends StatelessWidget {
  const SuiteImage({super.key, required this.suite});

  final SuiteEntity suite;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil.blockSizeHorizontal * 2,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil.blockSizeHorizontal * 2,
          vertical: ScreenUtil.blockSizeVertical,
        ),
        height: ScreenUtil.screenHeight * 0.35,
        width: ScreenUtil.screenWidth * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(ScreenUtil.getRadiusBotoes(1)),
          color: Colors.white,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(ScreenUtil.getRadiusBotoes(1)),
              child: Image.network(
                suite.fotos[0],
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil.blockSizeHorizontal * 5,
                vertical: ScreenUtil.blockSizeVertical * 2,
              ),
              child: Text(suite.nome),
            ),
          ],
        ),
      ),
    );
  }
}
