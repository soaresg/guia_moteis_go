import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:guia_moteis/src/modules/home/home_controller.dart';
import 'package:guia_moteis/src/modules/home/model/motel_list_model.dart';
import 'package:guia_moteis/src/modules/home/widgets/highlight_motels_widget.dart';
import 'package:guia_moteis/src/modules/home/widgets/search_location_widget.dart';
import 'package:guia_moteis/src/shared/colors.dart';
import 'package:guia_moteis/src/shared/screen_utils.dart';
import 'package:guia_moteis/src/shared/widgets/button_period.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: GestureDetector(
          onTap: () => debugPrint("Pressionou o menu. Abrir o menu lateral."),
          child: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        title: ButtonPeriod(),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () => debugPrint(
                  "Pressionou a pesquisa. Enviar para pesquisa_page"),
              child: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: primaryColor,
      body: FutureBuilder(
          future: Provider.of<MotelList>(context)
              .updateMotelList('https://jsonkeeper.com/b/1IXK'),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Container();
              case ConnectionState.done:
                return Stack(
                  children: [
                    const SearchLocation(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
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
                            child: CarouselSlider(
                              options: CarouselOptions(
                                height: ScreenUtil.screenHeight * 0.2,
                                scrollDirection: Axis.horizontal,
                              ),
                              items: Provider.of<MotelList>(context)
                                  .itens
                                  .map(
                                    (e) => HighlightMotel(motelList: e),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                        Container(
                            height: ScreenUtil.screenHeight * 0.5,
                            width: ScreenUtil.screenWidth,
                            color: Colors.white),
                      ],
                    ),
                  ],
                );
              default:
                return Container();
            }
          }),
    );
  }
}

// #d80526
