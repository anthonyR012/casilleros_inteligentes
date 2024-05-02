import 'package:casilleros_inteligente/config/navigators.dart';
import 'package:casilleros_inteligente/config/theme.dart';
import 'package:casilleros_inteligente/view/login/login.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              "$gestorJsonBase/casillero_animation.json",
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox();
              },
              onLoaded: (value) {
                int duration = value.duration.inMilliseconds ~/ 2;
                Future.delayed(
                  Duration(milliseconds: duration),
                  _goToLogin,
                );
              },
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.3,
              fit: BoxFit.fill,
            ),
            const Text(
              "Casillero Inteligente",
              style: TextStyle(
                  fontSize: h1Size,
                  fontWeight: FontWeight.bold,
                  color: whiteColor),
            ),
          ],
        ),
      ),
    );
  }

  void _goToLogin() {
    pushReplacementWidget(const LoginScreen(), context);
  }
}
