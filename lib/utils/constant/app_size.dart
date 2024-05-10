import 'package:flutter/material.dart';

class AppSizes {
  //dimensions de l'écran
  static width(BuildContext context) => MediaQuery.of(context).size.width;
  static height(BuildContext context) => MediaQuery.of(context).size.height;

  static paddingToUp(BuildContext context) => AppSizes.height(context) - 150;
  static padding20(BuildContext context) => AppSizes.width(context) * 0.04;
  static onBoardTitleSize(BuildContext context) =>
      AppSizes.height(context) * 0.03;
  static onboardIconSize(BuildContext context) =>
      AppSizes.height(context) * 0.025;
  static font16(BuildContext context) => AppSizes.height(context) * 0.015;
  static font18(BuildContext context) => AppSizes.height(context) * 0.017;
  static font20(BuildContext context) => AppSizes.height(context) * 0.020;
  static font22(BuildContext context) => AppSizes.height(context) * 0.022;
  static font25(BuildContext context) => AppSizes.height(context) * 0.025;

  static height15(BuildContext context) => AppSizes.height(context) * 0.015;
  static width10(BuildContext context) => AppSizes.width(context) * 0.06;
  // Marges
  static const double marginSmall = 8.0;
  static const double marginMedium = 16.0;
  static const double marginLarge = 24.0;

  // Paddings
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;

  // Tailles de texte
  static const double textSmall = 12.0;
  static const double textMedium = 16.0;
  static const double textLarge = 20.0;
  static const double textExtraLarge = 24.0;

  // Hauteur des boutons
  static const double buttonHeight = 48.0;
  static const double inputHeight = 50.0;
  static const double loaderSize = 20.0;

  // Taille des icônes
  static const double iconSizeSmall = 20.0;
  static const double iconSizeMedium = 24.0;
  static const double iconSizeLarge = 30.0;
}
