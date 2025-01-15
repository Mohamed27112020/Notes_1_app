import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class customTextField extends StatelessWidget {
  customTextField({
    required this.obscureText,
    required this.hinttext,
    required this.onchange,
    required this.keyboardType,
    required this.controller,
  });
  TextEditingController controller =TextEditingController();
  Function(String)? onchange;
  TextInputType keyboardType;
  bool obscureText;
  String hinttext;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'field is required ';
        }
      },
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hinttext,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      textAlign: TextAlign.center,
      onChanged: onchange,
    );
  }
}
