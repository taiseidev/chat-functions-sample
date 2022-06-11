import 'package:flutter/material.dart';

class PositiveOrNegativeButtonStyle
    extends ThemeExtension<PositiveOrNegativeButtonStyle> {
  const PositiveOrNegativeButtonStyle({
    this.radius,
    this.textColor,
    this.backgroundColor,
  });
  final double? radius;
  final Color? textColor;
  final Color? backgroundColor;

  @override
  ThemeExtension<PositiveOrNegativeButtonStyle> copyWith({
    double? radius,
    Color? textColor,
    Color? backgroundColor,
  }) =>
      PositiveOrNegativeButtonStyle(
        radius: radius ?? this.radius,
        textColor: textColor ?? this.textColor,
        backgroundColor: backgroundColor ?? this.backgroundColor,
      );

  @override
  ThemeExtension<PositiveOrNegativeButtonStyle> lerp(
      ThemeExtension<PositiveOrNegativeButtonStyle>? other, double t) {
    if (other is! PositiveOrNegativeButtonStyle) {
      return this;
    }

    return PositiveOrNegativeButtonStyle(
      textColor: Color.lerp(textColor, other.textColor, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
    );
  }
}
