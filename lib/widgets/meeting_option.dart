import 'package:flutter/material.dart';

class MeetingOption extends StatelessWidget {
  final String text;
  final bool value;
  final Function(bool) onChanged;
   MeetingOption({super.key, required this.onChanged, required this.text, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(text,style: const TextStyle(fontSize: 17),),
          ),
          Switch.adaptive(value: value, onChanged: onChanged)
        ],
      ),
    );
  }
}