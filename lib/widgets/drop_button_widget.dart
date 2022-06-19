import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DropbuttonWidget extends StatefulWidget {
  final String hintext;
   String ratingController;
  final List<String> item;
  DropbuttonWidget(
      {required this.hintext,
      required this.ratingController,
      required this.item});
  @override
  State<DropbuttonWidget> createState() => _DropbuttonWidgetState();
}

class _DropbuttonWidgetState extends State<DropbuttonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
            fillColor: Colors.blueAccent,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            )),
        hint: Text(
          "${widget.hintext}",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        value: widget.ratingController,
        items: widget.item
            .map((e) => DropdownMenuItem(
                  child: Text(e),
                  value: e,
                ))
            .toList(),
        onChanged: (value) {
          setState(() {
            widget.ratingController = value!;
          });
        },
      ),
    );
  }
}
