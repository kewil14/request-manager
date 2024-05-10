import 'package:flutter/material.dart';

class DefaultTextButton extends StatelessWidget {
  const DefaultTextButton({
    super.key,
    required this.title,
    this.textColor,
    this.size,
    this.style,
    this.onPressed,
  });

  final String title;
  final TextStyle? style;
  final Color? textColor;
  final double? size;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: style ??
            TextStyle(
              color: textColor,
              fontSize: size ?? null,
            ),
      ),
    );
  }
}
