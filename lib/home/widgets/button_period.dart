import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guia_moteis/shared/screen_utils.dart';

class ButtonPeriod extends StatefulWidget {
  ButtonPeriod({super.key});

  @override
  State<ButtonPeriod> createState() => _ButtonPeriodState();
}

class _ButtonPeriodState extends State<ButtonPeriod> {
  bool period = true;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return SizedBox(
      height: ScreenUtil.blockSizeVertical * 5,
      child: AnimatedToggleSwitch<bool>.size(
        indicatorSize: Size.fromWidth(ScreenUtil.screenWidth * 0.35),
        current: period,
        values: const [true, false],
        style: const ToggleStyle(
          backgroundColor: Color.fromRGBO(202, 0, 0, 1),
          indicatorColor: Colors.white,
          borderColor: Colors.transparent,
        ),
        onChanged: (i) => setState(() => period = i),
        spacing: 20,
        customIconBuilder: (context, local, global) {
          final text = const ['ir agora', 'ir outra hora'][local.index];
          final icon = const [
            FontAwesomeIcons.boltLightning,
            FontAwesomeIcons.calendarCheck
          ][local.index];
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  icon,
                  size: 10,
                  color: Color.lerp(
                      Colors.white, Colors.black, local.animationValue),
                ),
              ),
              Text(
                text,
                style: TextStyle(
                  color: Color.lerp(
                      Colors.white, Colors.black, local.animationValue),
                  fontSize: 10,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
