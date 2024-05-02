import 'package:casilleros_inteligente/config/theme.dart';
import 'package:flutter/material.dart';

class ButtonMain extends StatefulWidget {
  const ButtonMain(
      {super.key,
      required this.width,
      required this.heigth,
      required this.text,
      required this.onPressed,
      this.iconCustom});

  final double width;
  final double heigth;
  final String text;
  final Widget? iconCustom;
  final dynamic onPressed;

  @override
  State<ButtonMain> createState() => _ButtonMainState();
}

class _ButtonMainState extends State<ButtonMain> {
  bool _isButtonDisabled = false;

  @override
  Widget build(BuildContext context) {
    Widget icon = widget.iconCustom ?? const SizedBox();
    final double space = widget.iconCustom == null ? 0 : 10;
    return Opacity(
      opacity: _isButtonDisabled ? 0.5 : 1,
      child: Container(
        height: widget.heigth,
        width: widget.width,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ElevatedButton(
          onPressed: _isButtonDisabled ? null : _handleButtonPress,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.text,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: h3Size,
                ),
              ),
              SizedBox(width: space),
              icon
            ],
          ),
        ),
      ),
    );
  }

  void _handleButtonPress() async {
    setState(() {
      _isButtonDisabled = true;
    });
    try {
      await widget.onPressed();
    } catch (e, stackTrace) {
      assert(false, '$stackTrace $e');
    } finally {
      setState(() {
        _isButtonDisabled = false;
      });
    }
  }
}
