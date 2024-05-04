import 'package:casilleros_inteligente/config/navigators.dart';
import 'package:casilleros_inteligente/config/theme.dart';
import 'package:casilleros_inteligente/controller/user_controller.dart';
import 'package:casilleros_inteligente/view/home/home_screen.dart';
import 'package:casilleros_inteligente/view/login/widgets/alert_center_custom.dart';
import 'package:casilleros_inteligente/view/login/widgets/button_main_custom.dart';
import 'package:casilleros_inteligente/view/login/widgets/input_text_custom.dart';
import 'package:casilleros_inteligente/view/login/widgets/label_divider_widget.dart';
import 'package:casilleros_inteligente/view/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AlertManageOverlay alert = AlertManageOverlay();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final UserController _userController = UserController();

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
          child: Form(
            key: _formKey,
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: _emailController,
                  ),
                  const SizedBox(height: 6),
                  InputTextWidget(
                    width: width * 0.8,
                    height: 60,
                    controller: _passwordController,
                    textLabel: "Contraseña",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
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
                              onPressed: () async {
                                if (_verifyForm()) return;
                                EasyLoading.show(status: "Cargando...");
                                try {
                                  final user = await _userController.login(
                                      _emailController.text,
                                      _passwordController.text);
                                  if (user == null) {
                                    throw Exception(
                                        "No se encontró el usuario");
                                  }
                                  EasyLoading.showSuccess("Ingresando...");
                                  pushReplacementWidget(
                                      const HomeScreen(), context);
                                } catch (e) {
                                  EasyLoading.showError(e.toString());
                                }
                              }),
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
          ),
        ));
  }

  bool _verifyForm() {
    return !_formKey.currentState!.validate();
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
