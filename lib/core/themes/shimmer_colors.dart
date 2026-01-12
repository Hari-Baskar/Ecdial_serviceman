import 'package:flutter/material.dart';

class ShimmerColors extends ThemeExtension<ShimmerColors> {
  final Color base;
  final Color highlight;

  const ShimmerColors({required this.base, required this.highlight});

  @override
  ShimmerColors copyWith({Color? base, Color? highlight}) {
    return ShimmerColors(
      base: base ?? this.base,
      highlight: highlight ?? this.highlight,
    );
  }

  @override
  ShimmerColors lerp(ThemeExtension<ShimmerColors>? other, double t) {
    if (other is! ShimmerColors) return this;

    return ShimmerColors(
      base: Color.lerp(base, other.base, t)!,
      highlight: Color.lerp(highlight, other.highlight, t)!,
    );
  }
}
