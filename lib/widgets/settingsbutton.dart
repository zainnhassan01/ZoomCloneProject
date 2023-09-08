import 'package:flutter/material.dart';
import 'package:zoomcloneproject/utilities/colors.dart';

class SettingsButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  SettingsButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0,vertical: 40),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          minimumSize:const Size(double.infinity, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: const BorderSide(
            style: BorderStyle.solid,
            color: buttonColor,         
          )
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
