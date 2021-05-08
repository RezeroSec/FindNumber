import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final Function onTap;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final TextEditingController controller;

  const TextFieldCustom({
    Key key,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
          hintText: "Masukan urutan angka yang ingin dicari",
        ),
        keyboardType: TextInputType.number,
        controller: controller,
        onTap: onTap,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
      ),
    );
  }
}
