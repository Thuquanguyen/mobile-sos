import 'package:flutter/material.dart';

class CustomTextForm extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final bool isActive;
  final bool isMulti;
  final IconData icons;
  final Function onPress;

  const CustomTextForm(
      {Key key,
      this.controller,
      this.title,
      this.isActive,
      this.isMulti,
      this.icons,
      this.onPress})
      : super(key: key);

  @override
  _CustomTextFormState createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
          child: TextField(
        controller: widget.controller,
        keyboardType: widget.isMulti ? TextInputType.multiline : null,
        maxLines: widget.isMulti ? null : 1,
        decoration: InputDecoration(
            hintText: widget.title,
            labelText: widget.title,
            prefixIcon: Icon(
              Icons.description,
              color: Colors.blue,
            ),
            suffixIcon: IconButton(
                icon: Icon(
                  widget.icons,
                  size: 17,
                  color: Colors.teal,
                ),
                onPressed: widget.isActive
                    ? () {
                        setState(() {
                          widget.controller.text = "";
                        });
                      }
                    : widget.onPress),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12))),
      )),
    );
  }
}
