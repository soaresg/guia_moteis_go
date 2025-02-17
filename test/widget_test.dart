import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis/src/core/app.dart';
import 'package:guia_moteis/src/core/my_http_overrides.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();

  group('Testes do appbar', () {
    testWidgets('Teste Menu Lateral', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(App());

      Finder menuIcon = find.byIcon(Icons.menu);

      expect(menuIcon, findsOneWidget);

      print('testando a abertura do menu');
      await tester.tap(menuIcon);
      print('finalizado o teste');
    });

    testWidgets('Teste Pesquisa', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(App());

      Finder searchIcon = find.byIcon(Icons.search);

      expect(searchIcon, findsOneWidget);

      print('testando o menu pesquisa');
      await tester.tap(searchIcon);
      print('finalizado o teste');
    });

    testWidgets('Teste ToogleSwitch', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(App());

      Finder irAgoraText = find.text('ir agora');
      Finder irOutraHoraText = find.text('ir agora');

      expect(irAgoraText, findsOneWidget);
      expect(irOutraHoraText, findsOneWidget);

      print('testando o toggle switch');
      await tester.tap(irAgoraText);
      await tester.tap(irOutraHoraText);
      print('finalizado o teste');
    });
  });

  group('Teste de highlight', () {
    testWidgets('Teste Botao Reservar', (WidgetTester tester) async {
      await tester.pumpWidget(App());

      Finder reservarButton = find.text('reservar');

      expect(reservarButton, findsOneWidget);
    });
  });

  group('Teste de motel list', () {});

  testWidgets('Teste botao mapa', (WidgetTester tester) async {
    await tester.pumpWidget(App());

    Finder mapaButton = find.text('mapa');

    expect(mapaButton, findsOneWidget);

    await tester.tap(mapaButton);
  });
}
