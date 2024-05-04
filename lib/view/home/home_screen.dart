import 'package:casilleros_inteligente/config/navigators.dart';
import 'package:casilleros_inteligente/config/theme.dart';
import 'package:casilleros_inteligente/model/user_model.dart';
import 'package:casilleros_inteligente/view/login/login_screen.dart';
import 'package:casilleros_inteligente/view/login/widgets/button_main_custom.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.userModel});
  final UserModel userModel;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bienvenido,',
              style: TextStyle(
                fontSize: h1Size,
                color: grayColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.userModel.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: whiteColor,
                fontSize: h1Size,
              ),
            ),
            ButtonMain(
                width: width * 0.55,
                heigth: 60,
                text: "Cerrar",
                onPressed: () async {
                  pushReplacementWidget(const LoginScreen(), context);
                }),
          ],
        ),
      ),
    );
  }
}
