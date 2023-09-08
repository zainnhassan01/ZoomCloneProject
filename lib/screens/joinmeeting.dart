import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoomcloneproject/services/firebaseauth.dart';
import 'package:zoomcloneproject/utilities/colors.dart';
import 'package:zoomcloneproject/widgets/meeting_option.dart';

import '../services/meeting.dart';
import '../services/providerclass.dart';

class JoinMeeting extends StatefulWidget {
  JoinMeeting({super.key});

  @override
  State<JoinMeeting> createState() => _JoinMeetingState();
}

class _JoinMeetingState extends State<JoinMeeting> {
  late TextEditingController _roomIdController;
  late TextEditingController _nameController;
  final JitsiMeetMethod _jitsiMeetMethod = JitsiMeetMethod();
  final AuthService _authService = AuthService();
  @override
  void initState() {
    _roomIdController = TextEditingController();
    _nameController = TextEditingController(text: _authService.user?.displayName  ?? "UserName");
    super.initState();
  }
  
  
  @override
  Widget build(BuildContext context) {
    bool audio = context.watch<ProviderClass>().isAudioMute;
    bool video = context.watch<ProviderClass>().isVideoMute;
    void joinMeeting() {
    _jitsiMeetMethod.createMeeting(room: _roomIdController.text, isAudioMuted: audio, isVideoMuted: video,username: _nameController.text,);
  }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text(
          "Join Meeting",
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _roomIdController,
            maxLines: 1,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              filled: true,
              fillColor: secondaryBackgroundColor,
              hintText: "Room ID",
              border: InputBorder.none,
              contentPadding: EdgeInsets.fromLTRB(20.0,16,0,16),
            ),
          ),
          const SizedBox(height: 10,),
          TextFormField(
            controller: _nameController,
            maxLines: 1,
            decoration: const InputDecoration(
              filled: true,
              fillColor: secondaryBackgroundColor,
              border: InputBorder.none,
              contentPadding: EdgeInsets.fromLTRB(20.0,16,0,16),
            ),
          ),
          const SizedBox(height: 20,),
          InkWell(
            onTap: joinMeeting,
            child: const Text("Join",style: TextStyle(fontSize: 20),),
          ),
          MeetingOption(onChanged:(value) =>  context.read<ProviderClass>().onAudioChange(value), text: "Mute Audio", value: audio),
          MeetingOption(onChanged:(value) =>  context.read<ProviderClass>().onVideoChange(value), text: "Mute Video", value: video),
        ],
      ),
    );
  }
}
