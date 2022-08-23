import 'package:flutter/material.dart';
import 'package:the_middlemen/Constants/const.dart';

SnackBar customSnackBar(message, color, icon, bottomText) => SnackBar(
  content: SizedBox(
    height: 60,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 25,
          color: Colors.white,
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'NutinoSansBold',
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Text(
                  bottomText,
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'NutinoSansReg',
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  ),
  backgroundColor: color,
  duration: const Duration(seconds: 2),
  elevation: 0,
  behavior: SnackBarBehavior.floating,
);

void showSnackBar(BuildContext context, String message, Color color,
    IconData icon, String bottomText) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    customSnackBar(message, color, icon, bottomText),
  );
}

SnackBar customSnackBar2(message, color) => SnackBar(
  content: SizedBox(
    height: 28,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            message,
            style: kStyleNormal
          ),
        ),
        const Icon(Icons.check,color: Colors.black,)
      ],
    ),
  ),
  backgroundColor: color,
  duration: const Duration(seconds: 2),
  elevation: 0,
  behavior: SnackBarBehavior.floating,
);

void showSnackBar2(BuildContext context, String message, Color color) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    customSnackBar2(message, color),
  );
}
