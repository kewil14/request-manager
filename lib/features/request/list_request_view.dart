import 'package:flutter/material.dart';

class ListRequestScreen extends StatefulWidget {
  const ListRequestScreen({super.key});

  @override
  State<ListRequestScreen> createState() => _ListRequestScreenState();
}

class _ListRequestScreenState extends State<ListRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Profile Screen"),
      ),
    );
  }
}
