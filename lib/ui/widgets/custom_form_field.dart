import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String? iconName;
  final String hint;
  final Color borderColor;
  final TextInputType? inputType;
  final String? Function(String?)? validator;

  const CustomFormField({super.key,
    this.iconName,
    required this.hint,
    required this.borderColor,
    this.inputType,
    this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: _getPrefixIcon(),
        hintText: hint,
        contentPadding: const EdgeInsets.only(left: 25.0, top: 20.0,
            right: 20.0, bottom: 20.0),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: borderColor, width: 1)
        ),
      )
    );
  }

  Widget? _getPrefixIcon() {
    if (iconName == null) return null;

    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 25.0, end: 15.0),
      child: SizedBox(
        width: 20.0,
        height: 20.0,
        child: Image.asset("assets/images/$iconName.png")
      )
    );
  }
}
