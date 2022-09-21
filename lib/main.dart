import 'package:flutter/material.dart';
import 'layout_builder_screen.dart';
import 'sizer_screen.dart';
import 'resposive_builder_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            appBarTheme: const AppBarTheme(centerTitle: true)),
        routes: {
          '/': (context) => const MyHomePage(),
          '/layout': (context) => const LayoutBuilderScreen(),
          '/sizer': (context) => const SizerScreen()
        },
        initialRoute: '/');
  }
}
