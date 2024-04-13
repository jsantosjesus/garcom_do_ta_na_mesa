import 'package:flutter/material.dart';

InputDecoration getInputDecoration(String label) {
  return InputDecoration(
    label: Text(label),
    labelStyle: const TextStyle(color: Colors.black),
  );
}
