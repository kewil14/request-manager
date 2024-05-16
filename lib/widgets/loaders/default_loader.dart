import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DefaultLoader extends StatelessWidget {
  final double? height;
  final double? width;
  final double? borderRaduis;
  const DefaultLoader({
    super.key,
    this.height,
    this.width,
    this.borderRaduis,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRaduis == null
              ? null
              : BorderRadius.circular(borderRaduis!),
        ),
      ),
    );
  }
}
