



import 'package:flutter/widgets.dart';

class CoreSize {
  
  double getHeaderHeight(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.07;
  }
  double refreshWidgetHeight(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.03;
  }
  double padding10(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.01;
  }
  double padding20(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.02;
  }
  double padding30(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.03;
  }

  double getFontSz8(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.008;
  }
  double getFontSz10(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.01;
  }
  double getFontSz15(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.015;
  }
  double getFontSz20(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.02;
  }
  double getFontSz30(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.03;
  }
  double getFontSz40(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.04;
  }
}