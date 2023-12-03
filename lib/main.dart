import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pokemon_api/src/injector.dart' as di;
import 'package:pokemon_api/src/presentation/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();

  const environment =
      String.fromEnvironment('ENVIRONMENT', defaultValue: 'development');
  await dotenv.load(fileName: 'assets/env/.env.$environment');

  runApp(const MyApp());
}
