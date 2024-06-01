import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:orar_pelos_paises/firebase_options.dart';
import 'package:orar_pelos_paises/pray_map_view/pray_map_view_page.dart';
import 'package:orar_pelos_paises/select_country/presenter/select_country_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Orar por países',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          useMaterial3: true,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff011337),
              foregroundColor: Colors.white,
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xff011337),
          ))),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyMap(),
        '/country-pray': (context) => const SelectCountryPage(),
      },
    );
  }
}
