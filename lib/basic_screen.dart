import 'package:flutter/material.dart';

class BasicScreen extends StatelessWidget {
  const BasicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basic Screen"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Ini Body"),
            Text("Ini Body"),
            Container(
                color: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                margin: const EdgeInsets.all(16),
                child: Text("Ini Body",
                  style: TextStyle(color: Color(0xFF852222)),
                )),
            Container(
                color: Colors.green,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(16),
                child: Text("Ini Body")),
            Text("Ini Body"),
          ],
        ),
      ),
    );
  }
}
