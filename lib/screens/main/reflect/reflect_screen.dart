import 'package:flutter/material.dart';

class ReflectScreen extends StatefulWidget {
  const ReflectScreen({super.key});

  @override
  State<ReflectScreen> createState() => _ReflectScreenState();
}

class _ReflectScreenState extends State<ReflectScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Reflect screen')
    );
  }
}