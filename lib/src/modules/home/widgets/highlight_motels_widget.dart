import 'package:flutter/material.dart';
import 'package:guia_moteis/src/shared/models/motel_entity.dart';
import 'package:guia_moteis/src/shared/screen_utils.dart';

class HighlightMotel extends StatelessWidget {
  const HighlightMotel({super.key, required this.motelList});

  final MotelEntity motelList;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil.blockSizeHorizontal * 1),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(ScreenUtil.getRadiusBotoes(2)),
            color: Colors.white,
          ),
          height: ScreenUtil.screenHeight * 0.23,
          width: ScreenUtil.screenWidth * 0.912,
        ),
      ),
    );
  }
}
