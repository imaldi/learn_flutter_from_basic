import 'package:flutter/material.dart';
import 'package:learn_flutter_from_basic/basic_screen.dart';
import 'package:learn_flutter_from_basic/presentation/widgets/tag_dropdown_button.dart';

class EditItemScreen extends StatefulWidget {
  final String textItem;
  const EditItemScreen(this.textItem,{Key? key}) : super(key: key);

  @override
  _EditItemScreenState createState() => _EditItemScreenState();
}

class _EditItemScreenState extends State<EditItemScreen> {
  late var controller;
  var selectedTag;
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
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: controller,
                  onEditingComplete: (){
                    Navigator.of(context).pop(controller.text);
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => BasicScreen(textItem: controller.text),
                    // ));

                  },
                ),
              ),
              // disinikan state internal widget custom berubah, tapi widget
              // tapi widget parent nya (edit_screen) ga berubah, karena
              // Karena, yg d gambar ulang cuma widget customnya (method build nya di panggil lagi oleh setState di dalam widget custom)
              TagDropdownButton(
                selectedTag,
                callbackSetState: (valueFromInternal){
                setState(() {
                  selectedTag = valueFromInternal;
                  print("Dropdown kepencet di dalam Edit Screen");
                });
              },),
              Text("selectedTag: $selectedTag"),
            ],
          ),
        // Text("Value dari halaman sebelumnya: ${widget.textItem}"),
      ),
    );
  }
}
