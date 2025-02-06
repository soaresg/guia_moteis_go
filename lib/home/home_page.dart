import 'package:flutter/material.dart';
import 'package:guia_moteis/home/widgets/button_period.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool period = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(192, 7, 12, 1),
        leading: GestureDetector(
          onTap: () => debugPrint("Pressionou o menu. Abrir o menu lateral."),
          child: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        title: Center(
          child: Stack(
            children: [
              ButtonPeriod(),
            ],
          ),
        ),
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
      body: Container(),
    );
  }
}

// #d80526
