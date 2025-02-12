import 'package:flutter/material.dart';
import 'package:guia_moteis/src/shared/colors.dart';
import 'package:guia_moteis/src/shared/widgets/button_period.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      leading: GestureDetector(
        onTap: () => debugPrint("Pressionou o menu. Abrir o menu lateral."),
        child: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
      ),
      title: const ButtonPeriod(),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GestureDetector(
            onTap: () =>
                debugPrint("Pressionou a pesquisa. Enviar para pesquisa_page"),
            child: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
