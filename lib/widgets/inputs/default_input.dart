import 'package:flutter/material.dart';
import 'package:request_manager/utils/constant/app_size.dart';

class BaseTextField extends StatefulWidget {
  final String? labelText;
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final bool readOnly;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final int? maxLines;
  final Widget? suffixIcon;
  final double borderRadius;
  final VoidCallback? onTap;
  final EdgeInsets? padding;

  const BaseTextField({
    super.key,
    this.labelText,
    this.padding,
    required this.hintText,
    required this.controller,
    this.readOnly = false,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines,
    this.borderRadius = 500,
    this.onTap,
  });

  @override
  _BaseTextFieldState createState() => _BaseTextFieldState();
}

class _BaseTextFieldState extends State<BaseTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      readOnly: widget.readOnly,
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false,
      keyboardType: widget.maxLines == null
          ? widget.keyboardType
          : TextInputType.multiline,
      maxLines: widget.maxLines ?? 1,
      validator: widget.validator,
      style: TextStyle(
        fontSize: AppSizes.mediumTextSize(context),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        contentPadding: widget.padding ??
            EdgeInsets.symmetric(
              vertical: AppSizes.mediumPadding(context),
              horizontal: AppSizes.mediumPadding(context),
            ),
        labelText: widget.labelText,
        hintText: widget.hintText,
        labelStyle: TextStyle(
          fontSize: AppSizes.mediumTextSize(context),
          // color: AppColors.gray,
        ),
        hintStyle: TextStyle(
          fontSize: AppSizes.mediumTextSize(context),
          // color: AppColors.gray,
        ),
        border: OutlineInputBorder(
          // borderSide: const BorderSide(color: AppColors.lightGray),
          borderRadius: BorderRadius.circular(AppSizes.mediumRadius(context)),
        ),
        enabledBorder: OutlineInputBorder(
          // borderSide: const BorderSide(color: AppColors.lightGray),
          borderRadius: BorderRadius.circular(AppSizes.mediumRadius(context)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.mediumRadius(context)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.mediumRadius(context)),
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  // color: AppColors.gray,
                  size: AppSizes.iconSize(context),
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : widget.suffixIcon,
      ),
    );
  }
}
