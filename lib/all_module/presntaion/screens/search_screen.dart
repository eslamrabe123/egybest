import 'package:flutter/material.dart';

import '../../../core/global/theme/app_color/app_color_dark.dart';

class SearchIcon extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Function(String)? onSubmit;

  SearchIcon({
    Key? key,
    required this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.onSubmit,
  }) : super(key: key);

  @override
  State<SearchIcon> createState() => _SearchIconState();
}

class _SearchIconState extends State<SearchIcon> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SafeArea(
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
                onFieldSubmitted: widget.onSubmit,
                controller: widget.controller,
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
                keyboardType: widget.keyboardType,
                obscureText: widget.obscureText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
