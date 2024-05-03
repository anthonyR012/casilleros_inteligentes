import 'package:casilleros_inteligente/config/navigators.dart';
import 'package:casilleros_inteligente/config/theme.dart';
import 'package:casilleros_inteligente/view/login/login.dart';
import 'package:casilleros_inteligente/view/login/widgets/button_main_custom.dart';
import 'package:casilleros_inteligente/view/login/widgets/input_text_custom.dart';
import 'package:casilleros_inteligente/view/login/widgets/label_divider_widget.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Registrarme",
                  style: TextStyle(
                      fontSize: h1Size - 2,
                      color: whiteColor,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6 * 2),
                InputTextWidget(
                  width: width * 0.8,
                  height: 60,
                  textLabel: "Nombre",
                ),
                const SizedBox(height: 6),
                InputTextWidget(
                  width: width * 0.8,
                  height: 60,
                  textLabel: "Correo",
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InputTextWidget(
                      width: width * 0.6,
                      height: 60,
                      textLabel: "Contraseña",
                    ),
                    SizedBox(
                      width: width * 0.2,
                      child: InkWell(
                                splashFactory: NoSplash.splashFactory,
                                onTap: () {
                                  
                                },
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.transparent,
                                  child: Image.asset(
                                      '$gestorImageBase/finger_print.png'),
                                )),
                    )
                  ],
                ),
                const SizedBox(height: 6),
                ButtonMain(
                    width: width * 0.8,
                    heigth: 60,
                    text: "Registrarme",
                    onPressed: () {}),
                const SizedBox(height: 10),
                LabelMarkDivider(
                  widthLine: width * .15,
                  description: "¿Ya tienes cuenta? Ingresar",
                  onTap: () {
                    pushReplacementWidget(const LoginScreen(), context);
                  },
                )
              ],
            ),
          ),
        ));
  }
}
