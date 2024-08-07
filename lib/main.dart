import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/injector/injector.dart';
import 'my_movies_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDb();
  Injector.init();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    const MyMoviesApp(),
  );
}
