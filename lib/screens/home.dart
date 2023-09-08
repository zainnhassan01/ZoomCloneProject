import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoomcloneproject/services/meeting.dart';
import 'package:zoomcloneproject/widgets/homebutton.dart';

class MainHome extends StatelessWidget {
  MainHome({super.key});
  
  String room = (Random().nextInt(10000000)+ 1000000).toString();
  createNewMeeting(String room) {
    JitsiMeetMethod().createMeeting(room, true, true);
  }
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
                onPressed: () => createNewMeeting(room),
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
