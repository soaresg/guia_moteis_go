import 'package:flutter/material.dart';
import 'package:guia_moteis/src/core/model/current_carrousel_index.dart';
import 'package:guia_moteis/src/core/model/motel_list_model.dart';
import 'package:guia_moteis/src/shared/screen_utils.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DotSmoothIndicatorWidget extends StatelessWidget {
  const DotSmoothIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil.blockSizeHorizontal * 8,
        vertical: ScreenUtil.blockSizeVertical * 2,
      ),
      child: AnimatedSmoothIndicator(
        activeIndex: Provider.of<CurrentCarrouselIndex>(context).currentIndex,
        count: Provider.of<MotelList>(context).itens.length,
        axisDirection: Axis.horizontal,
        effect: SlideEffect(
          spacing: 8,
          radius: 20,
          dotColor: Colors.grey.shade200,
          activeDotColor: Colors.grey.shade700,
        ),
      ),
    );
  }
}
