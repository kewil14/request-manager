import 'package:flutter/material.dart';

class DetailRequestScreen extends StatefulWidget {
  const DetailRequestScreen({super.key});

  @override
  State<DetailRequestScreen> createState() => _DetailRequestScreenState();
}

class _DetailRequestScreenState extends State<DetailRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("DetailRequest Screen"),
      ),
    );
  }
}
