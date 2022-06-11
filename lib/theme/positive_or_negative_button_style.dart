import 'package:flutter/material.dart';

class PositiveOrNegativeButtonStyle
    extends ThemeExtension<PositiveOrNegativeButtonStyle> {
  const PositiveOrNegativeButtonStyle({
    this.title,
    this.radius,
    this.backgroundColor,
  });
  final String? title;
  final double? radius;
  final Color? backgroundColor;

  @override
  ThemeExtension<PositiveOrNegativeButtonStyle> copyWith({
    String? title,
    double? radius,
    Color? backgroundColor,
  }) =>
      PositiveOrNegativeButtonStyle(
        title: title ?? this.title,
        radius: radius ?? this.radius,
        backgroundColor: backgroundColor ?? this.backgroundColor,
      );

  @override
  ThemeExtension<PositiveOrNegativeButtonStyle> lerp(
      ThemeExtension<PositiveOrNegativeButtonStyle>? other, double t) {
    if (other is! PositiveOrNegativeButtonStyle) {
      return this;
    }

    return PositiveOrNegativeButtonStyle(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
    );
  }
}
