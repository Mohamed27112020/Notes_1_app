import 'package:flutter/material.dart';

import '../constant.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key, required this.Htext, required this.Maxline, this.onsaved, this.onChanged});
  String Htext;
  int Maxline;
  final void Function(String?)? onsaved;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      onChanged: onChanged,
      onSaved: onsaved,
      keyboardType: TextInputType.text,
      cursorColor: Kprimary,
      maxLines: Maxline,
      decoration: InputDecoration(
        hintText: Htext,
        hintStyle: TextStyle(color: Kprimary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Kprimary),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(
              color: Kprimary,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(
              color: Kprimary,
            )),
      ),
    );
  }
}
