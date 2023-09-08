import 'package:firebase_auth/firebase_auth.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:zoomcloneproject/services/firebaseauth.dart';

class JitsiMeetMethod {
  final User? user = AuthService().user;
  final JitsiMeet _jitsiMeet = JitsiMeet();
  void createMeeting({required String room,required bool isAudioMuted,required bool isVideoMuted,String? username}) async {
    try{
      var options = JitsiMeetConferenceOptions(
      room: room,
      configOverrides: {
        "startWithAudioMuted": isAudioMuted,
        "startWithVideoMuted": isVideoMuted,
      },
      featureFlags: {
        "unsaferoomwarning.enabled": false
      },
      userInfo: JitsiMeetUserInfo(
          displayName: username ?? user?.displayName ?? "User",
          email: user?.email
      ),
    );
    _jitsiMeet.join(options);
    } catch(e){
      print("Error Starting meeting $e");
    }
  }
}