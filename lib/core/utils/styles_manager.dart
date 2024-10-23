
import 'package:e_commerce_task/core/utils/font_manager.dart';
import 'package:flutter/material.dart';

import 'colors_manager.dart';

TextStyle _getTextStyle(
  double fontSize,
  FontWeight fontWeight,
  Color color,
) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
  );
}

// regular style
TextStyle getRegularStyle({
  required Color color,
  double fontSize = FontSize.s12,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.regular,
    color,
  );
}
// light text style

TextStyle getLightStyle({
  required Color color,
  double fontSize = FontSize.s12,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.light,
    color,
  );
}
// bold text style

TextStyle getBoldStyle({
  required Color color,
  double fontSize = FontSize.s12,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.bold,
    color,
  );
}

// semi bold text style

TextStyle getSemiBoldStyle({
  required Color color,
  double fontSize = FontSize.s12,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.semiBold,
    color,
  );
}

// medium text style

TextStyle getMediumStyle({
  required Color color,
  double fontSize = FontSize.s12,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.medium,
    color,
  );
}



class FontStyles {
  //? new styles

  //! bold
  static TextStyle get bold13grey => TextStyle(
        color: ColorsManager.grey,
        fontSize: FontSize.s13,
        fontWeight: FontWeightManager.bold,
      );


  //! medium
  static TextStyle get medium16black => TextStyle(
        fontSize: FontSize.s16,
        color: ColorsManager.black,
        fontWeight: FontWeightManager.medium,
      );

  static TextStyle get medium17black => TextStyle(
        fontSize: FontSize.s17,
        color: ColorsManager.black,
        fontWeight: FontWeightManager.regular,
      );




  static TextStyle get bold14black => getBoldStyle(
        color: ColorsManager.black,
        fontSize: FontSize.s14,
      );
  static TextStyle get bold13Red => getBoldStyle(
        color: ColorsManager.red,
        fontSize: FontSize.s13,
      );

  static TextStyle get bold16black => getBoldStyle(
        color: ColorsManager.black,
        fontSize: FontSize.s16,
      );



  static TextStyle get semiBold17black => getSemiBoldStyle(
        color: ColorsManager.black,
        fontSize: FontSize.s17,
      );


  static TextStyle get semiBold22Black => getSemiBoldStyle(
        color: ColorsManager.black,
        fontSize: FontSize.s22,
      );


  static TextStyle get semiBold16grey1 => getSemiBoldStyle(
        color: ColorsManager.grey,
        fontSize: FontSize.s16,
      );

  static TextStyle get semiBold16Red => getSemiBoldStyle(
        color: ColorsManager.red,
        fontSize: FontSize.s16,
      );

  static TextStyle get semiBold12Red => getSemiBoldStyle(
        color: ColorsManager.red,
        fontSize: FontSize.s12,
      );



  static TextStyle get medium14black => getMediumStyle(
        color: ColorsManager.black,
        fontSize: FontSize.s14,
      );
  static TextStyle get regular32black => getRegularStyle(
        color: ColorsManager.black,
        fontSize: FontSize.s32,
      );

  static TextStyle get regular15Black => getRegularStyle(
        color: ColorsManager.black,
        fontSize: FontSize.s15,
      );
  static TextStyle get regular16Red => getRegularStyle(
        color: ColorsManager.red,
        fontSize: FontSize.s16,
      );
  static TextStyle get regular15lightGrey => getRegularStyle(
        color: ColorsManager.grey,
        fontSize: FontSize.s15,
      );


}
