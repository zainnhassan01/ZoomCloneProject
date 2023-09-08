import 'package:flutter/material.dart';
import 'package:zoomcloneproject/widgets/homebutton.dart';

class MainHome extends StatelessWidget {
  const MainHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeButton(
                icon: Icons.videocam,
                text: "New Meeting",
                onPressed: () {},
              ),
              HomeButton(
                icon: Icons.add_box_sharp,
                text: "Join Meeting",
                onPressed: () {},
              ),
              HomeButton(
                icon: Icons.calendar_today_rounded,
                text: "Schedule",
                onPressed: () {},
              ),
              HomeButton(
                icon: Icons.arrow_upward,
                text: "Share Screen",
                onPressed: () {},
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Text(
                "Create/Join a Meetings with a Click!",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
