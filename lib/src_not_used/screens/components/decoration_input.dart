import 'package:flutter/material.dart';

InputDecoration getAuthenticationInputDecoration(String label) {
  return InputDecoration(
    label: Text(label),
    labelStyle: TextStyle(color: Colors.black),
  );
}
