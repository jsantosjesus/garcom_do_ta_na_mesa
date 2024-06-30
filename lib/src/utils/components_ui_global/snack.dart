import 'package:flutter/material.dart';
import 'package:garcom_do_ta_na_mesa/src/utils/config_ui_global/config_ui_global.dart';

showSnackBar(
    {required BuildContext context,
    required String mesage,
    bool isError = true}) {
  SnackBar snackBar = SnackBar(
      content: Text(
        mesage,
        style: const TextStyle(fontFamily: fontGlobal),
      ),
      backgroundColor: (isError) ? Colors.red : Colors.green);

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
