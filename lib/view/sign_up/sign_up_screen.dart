import 'package:casilleros_inteligente/config/navigators.dart';
import 'package:casilleros_inteligente/config/theme.dart';
import 'package:casilleros_inteligente/controller/user_controller.dart';
import 'package:casilleros_inteligente/model/user_model.dart';
import 'package:casilleros_inteligente/view/login/login_screen.dart';
import 'package:casilleros_inteligente/view/login/widgets/button_main_custom.dart';
import 'package:casilleros_inteligente/view/login/widgets/input_text_custom.dart';
import 'package:casilleros_inteligente/view/login/widgets/label_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final UserController _userController = UserController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _loginWithFingerPrint = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
          child: Form(
            key: _formKey,
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
                    controller: _nameController,
                    textLabel: "Nombre",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 6),
                  InputTextWidget(
                    width: width * 0.8,
                    height: 60,
                    controller: _emailController,
                    textLabel: "Correo",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
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
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        width: width * 0.2,
                        child: Column(
                          children: [
                            const Text(
                              "Ingresar con huella",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: h5Size,
                                  color: whiteColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Switch(
                              activeColor: orangeColor,
                              onChanged: (value) {
                                setState(() {
                                  _loginWithFingerPrint =
                                      !_loginWithFingerPrint;
                                });
                              },
                              value: _loginWithFingerPrint,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 6),
                  ButtonMain(
                      width: width * 0.8,
                      heigth: 60,
                      text: "Registrarme",
                      onPressed: () async {
                        try {
                          if (_verifyForm()) return;
                          EasyLoading.show(status: "Cargando...");
                          _userController
                              .insertUser(UserModel(
                                  id: null,
                                  name: _nameController.text,
                                  email: _emailController.text,
                                  fingerprint: _loginWithFingerPrint ? "1" :"0",
                                  password: _passwordController.text))
                              .then((value) {
                            EasyLoading.showSuccess("Usuario creado.");
                            pushReplacementWidget(const LoginScreen(), context);
                          });
                        } catch (e) {
                          EasyLoading.showError(e.toString());
                        }
                      }),
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
          ),
        ));
  }

  bool _verifyForm() {
    return !_formKey.currentState!.validate();
  }
}
