import 'package:firebase_auth/firebase_auth.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:zoomcloneproject/services/firebaseauth.dart';

class JitsiMeetMethod {
  final User? user = AuthService().user;
  final JitsiMeet _jitsiMeet = JitsiMeet();
  void createMeeting(String room,bool isAudioMuted,bool isVideoMuted) {
    try{
      var options = JitsiMeetConferenceOptions(
      room: room,
      configOverrides: {
        "startWithAudioMuted": isAudioMuted,
        "startWithVideoMuted": isVideoMuted,
        "subject" : "Jitsi with Flutter",
      },
      featureFlags: {
        "unsaferoomwarning.enabled": false
      },
      userInfo: JitsiMeetUserInfo(
          displayName: user?.displayName ?? "User",
          email: user?.email
      ),
    );
    _jitsiMeet.join(options);
    } catch(e){
      print("Error Starting meeting $e");
    }
  }
}