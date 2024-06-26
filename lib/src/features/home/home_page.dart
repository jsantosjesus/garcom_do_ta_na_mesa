import 'package:flutter/material.dart';
import 'package:garcom_do_ta_na_mesa/src/features/home/logout/presenter/logout_component.dart';

class HomePage extends StatefulWidget {
  final String uid;
  const HomePage({super.key, required this.uid});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.uid),
        actions: [
          LogoutComponent(uid: widget.uid),
        ],
      ),
    );
  }
}
