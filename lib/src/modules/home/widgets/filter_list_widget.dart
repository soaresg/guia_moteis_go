import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guia_moteis/src/modules/home/home_controller.dart';
import 'package:guia_moteis/src/shared/screen_utils.dart';

class FilterListWidget extends StatelessWidget {
  FilterListWidget({super.key});

  final HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: controller.filterList
            .map(
              (e) => Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil.blockSizeHorizontal),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () => debugPrint('Pressionou $e'),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          right: ScreenUtil.blockSizeHorizontal * 2,
                        ),
                        child: Visibility(
                          visible: controller.filterList.indexOf(e) == 0,
                          child: Icon(
                            FontAwesomeIcons.sliders,
                            size: 16,
                            color: Colors.grey.shade900,
                          ),
                        ),
                      ),
                      Text(
                        e,
                        style: TextStyle(
                          color: Colors.grey.shade900,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
