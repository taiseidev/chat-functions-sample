import 'package:flutter/material.dart';

class NormalButtonStyle extends ThemeExtension<NormalButtonStyle> {
  const NormalButtonStyle({
    Key? key,
    this.primaryColor,
    this.borderRadius,
  }) : super();

  final Color? primaryColor;
  final double? borderRadius;
  @override
  ThemeExtension<NormalButtonStyle> copyWith({
    Color? primaryColor,
    double? borderRadius,
  }) =>
      NormalButtonStyle(
        primaryColor: primaryColor ?? this.primaryColor,
        borderRadius: borderRadius ?? this.borderRadius,
      );

  @override
  ThemeExtension<NormalButtonStyle> lerp(
      ThemeExtension<NormalButtonStyle>? other, double t) {
    if (other is! NormalButtonStyle) {
      return this;
    }
    return NormalButtonStyle(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t),
    );
  }
}
