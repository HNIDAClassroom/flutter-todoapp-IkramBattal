import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'color_model.dart';
import 'hello_page.dart';

class Login extends StatefulWidget {
  const Login();

  @override
  LoginPage createState() {
    return LoginPage();
  }
}

class LoginPage extends State<Login> {
  String username = '';
  String password = '';
  bool isBackgroundColorChanged = false;

  Future<void> handlePressed(BuildContext context) async {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => HelloPage()));
  }

  void toggleBackgroundColor() {
    final colorModel = Provider.of<ColorModel>(context, listen: false);
    if (isBackgroundColorChanged) {
      colorModel.changeBackgroundColor(Colors.white); // Set it back to the initial color
    } else {
      colorModel.changeBackgroundColor(Colors.purple);
    }
    setState(() {
      isBackgroundColorChanged = !isBackgroundColorChanged;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorModel = Provider.of<ColorModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Hello world!")),
      body: Consumer<ColorModel>(
        builder: (context, colorModel, child) {
          return Container(
            color: colorModel.backgroundColor,
            child: Center(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: IntrinsicHeight(
                    child: SizedBox(
                      height: 350,
                      width: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextField(
                            onChanged: (value) {
                              username = value;
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Username',
                            ),
                          ),
                          const SizedBox(height: 15),
                          TextField(
                            onChanged: (value) {
                              password = value;
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Password',
                            ),
                          ),
                          const SizedBox(height: 15),
                          ElevatedButton(
                            onPressed: () {
                              handlePressed(context);
                            },
                            child: const Text("Submit"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              toggleBackgroundColor();
                            },
                            child: const Text("Change Background Color"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
