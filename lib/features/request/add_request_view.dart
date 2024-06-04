import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:request_manager/controllers/request_controller.dart';

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
  List<String> listOfCategory = [
    'It',
    'Computer Science',
    'Business',
    'Data Science',
    'Infromation Technologies',
    'Health',
    'Physics'
  ];
  String? selectedIndexCategory = 'Business';
  final controller = Get.put(RequestController());
  @override
  void initState() {
    super.initState();
    this.controller.getTypeRequest();
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
        /* child: Column(
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
        ),*/
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Objet",
                  prefixIcon: Icon(Icons.emoji_objects_outlined),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    // borderSide: BorderSide(color: appStore.iconColor!),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    // borderSide: BorderSide(width: 1, color: appStore.iconColor!),
                  ),
                ),
                controller:
                    TextEditingController(text: "Rectification de note"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SingleChildScrollView(
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      Text('Type de Requete',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                          elevation: 4,
                          child: DropdownButton(
                            isExpanded: true,
                            // dropdownColor: appStore.appBarColor,
                            value: selectedIndexCategory,
                            style: TextStyle(fontWeight: FontWeight.bold),
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              //color: appStore.iconColor,
                            ),
                            underline: SizedBox(
                              height: 0,
                            ),
                            onChanged: (dynamic newValue) {
                              setState(() {
                                // toasty(context, newValue);
                                selectedIndexCategory = newValue;
                              });
                            },
                            items: listOfCategory.map((category) {
                              return DropdownMenuItem(
                                child: Center(
                                  child: Text(category,
                                      style: TextStyle(
                                        color: Colors.cyan,
                                      )),
                                ),
                                // .paddingLeft(8),
                                value: category,
                              );
                            }).toList(),
                          )),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextFormField(
                  controller: TextEditingController(text: ""),

                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.mail,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      // borderSide: BorderSide(color: appStore.iconColor!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      // borderSide: BorderSide(width: 1, color: appStore.iconColor!),
                    ),
                    labelText: 'Message',
                    //labelStyle: primaryTextStyle(),
                    alignLabelWithHint: true,
                  ),
                  maxLines: 3,
                  // cursorColor: appStore.isDarkModeOn ? white : blackColor,
                  keyboardType: TextInputType.multiline,
                  validator: (s) {
                    if (s!.trim().isEmpty) return 'Address is required';
                    return null;
                  },
                ),
              ),
              Container(
                width: 400,
                padding: EdgeInsets.all(16),
                child: FloatingActionButton(
                  heroTag: '2',
                  backgroundColor: Colors.cyan,
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    this.controller.getTypeRequest();
                  },
                ),
              ),
            ],
          ),
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
