# flutter_gradient_text

A Flutter package for making gradient colored text effect with Text widget.
![image](https://github.com/trdevendran/flutter_gradient_text/assets/12223179/c6265998-6711-4d38-852b-93c2c25c9e2b)

## Key features
- Three types of the gradient effect can apply with this this package as below
  - Linear (This package provides Linear as a default effect)
  - Radial
  - Sweep

 ## Getting started
```
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
            backgroundColor: Colors.grey,
            title: const GradientText(
              Text("Linear Gradient Title", style: TextStyle(fontSize: 24)),
              type: Type.linear,
              colors: [Colors.red, Colors.yellow, Colors.purple, Colors.black],
            )),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
```

### Note:
If you would like to handle both colors and stops then the array count should be same to get the perfect text like below,
```
GradientText(
    Text("Default Gradient Text", style: TextStyle(fontSize: 30)),
    colors: [Colors.red, Colors.green, Colors.black],
    stops: [0, 0.5, 1])
```

See the [Demo](https://github.com/trdevendran/flutter_gradient_text/blob/master/example/lib/main.dart) for more detailed sample project.

### Feel free to contribute to this package!! 🙇‍♂️
Always happy if anyone wants to help to improve this package!

### If you need any features
Please open an issue so that we can discuss your feature request 🙏




