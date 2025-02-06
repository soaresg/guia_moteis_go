import 'package:flutter/widgets.dart';

class ScreenUtil {
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;
  static double blockSizeHorizontal = 0.0;
  static double blockSizeVertical = 0.0;
  static bool wideScreen = false;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    wideScreen = (screenWidth / screenHeight) > 1;
  }

  static double getFontPequena(double fontSize) {
    return blockSizeVertical * (fontSize / 6);
  }

  static double getFontMedia(double fontSize) {
    return blockSizeVertical * (fontSize / 4);
  }

  static double getFontGrande(double fontSize) {
    return blockSizeVertical * (fontSize / 2);
  }

  static double getHeightPequeno(double height) {
    return blockSizeVertical * (height / 4);
  }

  static double getHeightMedio(double height) {
    return blockSizeVertical * (height / 3);
  }

  static double getHeightGrande(double height) {
    return blockSizeVertical * (height / 2);
  }

  static double getWidthPequeno(double width) {
    return blockSizeHorizontal * (width / 8);
  }

  static double getWidthMedio(double width) {
    return blockSizeHorizontal * (width / 5);
  }

  static double getWidthGrande(double width) {
    return blockSizeHorizontal * (width / 3);
  }

  static SizedBox getSizedBoxHeight(double height) {
    return SizedBox(
        height: getHeightMedio(height)); // Por exemplo, altura média
  }

  static SizedBox getSizedBoxWidth(double width) {
    return SizedBox(width: getWidthMedio(width)); // Por exemplo, largura média
  }

  static Radius getRadiusBotoes(double radiusValue) {
    return Radius.circular(getProportionalValue(radiusValue));
  }

  static double getProportionalValue(double value) {
    return blockSizeHorizontal * value;
  }
}
