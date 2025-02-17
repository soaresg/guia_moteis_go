import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guia_moteis/src/shared/colors.dart';
import 'package:guia_moteis/src/shared/screen_utils.dart';

class MapaButton extends StatelessWidget {
  const MapaButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil.screenWidth * 0.3,
      child: FloatingActionButton(
        isExtended: true,
        backgroundColor: Colors.white,
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(right: ScreenUtil.blockSizeHorizontal * 2),
              child: Icon(
                FontAwesomeIcons.map,
                color: primaryColor,
                size: 16,
              ),
            ),
            Text(
              'mapa',
              style: TextStyle(
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
