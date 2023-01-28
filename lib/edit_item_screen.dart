import 'package:flutter/material.dart';
import 'package:learn_flutter_from_basic/basic_screen.dart';

class EditItemScreen extends StatefulWidget {
  final String textItem;
  const EditItemScreen(this.textItem,{Key? key}) : super(key: key);

  @override
  _EditItemScreenState createState() => _EditItemScreenState();
}

class _EditItemScreenState extends State<EditItemScreen> {
  late var controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.textItem);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Screen"),),
      body: Center(child:
          TextFormField(
            controller: controller,
            onEditingComplete: (){
              Navigator.of(context).pop(controller.text);
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => BasicScreen(textItem: controller.text),
              // ));

            },
          ),
        // Text("Value dari halaman sebelumnya: ${widget.textItem}"),
      ),
    );
  }
}
