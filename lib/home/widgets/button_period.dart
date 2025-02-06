import 'package:flutter/material.dart';
import 'package:guia_moteis/shared/screen_utils.dart';

class ButtonPeriod extends StatefulWidget {
  ButtonPeriod({super.key});

  @override
  State<ButtonPeriod> createState() => _ButtonPeriodState();
}

class _ButtonPeriodState extends State<ButtonPeriod> {
  bool period = false;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    final corBotaoSelecionado = period ? Colors.red : Colors.transparent;
    final corFontBotaoSelecionado = period ? Colors.transparent : Colors.red;

    final corBotaoOff = period ? Colors.blue : Colors.amber;
    final corFontBotaoOff = period ? Colors.white : Colors.orange;

    return Material(
      elevation: 3,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(2),
        topRight: Radius.circular(2),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: ScreenUtil.getRadiusBotoes(2),
            topRight: ScreenUtil.getRadiusBotoes(2),
          ),
          color: const Color.fromARGB(255, 226, 226, 226),
        ),
        width: ScreenUtil.blockSizeHorizontal * 85,
        height: ScreenUtil.blockSizeVertical * 5,
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    period != period;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: corBotaoSelecionado,
                    borderRadius: BorderRadius.only(
                      topLeft: ScreenUtil.getRadiusBotoes(2),
                      topRight: ScreenUtil.getRadiusBotoes(2),
                    ),
                  ),
                  child: Text(
                    "Teste",
                    style: TextStyle(
                      color: corFontBotaoSelecionado,
                      fontSize: ScreenUtil.wideScreen
                          ? ScreenUtil.getFontMedia(10)
                          : ScreenUtil.getFontPequena(12),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Urbanist',
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: true,
              child: Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: corBotaoOff,
                      borderRadius: BorderRadius.only(
                        topLeft: ScreenUtil.getRadiusBotoes(2),
                        topRight: ScreenUtil.getRadiusBotoes(2),
                      ),
                    ),
                    child: Text(
                      "Teste2",
                      style: TextStyle(
                        color: corFontBotaoOff,
                        fontSize: ScreenUtil.wideScreen
                            ? ScreenUtil.getFontMedia(10)
                            : ScreenUtil.getFontPequena(12),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Urbanist',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
