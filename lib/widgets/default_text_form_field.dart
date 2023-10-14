import 'package:flutter/material.dart';

class DefaultTextField extends StatefulWidget {
  const DefaultTextField(
      {super.key,
      required this.hintText,
      this.controller,
      this.keyboardType,
      this.validator,
      this.obscureText,
      this.onFieldSubmitted});

  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String? value)? validator;
  final void Function(String value)? onFieldSubmitted;
  final bool? obscureText;

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      textCapitalization: TextCapitalization.none,
      validator: widget.validator != null
          ? (value) {
              return widget.validator!(value);
            }
          : null,
      obscureText: widget.obscureText ?? false,
      onFieldSubmitted: widget.onFieldSubmitted != null
          ? (value) {
              return widget.onFieldSubmitted!(value);
            }
          : null,
      decoration: InputDecoration(
        hintText: widget.hintText,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 18.5),
        hintStyle: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 16,
        ),
        errorStyle: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.tertiary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      keyboardType: widget.keyboardType,
    );
  }
}
