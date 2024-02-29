// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onpressed;
  final String text;

  const CustomButton({
    Key? key,
    required this.onpressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black12,
      
    ),
      onPressed: onpressed,
      child:  Text(text),
    );
  }
}
