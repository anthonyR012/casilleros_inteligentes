import 'package:casilleros_inteligente/config/theme.dart';
import 'package:flutter/material.dart';

class LabelMarkDivider extends StatelessWidget {
  const LabelMarkDivider({
    super.key,
    required this.widthLine,
    required this.onTap,
    required this.description
  });
  final void Function()? onTap;
  final double widthLine;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 2,
          width: widthLine,
          color: Colors.white.withOpacity(0.5),
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              description,
              style:const  TextStyle(fontSize: h5Size, color: whiteColor),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          height: 2,
          width: widthLine,
          color: Colors.white.withOpacity(0.5),
        ),
      ],
    );
  }
}
