import 'package:flutter/material.dart';

class AddRequestScreen extends StatefulWidget {
  const AddRequestScreen({Key? key});

  @override
  State<AddRequestScreen> createState() => _AddRequestScreenState();
}

class _AddRequestScreenState extends State<AddRequestScreen> {
  late TextEditingController objetController;
  late TextEditingController messageController;
  late int typeRequestId;
  late int studentId;
  late int ueId;

  @override
  void initState() {
    super.initState();
    objetController = TextEditingController();
    messageController = TextEditingController();
    typeRequestId = 0;
    studentId = 0;
    ueId = 0;
  }

  @override
  void dispose() {
    objetController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Request'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: objetController,
              decoration: const InputDecoration(
                labelText: 'Objet',
              ),
            ),
            TextField(
              controller: messageController,
              decoration: const InputDecoration(
                labelText: 'Message',
              ),
            ),
            DropdownButtonFormField<int>(
              value: typeRequestId,
              onChanged: (value) {
                setState(() {
                  typeRequestId = value!;
                });
              },
              items: [
                DropdownMenuItem(
                  value: 1,
                  child: const Text('Type 1'),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: const Text('Type 2'),
                ),
                // Add more dropdown items for different types
              ],
              decoration: const InputDecoration(
                labelText: 'Type Request',
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  studentId = int.tryParse(value) ?? 0;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Student ID',
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  ueId = int.tryParse(value) ?? 0;
                });
              },
              decoration: const InputDecoration(
                labelText: 'UE ID',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Perform the create request operation using the entered values
                final requestDto = RequestDto(
                  objet: objetController.text,
                  message: messageController.text,
                  typeRequestId: typeRequestId,
                  studentId: studentId,
                  ueId: ueId,
                );
                // Call the create request API or perform necessary actions
              },
              child: const Text('Create Request'),
            ),
          ],
        ),
      ),
    );
  }
}

class RequestDto {
  final String? objet;
  final String? message;
  final int typeRequestId;
  final int studentId;
  final int ueId;

  RequestDto({
    required this.objet,
    required this.message,
    required this.typeRequestId,
    required this.studentId,
    required this.ueId,
  });
}