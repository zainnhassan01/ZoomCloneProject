import 'package:flutter/material.dart';
import 'package:zoomcloneproject/utilities/colors.dart';

class HomeButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;
   HomeButton({super.key, required this.icon, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 4),
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 5.0,
                ),
              ],
            ),
            child: Icon(icon),
          ),
          const SizedBox(height: 10,),
          Text(text,),
        ],
      ),
    );
  }
}