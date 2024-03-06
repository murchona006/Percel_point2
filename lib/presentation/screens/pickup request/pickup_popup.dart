import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPopup extends StatelessWidget {
  final TextEditingController _textController1 = TextEditingController();
  final TextEditingController _textController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Enter Text'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _textController1,
            decoration: InputDecoration(labelText: 'Text 1'),
          ),
          TextField(
            controller: _textController2,
            decoration: InputDecoration(labelText: 'Text 2'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            // Do something with the entered text
            print('Text 1: ${_textController1.text}');
            print('Text 2: ${_textController2.text}');
            Get.back();
          },
          child: Text('Submit'),
        ),
      ],
    );
  }
}
