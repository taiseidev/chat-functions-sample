import 'package:flutter/material.dart';

class NormalButtonStyle extends ThemeExtension<NormalButtonStyle> {
  const NormalButtonStyle({
    Key? key,
    this.primaryColor,
    this.borderRadius,
    this.title,
  }) : super();

  final Color? primaryColor;
  final double? borderRadius;
  final String? title;
  @override
  ThemeExtension<NormalButtonStyle> copyWith({
    Color? primaryColor,
    double? borderRadius,
    String? title,
  }) =>
      NormalButtonStyle(
        primaryColor: primaryColor ?? this.primaryColor,
        borderRadius: borderRadius ?? this.borderRadius,
        title: title ?? this.title,
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
