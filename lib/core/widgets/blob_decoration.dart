import 'package:flutter/material.dart';

/// Displays the organic blob image tinted to [color].
///
/// The source image (assets/images/blob.png) is black-on-transparent.
/// [BlendMode.srcIn] replaces every black pixel with [color], so the
/// exact shape of the original image is preserved at any color.
///
/// Usage — top-right corner:
/// ```dart
/// Positioned(
///   top: -60,
///   right: -50,
///   child: BlobDecoration(size: 270, color: AppColors.lavender),
/// )
/// ```
class BlobDecoration extends StatelessWidget {
  const BlobDecoration({
    super.key,
    this.size = 240,
    required this.color,
  });

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/blob.png',
      width: size,
      height: size,
      // Tint the black blob to [color] while keeping transparency intact
      color: color,
      colorBlendMode: BlendMode.srcIn,
      fit: BoxFit.contain,
    );
  }
}
