import 'package:flutter/material.dart';
import 'torch_light.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Touch Torch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Torch(),
    );
  }
}
