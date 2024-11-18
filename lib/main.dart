import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Basic Interactivity'),
        ),
        body: const Center(
          child: AssignmentWidget(),
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  void handlePress() {
    if (kDebugMode) {
      print('Button pressed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: handlePress,
      child: const Text('Press me'),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({super.key});

  final TextEditingController textEditingController = TextEditingController();

  void handleSubmit() {
    if (kDebugMode) {
      print('Text field submitted: ${textEditingController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: textEditingController,
            decoration: const InputDecoration(labelText: 'Enter something'),
          ),
          ElevatedButton(
            onPressed: handleSubmit,
            child: const Text('Submit'),
          )
        ],
      ),
    );
  }
}

class GestureDetectorWidget extends StatelessWidget {
  const GestureDetectorWidget({super.key});

  void handleTap() {
    if (kDebugMode) {
      print('Container tapped');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleTap,
      child: Container(
        color: Colors.blue,
        width: 200,
        height: 200,
        child: const Center(
          child: Text(
            'Tap me',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class AssignmentWidget extends StatelessWidget {
  const AssignmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        FirstAssignmentWidget(),
        SizedBox(height: 16),
        SecondAssignmentWidget(),
      ],
    );
  }
}

class FirstAssignmentWidget extends StatefulWidget {
  const FirstAssignmentWidget({super.key});

  @override
  State<FirstAssignmentWidget> createState() => _FirstAssignmentWidgetState();
}

class _FirstAssignmentWidgetState extends State<FirstAssignmentWidget> {
  late Color containerColor = getRandomColor();

  Color getRandomColor() {
    return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }

  void changeColor() {
    setState(() {
      containerColor = getRandomColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: changeColor,
          child: const Text('Change color'),
        ),

        const SizedBox(width: 16),

        Container(
          color: containerColor,
          width: 100,
          height: 100,
        ),
      ],
    );
  }
}

class SecondAssignmentWidget extends StatefulWidget {
  const SecondAssignmentWidget({super.key});

  @override
  State<SecondAssignmentWidget> createState() => _SecondAssignmentWidgetState();
}

class _SecondAssignmentWidgetState extends State<SecondAssignmentWidget> {
  String text = 'The user has not submitted any text yet.';

  final TextEditingController textEditingController = TextEditingController();

  void updateText() {
    setState(() {
      text = 'The user has submitted: ${textEditingController.text}.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            controller: textEditingController,
            decoration: const InputDecoration(labelText: 'Enter something'),
          ),

          const SizedBox(height: 8),
      
          ElevatedButton(
            onPressed: updateText,
            child: const Text('Submit'),
          ),
      
          const SizedBox(height: 16),
      
          Text(text),
        ]
      ),
    );
  }
}