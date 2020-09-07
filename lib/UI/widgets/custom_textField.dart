import 'package:flutter/material.dart';

class CustomTxTFieldForAuth extends StatelessWidget {
  final String label;
  final bool obscureText;
  final Function(String) onChanged;
  final Function(String) validator;

  CustomTxTFieldForAuth({
    this.label,
    this.obscureText,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        fillColor: Color(0xff464446),
        filled: true,
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Color(0xff707070),
          ),
        ),
      ),
    );
  }
}

class CustomTxTFieldForAddTask extends StatelessWidget {
  final String hint;
  TextEditingController txtContoller;

  CustomTxTFieldForAddTask({
    this.hint,
    this.txtContoller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(0xff707070),
        ),
      ),
      child: TextFormField(
        controller: txtContoller,
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Color(0xff707070)),
          fillColor: Colors.white,
          filled: true,
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class CustomTxTFieldForAddTaskDes extends StatelessWidget {
  final String hint;
  TextEditingController txtContoller;

  CustomTxTFieldForAddTaskDes({
    this.hint,
    this.txtContoller
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(0xff707070),
        ),
      ),
      child: TextFormField(
        maxLines: 8,
        controller: txtContoller,
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Color(0xff707070)),
          fillColor: Colors.white,
          filled: true,
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
