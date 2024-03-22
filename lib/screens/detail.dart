import 'package:flutter/material.dart';

class AddDetailScreen extends StatefulWidget {
  const AddDetailScreen({super.key});

  @override
  State<AddDetailScreen> createState() => _DeatailScreenState();
}

class _DeatailScreenState extends State<AddDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Deatils"),
      ),
    );
  }
}