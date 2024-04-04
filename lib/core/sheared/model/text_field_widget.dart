import 'package:flutter/material.dart';

class CircularTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Function(String)? onSubmit;

  const CircularTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: 300.0,
            decoration: BoxDecoration(
              color: Colors.black45,

              //shape: BoxShape.circle,
              //color: Colors.white,
              borderRadius: BorderRadius.circular(100),
            ),
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              onFieldSubmitted: onSubmit,
              controller: controller,
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.search,
                  size: 30,
                  opticalSize: 1,
                  color: Colors.white,
                ),
                // label: Text("Enter Movie Name"),

                enabled: true,
                alignLabelWithHint: true,
                border: InputBorder.none,
              ),
              keyboardType: keyboardType,
              obscureText: obscureText,
            ),
          ),
        ),
      ),
    );
  }
}
