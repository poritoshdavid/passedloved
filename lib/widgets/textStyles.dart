import 'package:flutter/material.dart';
import 'package:passedloved/widgets/responsible.dart';

class TextStyles {
  TextStyle headingStyle() {
    return TextStyle(
        shadows: const <Shadow>[
          Shadow(
            offset: Offset(2.0, 2.5),
            blurRadius: 1.5,
            color: Colors.black,
          ),
        ],
        fontSize: Responsible.fontSizeH,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: "kawoszeh");
  }

  TextStyle subStyle(){
    return TextStyle(
      shadows: const <Shadow>[
        Shadow(
          offset: Offset(2.0, 1.5),
          blurRadius: 2.0,
          color: Colors.black,
        ),
      ],
      fontSize: Responsible.fontSizeH * 0.055,
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontFamily: "kawoszeh",
    );
  }

  TextStyle normalReading() {
    return TextStyle(
        fontSize: Responsible.fontSize,
        fontFamily: "opensense",
        color: Colors.white);
  }

  TextStyle normalTitle() {
    return TextStyle(
        fontSize: Responsible.fontSize,
        fontFamily: "kawoszeh",
        color: Colors.white);
  }

  TextStyle mediumReading() {
    return TextStyle(
        fontSize: Responsible.fontSize * 1.5,
        fontFamily: "opensense",
        color: Colors.white);
  }

  TextStyle mediumTitle() {
    return TextStyle(
        fontSize: Responsible.fontSize * 1.5,
        fontFamily: "kawoszeh",
        color: Colors.white);
  }

  TextStyle biggerReading() {
    return TextStyle(
        fontSize: Responsible.fontSize * 1.8,
        fontFamily: "opensense",
        color: Colors.white);
  }

  TextStyle biggerTitle() {
    return TextStyle(
        fontSize: Responsible.fontSize * 1.8,
        fontFamily: "kawoszeh",
        color: Colors.white);
  }

  TextStyle basicReading() {
    return TextStyle(
        fontSize: Responsible.fontSize * 1.2,
        fontFamily: "kawoszeh",
        fontWeight: FontWeight.w600,
        color: Colors.black);
  }
  TextStyle cardsTitle() {
    return TextStyle(
        fontSize: Responsible.fontSize * 1.2,
        fontFamily: "kawoszeh",
        fontWeight: FontWeight.w600,
        color: Colors.white);
  }
}
