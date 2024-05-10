import 'package:flutter/material.dart';
import 'package:request_manager/utils/constant/app_size.dart';

class DefaultElevatedButton extends StatelessWidget {
  const DefaultElevatedButton(
      {super.key,
      this.icon,
      this.onPressed,
      required this.title,
      this.style,
      this.color});

  final Widget? icon;
  final void Function()? onPressed;
  final String title;
  final TextStyle? style;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.font16(context)),
          ),
          backgroundColor: color ?? Colors.white),
      onPressed: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: AppSizes.height(context) * 0.015,
            horizontal: AppSizes.height(context) * 0.015),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon ?? const SizedBox.shrink(),
            if (icon != null) ...[
              const SizedBox(
                width: 8,
              ),
            ],
            Text(
              title,
              style: style ??
                  TextStyle(
                    fontSize: AppSizes.font16(context),
                    color: Colors.white,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
