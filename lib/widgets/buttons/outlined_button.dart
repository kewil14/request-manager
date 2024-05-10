import 'package:flutter/material.dart';
import 'package:request_manager/utils/constant/app_colors.dart';
import 'package:request_manager/utils/constant/app_size.dart';

class DefaultOutlinedButton extends StatelessWidget {
  const DefaultOutlinedButton(
      {super.key,
      this.icon,
      this.onPressed,
      required this.content,
      this.color});

  final Widget? icon;
  final void Function()? onPressed;
  final List<Widget> content;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          width: 1.5,
          color: color ?? AppColors.primary,
          style: BorderStyle.solid,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.font16(context)),
        ),
      ),
      onPressed: onPressed,
      child: Container(
        padding:
            EdgeInsets.symmetric(vertical: AppSizes.height(context) * 0.014),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: content,
        ),
      ),
    );
  }
}
