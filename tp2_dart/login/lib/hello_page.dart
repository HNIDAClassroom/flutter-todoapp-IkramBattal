import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'color_model.dart'; // Import the ColorModel class

class HelloPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorModel = Provider.of<ColorModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Hello Page")),
      body: Container(
        color: colorModel.backgroundColor,
        child: Center(
          child: Text(
            'Hello',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
