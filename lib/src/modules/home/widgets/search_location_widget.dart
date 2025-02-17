import 'package:flutter/material.dart';
import 'package:guia_moteis/src/shared/colors.dart';
import 'package:guia_moteis/src/shared/screen_utils.dart';

class SearchLocation extends StatelessWidget {
  const SearchLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      width: ScreenUtil.screenWidth,
      height: ScreenUtil.screenHeight * 0.06,
      decoration: BoxDecoration(
        color: primaryColor,
      ),
      child: GestureDetector(
        onTap: () => debugPrint('Pressionou em localização'),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(right: ScreenUtil.blockSizeHorizontal),
              child: const Text(
                "minha localização",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
