import 'dart:math';
import 'package:provider/provider.dart';
import 'package:zoomcloneproject/screens/meetingroom.dart';
import 'package:flutter/material.dart';
import 'package:zoomcloneproject/services/firebaseauth.dart';
import 'package:zoomcloneproject/services/firestore.dart';
import 'package:zoomcloneproject/services/providerclass.dart';
import 'package:zoomcloneproject/widgets/homebutton.dart';

class MainHome extends StatelessWidget {
  MainHome({super.key});
  final String? username = AuthService().currentUserName(AuthService().user) ?? "Default Username";
  final String userid = AuthService().currentUserId(AuthService().user) ?? (Random().nextInt(1000000) + 100000).toString();
  final String photoURL = AuthService().currentUserphotoURL(AuthService().user) ?? "https://pixabay.com/vectors/blank-profile-picture-mystery-man-973460/";
  // New Meeting Functionality
  void showAlertDialog(BuildContext context)async {
  print("Username => $username");
  print(AuthService().user?.displayName);
  String room = (Random().nextInt(10000000) + 1000000).toString();
    Widget _backKey(BuildContext context) {
      return TextButton(
        onPressed: () {
          Provider.of<ProviderClass>(context,listen: false).setConference(false);
          Navigator.pop(context);
        },
        child: const Text("Back"),
      );  
    }
    Widget _okKey(BuildContext context) {
      return TextButton(
        onPressed: () {
          Provider.of<ProviderClass>(context,listen: false).setConference(true);
          Navigator.pop(context);
        },
        child: const Text("Ok"),
      );
  }
  AlertDialog _alert = AlertDialog(
    title: const Text("Note your Conference ID to invite other members"),
    content: Text(room),
    actions: [
      _backKey(context),
      _okKey(context),
    ],
  );
  await showDialog(context: context, builder: (context) => _alert,);
  bool conference = Provider.of<ProviderClass>(context,listen: false).conference;
  if(conference){
    FirestoreMethods().addMeetingtoFirestore(room);
     // ignore: use_build_context_synchronously
     Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VideoConferencePage(
            conferenceID: room,
            username: username ?? "Default User",
            audio: true,
            video: true, uid: userid, photoURL: photoURL,
          ),
        ));
  }
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
                onPressed: () => showAlertDialog(context),
              ),
              HomeButton(
                icon: Icons.add_box_sharp,
                text: "Join Meeting",
                onPressed: () {
                  Navigator.pushNamed(context, '/joinmeeting');
                },
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
          const Expanded(
            child: Center(
              child: Text(
                "Create/Join a Meetings with a Click!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
