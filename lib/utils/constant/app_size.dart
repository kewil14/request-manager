import 'package:flutter/material.dart';

class AppSizes {
  // Dimensions de l'écran
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;

  // Marges et espacements
  static double smallMargin(BuildContext context) => width(context) * 0.02;
  static double mediumMargin(BuildContext context) => width(context) * 0.04;
  static double largeMargin(BuildContext context) => width(context) * 0.06;

  static double smallPadding(BuildContext context) => width(context) * 0.02;
  static double mediumPadding(BuildContext context) => width(context) * 0.03;
  static double largePadding(BuildContext context) => width(context) * 0.06;

  // Tailles des éléments
  static double iconSize(BuildContext context) => width(context) * 0.06;
  static double smallButtonHeight(BuildContext context) =>
      height(context) * 0.05;
  static double mediumButtonHeight(BuildContext context) =>
      height(context) * 0.06;
  static double largeButtonHeight(BuildContext context) =>
      height(context) * 0.08;

  static double smallButtonWidth(BuildContext context) => width(context) * 0.2;
  static double mediumButtonWidth(BuildContext context) => width(context) * 0.4;
  static double largeButtonWidth(BuildContext context) => width(context) * 0.6;

  static double smallCardHeight(BuildContext context) => height(context) * 0.15;
  static double mediumCardHeight(BuildContext context) =>
      height(context) * 0.25;
  static double largeCardHeight(BuildContext context) => height(context) * 0.35;

  // Tailles de texte
  static double smallTextSize(BuildContext context) => width(context) * 0.03;
  static double mediumTextSize(BuildContext context) => width(context) * 0.04;
  static double largeTextSize(BuildContext context) => width(context) * 0.05;
  static double extraLargeTextSize(BuildContext context) =>
      width(context) * 0.07;

  // Rayons de bordure
  static double smallRadius(BuildContext context) => width(context) * 0.02;
  static double mediumRadius(BuildContext context) => width(context) * 0.04;
  static double largeRadius(BuildContext context) => width(context) * 0.06;
}
