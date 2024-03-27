import 'package:flutter/material.dart';

class FormContainerWidget extends StatefulWidget {
  final TextEditingController? controller;
  final Key? fieldkey;
  final bool? isPasswordField;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldsubmitted;
  final TextInputType? inputType;

  const FormContainerWidget({
    this.controller,
    this.fieldkey,
    this.isPasswordField,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldsubmitted,
    this.inputType,
    super.key,
  });
  @override
  State<FormContainerWidget> createState() => FormContainerWidgetState();
}

class FormContainerWidgetState extends State<FormContainerWidget> {
  bool _obscureText = true;
  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.inputType,
        key: widget.fieldkey,
        obscureText: widget.isPasswordField == true ? _obscureText : false,
        onSaved: widget.onSaved,
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldsubmitted,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.white),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: widget.isPasswordField == true
                ? Icon(_obscureText ? Icons.visibility_off : Icons.visibility,
                    color: _obscureText == false ? Colors.orange : Colors.grey)
                : const Text(""),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(
                20,
              ),
              top: Radius.circular(
                20,
              ),
            ),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          //   labelText: 'User Name',
          labelStyle: const TextStyle(
            color: Colors.white,
          ),
          iconColor: Colors.white,
        ),
      ),
    );
  }
}
