import 'package:casilleros_inteligente/config/navigators.dart';
import 'package:casilleros_inteligente/config/theme.dart';
import 'package:casilleros_inteligente/view/login/widgets/alert_center_custom.dart';
import 'package:casilleros_inteligente/view/login/widgets/button_main_custom.dart';
import 'package:casilleros_inteligente/view/login/widgets/input_text_custom.dart';
import 'package:casilleros_inteligente/view/login/widgets/label_divider_widget.dart';
import 'package:casilleros_inteligente/view/sign_up/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AlertManageOverlay alert = AlertManageOverlay();

  @override
  void initState() {
    alert.initState(context: context);
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
                  "Mi Casillero",
                  style: TextStyle(
                      fontSize: h1Size - 2,
                      color: whiteColor,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6 * 2),
                InputTextWidget(
                  width: width * 0.8,
                  height: 60,
                  textLabel: "Correo",
                ),
                const SizedBox(height: 6),
                InputTextWidget(
                  width: width * 0.8,
                  height: 60,
                  textLabel: "Contraseña",
                ),
                const SizedBox(height: 6),
                SizedBox(
                  width: width * 0.8,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: ButtonMain(
                            width: width * 0.55,
                            heigth: 60,
                            text: "Ingresar",
                            onPressed: () {}),
                      ),
                      Expanded(
                          flex: 0,
                          child: InkWell(
                              splashFactory: NoSplash.splashFactory,
                              onTap: alert.show,
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.transparent,
                                child: Image.asset(
                                    '$gestorImageBase/finger_print.png'),
                              )))
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                LabelMarkDivider(
                  widthLine: width * .25,
                  description: "Registrarme",
                  onTap: () {
                    pushReplacementWidget(const SignUpScreen(), context);
                  },
                )
              ],
            ),
          ),
        ));
  }
}

class AlertManageOverlay {
  OverlayEntry? alertEntryCenter;
  OverlayState? overlayState;

  void initState({required BuildContext context}) {
    overlayState = Overlay.of(context);
    alertEntryCenter = OverlayEntry(
      builder: (BuildContext context) {
        return AlertOverlayCenter(
          buildContext: context,
          onTapClose: hide,
          pathImage: '$gestorImageBase/figer_print_orange.png',
        );
      },
    );
  }

  void show() {
    overlayState!.insert(alertEntryCenter!);
  }

  void hide() {
    alertEntryCenter!.remove();
  }
}
