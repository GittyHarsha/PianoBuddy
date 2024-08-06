import 'package:flutter/material.dart';
import './widgets/funky_container.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Funky Container Example'),
        ),
        body: Center(
          child: FunkyContainer(
            width: 100,
            height: 100,
            rounded: true,
            child: const Center(
              child: Text(
                'Hello, Funky Container!',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
