import 'package:flutter/material.dart';

class TagDropdownButton extends StatefulWidget {
  String? selectedTag;
  void Function(String?)? callbackSetState;
  TagDropdownButton(this.selectedTag, {this.callbackSetState, Key? key})
      : super(key: key);

  @override
  _TagDropdownButtonState createState() => _TagDropdownButtonState();
}

// kita bisa reuse layout, tapi functionalitas/behavior widget beda
class _TagDropdownButtonState extends State<TagDropdownButton> {
  // String? selectedTag;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: widget.selectedTag,
        hint: Text("Pilih Tag"),
        items: const [
          DropdownMenuItem(child: Text("Chores"), value: "Chores"),
          DropdownMenuItem(child: Text("Fitness"), value: "Fitness"),
          DropdownMenuItem(
            child: Text("Study"),
            value: "Study",
          ),
        ],
        onChanged: (value) {
          setState(() {
            widget.selectedTag = value;
            if (widget.callbackSetState != null) {
              widget.callbackSetState!(value);
            }
          });
        });
  }
}
