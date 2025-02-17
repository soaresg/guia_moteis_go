import 'package:flutter/material.dart';
import 'package:guia_moteis/src/core/model/current_carrousel_index.dart';
import 'package:guia_moteis/src/core/model/motel_list_model.dart';
import 'package:guia_moteis/src/modules/home/home_page.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MotelList()),
        ChangeNotifierProvider(create: (context) => CurrentCarrouselIndex()),
      ],
      child: const MaterialApp(
        title: 'Guia de Moteis GO',
        home: HomePage(),
      ),
    );
  }
}
