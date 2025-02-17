import 'package:flutter/material.dart';
import 'package:guia_moteis/src/core/model/motel_list_model.dart';
import 'package:guia_moteis/src/core/widgets/mapa_button_widget.dart';
import 'package:guia_moteis/src/modules/home/widgets/filter_list_widget.dart';
import 'package:guia_moteis/src/modules/home/widgets/highlight_carousel_widget.dart';
import 'package:guia_moteis/src/modules/home/widgets/motel_card_widget.dart';
import 'package:guia_moteis/src/modules/home/widgets/search_location_widget.dart';
import 'package:guia_moteis/src/shared/colors.dart';
import 'package:guia_moteis/src/shared/screen_utils.dart';
import 'package:guia_moteis/src/shared/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
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
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const HighlightCarouselWidget(),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenUtil.blockSizeHorizontal * 2),
                            color: Colors.grey.shade100,
                            child: FilterListWidget(),
                          ),
                          Container(
                            height: ScreenUtil.screenHeight * 0.6,
                            width: ScreenUtil.screenWidth,
                            color: Colors.grey.shade100,
                            padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtil.blockSizeHorizontal * 2,
                              vertical: ScreenUtil.blockSizeVertical,
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical:
                                            ScreenUtil.blockSizeVertical * 1.5),
                                    child: Container(
                                      width: ScreenUtil.screenWidth,
                                      height: 2,
                                      color: Colors.grey.shade200,
                                    ),
                                  ),
                                  Column(
                                    children: Provider.of<MotelList>(context)
                                        .itens
                                        .map<Widget>(
                                          (e) => SizedBox(
                                              height:
                                                  ScreenUtil.screenHeight * 0.8,
                                              child: MotelCardWidget(motel: e)),
                                        )
                                        .toList(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              default:
                return Container();
            }
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const MapaButton(),
    );
  }
}
