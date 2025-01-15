import 'package:flutter/material.dart';

import '../constant.dart';

class CustomBottom extends StatelessWidget {
  CustomBottom({super.key, required this.name, this.ontap,});
  String name;
   void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Kprimary,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
