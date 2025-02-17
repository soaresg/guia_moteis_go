import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guia_moteis/src/shared/models/motel_entity.dart';

import '../../../shared/screen_utils.dart';

class MotelCardHeader extends StatelessWidget {
  const MotelCardHeader({super.key, required this.motel});

  final MotelEntity motel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil.blockSizeHorizontal * 2,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(ScreenUtil.getRadiusBotoes(50)),
            child: Image.network(
              motel.logo,
              scale: 2.5,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              motel.fantasia,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            Text('${motel.distancia.toStringAsFixed(0)}km - ${motel.bairro}'),
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: ScreenUtil.blockSizeVertical),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.amber),
                      borderRadius:
                          BorderRadius.all(ScreenUtil.getRadiusBotoes(2)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil.blockSizeHorizontal,
                        vertical: ScreenUtil.blockSizeVertical * 0.3,
                      ),
                      child: Text('⭐ ${motel.media.toStringAsFixed(2)}'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => debugPrint("Usuário pressionou em avaliações"),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtil.blockSizeHorizontal * 2),
                          child: Text('${motel.qtdAvaliacoes} avaliações'),
                        ),
                        const Icon(Icons.keyboard_arrow_down, size: 12),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: ScreenUtil.blockSizeVertical,
          ),
          child: const Icon(
            FontAwesomeIcons.solidHeart,
            size: 24,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
