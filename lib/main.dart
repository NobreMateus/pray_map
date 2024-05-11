import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:map_study/firebase_options.dart';
import 'package:map_study/pray_map_view/pray_map_view_page.dart';
import 'package:map_study/select_country/presenter/select_country_page.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyMap(),
        '/country-pray': (context) => const SelectCountryPage(),
      },
    );
  }
}
