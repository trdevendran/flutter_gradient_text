import 'package:flutter/material.dart';
import 'package:flutter_gradient_text/flutter_gradient_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const GradientText(
            Text("Linear Gradient Title", style: TextStyle(fontSize: 30)),
            type: Type.linear,
            colors: [Colors.red, Colors.green, Colors.black],
          )
        ),
        body: const Center(
          child: Column(
            children: [
              GradientText(
                Text("Default Gradient Text", style: TextStyle(fontSize: 30)),
                colors: [Colors.red, Colors.green, Colors.black],
              ),
              GradientText(
                Text("Radial Gradient Text", style: TextStyle(fontSize: 30)),
                type: Type.radial,
                radius: 1,
                colors: [Colors.red, Colors.green, Colors.black],
              ),
              GradientText(
                Text("Sweep Gradient Text", style: TextStyle(fontSize: 30)),
                type: Type.sweep,
                colors: [Colors.red, Colors.green, Colors.black],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
