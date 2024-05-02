
import 'package:casilleros_inteligente/config/theme.dart';
import 'package:casilleros_inteligente/view/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Casillero Inteligente",
      debugShowCheckedModeBanner: false,
      home:const  SplashScreen(),
      theme: ligthTheme,
    );
  }
}
