import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:request_manager/utils/constant/app_colors.dart';
import 'package:request_manager/utils/constant/app_size.dart';

class AppTitleSection extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final IconData? icon;

  AppTitleSection(
      {Key? key,
      required this.title,
      this.subtitle = "Voir plus",
      this.onTap,
      this.icon = Icons.arrow_forward_ios_rounded})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: AppSizes.largeTextSize(context),
            fontWeight: FontWeight.bold,
          ),
        ),
        if (subtitle != null || onTap != null || icon != null)
          InkWell(
            onTap: onTap ?? () {},
            child: Row(
              children: [
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                if (icon != null)
                  Icon(
                    icon,
                    size: AppSizes.iconSize(context) * 0.8,
                    color: AppColors.primary,
                  ),
              ],
            ),
          ),
      ],
    );
  }
}
