import 'package:flutter/material.dart';

class ContaPage extends StatefulWidget {
  final String mesaId;
  const ContaPage({super.key, required this.mesaId});

  @override
  State<ContaPage> createState() => _ContaPageState();
}

class _ContaPageState extends State<ContaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conta'),
      ),
    );
  }
}
