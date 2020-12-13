import 'package:flutter/material.dart';
import '../constants.dart';

InputDecoration buildTextFormDecoration(String mylabelText) {
  return InputDecoration(
    contentPadding: EdgeInsets.only(bottom: 4, top:8),
    labelText: mylabelText,
      labelStyle: TextStyle(
          fontWeight: FontWeight.w300,
          color: kGrey),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color:kLightBlue))
  );
}