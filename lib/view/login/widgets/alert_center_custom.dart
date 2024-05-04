import 'package:casilleros_inteligente/config/theme.dart';
import 'package:flutter/material.dart';

class AlertOverlayCenter extends StatelessWidget {
  const AlertOverlayCenter({
    super.key,
    required this.buildContext,
    required this.pathImage,
    required this.onTapClose,
    required this.onTapAuth,
    this.heightContainer = 300,
    this.widthContainer = 450,
    this.imageSize = 200,
  });

  final double heightContainer;
  final double widthContainer;
  final double imageSize;
  final String pathImage;
  final BuildContext buildContext;
  final dynamic onTapClose;
  final dynamic onTapAuth;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(buildContext).size;
    final width = size.width;
    final height = size.height;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.3),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              color: blackColor,
              borderRadius: BorderRadius.all(Radius.circular(roundedMain))),
          width: width * 0.7,
          height: height * 0.5,
          child: Stack(
            children: [
              _getTopButton(0, Icons.close_rounded,rigth: 5,onTap: onTapClose),
              Positioned(
                width: width * 0.7,
                top: 50,
                child: Column(
                  children: [
                    InkWell(
                      onTap: onTapAuth,
                      child: const Text(
                        "Auntenticación con huella",
                        style: TextStyle(
                            fontSize: h4Size + 2,
                            color: whiteColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: widthContainer,
                      height: heightContainer,
                      color: Colors.transparent,
                      child: Center(
                        child: Image.asset(
                          pathImage,
                          width: imageSize,
                          height: imageSize,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


    Positioned _getTopButton(double topPadding, IconData icon,
      {double? rigth, double? left, void Function()? onTap}) {
    return Positioned(
        top: topPadding + 10,
        left: left,
        right: rigth,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: onTap,
            child: Container(
              width: 33,
              height: 33,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black12,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ]),
              child: Icon(icon,size: 20,),
            ),
          ),
        ));
  }
}
