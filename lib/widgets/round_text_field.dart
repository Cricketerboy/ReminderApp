import 'package:flutter/material.dart';
import 'package:remainder_app/utils/app_colors.dart';

class RoundTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final ValueChanged<String>? onChanged;
  final String hintText;
  final TextInputType textInputType;
  final bool isObsecureText;
  final Widget? rightIcon;

  const RoundTextField(
      {super.key,
      this.controller,
      this.validator,
      this.onChanged,
      required this.hintText,
      required this.textInputType,
      this.isObsecureText = false,
      this.rightIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightGrayColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        obscureText: isObsecureText,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: hintText,
          prefixIcon: Container(
            alignment: Alignment.center,
            width: 20,
            height: 20,
            child: Icon(Icons.person, size: 20, color: AppColors.grayColor),
          ),
          hintStyle: TextStyle(fontSize: 12, color: AppColors.grayColor),
        ),
        validator: validator,
      ),
    );
  }
}
