import 'package:flutter/material.dart';

import 'package:nevesomiy_app/styles.dart';

class SearchTextField extends StatefulWidget {

  final TextEditingController controller;
  final Function(String)? onTap;  

  const SearchTextField({
    Key? key,
    required this.controller,
    required this.onTap,
  }) : super(key: key);


  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      cursorColor: AppStyle.appCardColor,
      cursorWidth: 3,
      cursorHeight: 20,
      onSubmitted: widget.onTap,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide:  BorderSide(color: AppStyle.appCardColor, width: 1),
          borderRadius: BorderRadius.circular(5)
        ),
        alignLabelWithHint: true,
        filled: true,
        isDense: true,
        //hintText: hint,
        labelStyle: TextStyle(
          color: AppStyle.spaceColor
        ),
        hintStyle:  TextStyle(
          color: AppStyle.spaceColor
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppStyle.appCardColor, width: 2),
          borderRadius: BorderRadius.circular(5)
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:  BorderSide(color: AppStyle.appCardColor, width: 2),
          borderRadius: BorderRadius.circular(5)
        )
      ),
    );
  }
}