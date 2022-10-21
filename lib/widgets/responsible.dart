import 'package:flutter/widgets.dart';

class Responsible {
  static double width = 0;
  static double height= 0;
  static double boxHeight= 0;
  static double boxWidth= 0;
  static double fontSize= 0;
  static double caroselviewportFraction= 0;
  static double pastLifeH= 0;
  static double pastLifew= 0;
  //showData Content Size

  static double showDataContentH= 0;
  static double showDataContentNH= 0;

  //showData Card Size

  static double showCardT= 0;
  static double showCardB= 0;
  //ShowData Image Size

  static double imageWidth= 0;

  //HomePage FontSize

  static double fontSizeH= 0;

  //showData without titlle content
  static double showDataContentTl= 0;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      width = constraints.maxWidth;
      height = constraints.maxHeight;
      //HomePage FontSize
      fontSizeH = constraints.maxWidth;
      //Slider ViewPort
      caroselviewportFraction = constraints.maxWidth * 0.0018;
      //showData image width
      imageWidth = constraints.maxWidth;
      //showData Content Boxwith title
      showDataContentH = constraints.maxHeight * 0.01;
      showDataContentNH = constraints.maxHeight * 0.01;
      showDataContentTl = constraints.maxHeight * 0.01;
      //showData Content Box without title
      showCardT = constraints.maxHeight * 0.06;
      showCardB = constraints.maxHeight * 0.10;
      // Cards Boxs Size
      pastLifeH = constraints.maxHeight * 0.07;
      pastLifew = constraints.maxWidth * 0.10;
    } else {
      width = constraints.maxHeight;
      height = constraints.maxWidth;
      //HomePage FontSize
      fontSizeH = constraints.maxHeight;
      //Slider ViewPort
      caroselviewportFraction = (constraints.maxWidth * 0.0007) / 1.4;
      //showData image width
      imageWidth = constraints.maxWidth * 0.2;
      //showData Content Box with title
      showDataContentH = constraints.maxHeight * 0.18;
      showDataContentNH = constraints.maxHeight * 0.16;
      showDataContentTl = constraints.maxHeight * 0.0;
      //showData Content Box without title
      showCardT = constraints.maxHeight * 0.12;
      showCardB = constraints.maxHeight * 0.20;
      // Cards Boxs Size
      pastLifeH = constraints.maxHeight * 0.08;
      pastLifew = constraints.maxWidth * 0.03;
    }

    boxHeight = height / 36;
    boxWidth = width / 7.8;
    fontSize = width * 0.04;
  }
}
