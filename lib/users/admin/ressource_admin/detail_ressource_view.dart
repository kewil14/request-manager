import 'package:flutter/material.dart';

class DetailRessourceScreen extends StatefulWidget {
  const DetailRessourceScreen({super.key});

  @override
  State<DetailRessourceScreen> createState() => _DetailRessourceScreenState();
}

class _DetailRessourceScreenState extends State<DetailRessourceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("DetailRessource Screen"),
      ),
    );
  }
}
