import 'package:flutter/material.dart';
import 'torch_controller.dart';

class Torch extends StatefulWidget {
  const Torch({Key? key}) : super(key: key);

  @override
  _TorchState createState() => _TorchState();
}

class _TorchState extends State<Torch> {
  final bgColor = Colors.lightBlue;
  final textColor = Colors.white;
  bool isActive = false;
  final TorchController _torchController = TorchController();

  @override
  void initState() {
    super.initState();
    _torchController.initialize();
  }

  void _toggleTorch() async {
    bool hasTorch = await _torchController.hasTorch();
    if (!hasTorch) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('This device does not have a torch')),
      );
      return;
    }
    setState(() {
      isActive = !isActive;
    });
    _torchController.toggleTorch(isActive: isActive);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "Touch Torch",
          style: TextStyle(fontSize: 16, color: textColor),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: _toggleTorch,
                      child: Image.asset(
                        isActive ? 'assets/on.png' : 'assets/off.png',
                        width: 200,
                        height: 400,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Tap the Image to On and Off the light',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
