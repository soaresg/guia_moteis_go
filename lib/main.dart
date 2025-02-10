import 'dart:io';

import 'package:flutter/material.dart';
import 'package:guia_moteis/src/core/app.dart';
import 'package:guia_moteis/src/core/my_http_overrides.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();

  runApp(const App());
}
