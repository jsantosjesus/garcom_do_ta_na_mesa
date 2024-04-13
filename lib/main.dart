import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:garcom_do_ta_na_mesa/my_app.dart';
// import 'package:garcom_do_ta_na_mesa/my_app.dart';
// import 'package:garcom_do_ta_na_mesa/src/routes/authenticated_our_not_authenticated.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
