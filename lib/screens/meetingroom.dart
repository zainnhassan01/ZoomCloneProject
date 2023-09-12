import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';
import 'package:zoomcloneproject/services/firebaseauth.dart';

class VideoConferencePage extends StatelessWidget {
  final String conferenceID;
  final String username;
  final bool audio;
  final bool video;
  final String uid;
  final String photoURL;
  const VideoConferencePage({
    Key? key,
    required this.conferenceID,
    required this.username,
    required this.audio,
    required this.video,
    required this.uid, required this.photoURL,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltVideoConference(
        appID: 691919911, 
        appSign:
            "ce528c781b723bf708b45b2ddf850495f25a12b819f221d14848ab8adda33c4b",
        userID: uid,
        userName: username,
        conferenceID: conferenceID,
        config: ZegoUIKitPrebuiltVideoConferenceConfig(
          avatarBuilder: (BuildContext context, Size size, ZegoUIKitUser? user, Map extraInfo) {
          if (user != null && AuthService().user?.uid == uid) {
            return Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey, 
              ),
              child: const Icon(
                Icons.person,
                color: Colors.white,
              ),
          );
        }
      },
          leaveConfirmDialogInfo: ZegoLeaveConfirmDialogInfo(
            title: 'Leave the conference',
            message: 'Are you sure to leave the conference?',
            cancelButtonName: 'Cancel',
            confirmButtonName: 'OK',
          ),
          bottomMenuBarConfig:
              ZegoBottomMenuBarConfig(style: ZegoMenuBarStyle.dark),
        ),
      ),
    );
  }
}
