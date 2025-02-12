import 'package:flutter/material.dart';
import 'package:guia_moteis/src/modules/home/home_controller.dart';
import 'package:guia_moteis/src/modules/home/widgets/motel_card_header_widget.dart';
import 'package:guia_moteis/src/modules/home/widgets/suites_widgets/categoria_itens_row.dart';
import 'package:guia_moteis/src/modules/home/widgets/suites_widgets/column_periodos.dart';
import 'package:guia_moteis/src/modules/home/widgets/suites_widgets/suite_image_widget.dart';
import 'package:guia_moteis/src/shared/models/motel_entity.dart';
import 'package:guia_moteis/src/shared/screen_utils.dart';

class MotelCardWidget extends StatelessWidget {
  MotelCardWidget({super.key, required this.motel});

  final MotelEntity motel;
  final HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MotelCardHeader(motel: motel),
        Padding(
          padding: EdgeInsets.only(bottom: ScreenUtil.blockSizeVertical * 5),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: motel.suites
                  .map(
                    (suite) => SizedBox(
                      height: ScreenUtil.screenHeight * 0.8,
                      child: Column(
                        children: [
                          SuiteImage(suite: suite),
                          CategoriaItensRow(suite: suite),
                          ColumnPeriodos(suite: suite),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
