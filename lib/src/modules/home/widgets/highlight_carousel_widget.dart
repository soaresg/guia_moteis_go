import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:guia_moteis/src/core/model/current_carrousel_index.dart';
import 'package:guia_moteis/src/core/model/motel_list_model.dart';
import 'package:guia_moteis/src/modules/home/widgets/dot_smooth_indicator_widget.dart';
import 'package:guia_moteis/src/modules/home/widgets/highlight_motels_widget.dart';
import 'package:guia_moteis/src/shared/colors.dart';
import 'package:guia_moteis/src/shared/models/suite_entity.dart';
import 'package:guia_moteis/src/shared/screen_utils.dart';
import 'package:provider/provider.dart';

class HighlightCarouselWidget extends StatelessWidget {
  const HighlightCarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.screenHeight * 0.3,
      width: ScreenUtil.screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: ScreenUtil.getRadiusBotoes(5),
          topRight: ScreenUtil.getRadiusBotoes(5),
        ),
        color: greyColor,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: ScreenUtil.blockSizeHorizontal * 2,
          right: ScreenUtil.blockSizeHorizontal * 2,
          top: ScreenUtil.blockSizeVertical * 1.5,
          bottom: ScreenUtil.blockSizeVertical * 2,
        ),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  enableInfiniteScroll: false,
                  height: ScreenUtil.screenHeight * 0.2,
                  scrollDirection: Axis.horizontal,
                  enlargeCenterPage: true,
                  onPageChanged: (index, __) {
                    Provider.of<CurrentCarrouselIndex>(context, listen: false)
                        .set(index);
                  }),
              items: Provider.of<MotelList>(context).itens.map(
                (e) {
                  SuiteEntity suites = e.suites.firstWhere((element) =>
                      element.periodos
                          .firstWhere((element) => element.desconto > 0)
                          .desconto !=
                      0);

                  return HighlightMotel(
                    suite: suites,
                    motel: e,
                  );
                },
              ).toList(),
            ),
            const DotSmoothIndicatorWidget(),
          ],
        ),
      ),
    );
  }
}
