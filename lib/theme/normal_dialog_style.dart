import 'package:flutter/material.dart';

class NormalDialogStyle extends ThemeExtension<NormalDialogStyle> {
  const NormalDialogStyle({
    Key? key,
    this.primaryColor,
    this.borderRadius,
  }) : super();

  final Color? primaryColor;
  final double? borderRadius;
  @override
  ThemeExtension<NormalDialogStyle> copyWith({
    Color? primaryColor,
    double? borderRadius,
  }) =>
      NormalDialogStyle(
        primaryColor: primaryColor ?? this.primaryColor,
        borderRadius: borderRadius ?? this.borderRadius,
      );

  @override
  ThemeExtension<NormalDialogStyle> lerp(
      ThemeExtension<NormalDialogStyle>? other, double t) {
    if (other is! NormalDialogStyle) {
      return this;
    }
    return NormalDialogStyle(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t),
    );
  }
}
