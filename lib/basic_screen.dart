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
            Expanded(
                flex: 2,
                child: Text("Ini Body")),
            Expanded(
                flex: 1,
                child: Text("Ini Body")),
            Flexible(child: Text("Ini Body")),
          ],
        ),
      ),
    );
  }
}
