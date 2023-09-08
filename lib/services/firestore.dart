import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<dynamic> get meetingHistory => _firestore
          .collection("user")
          .doc(_auth.currentUser!.uid)
          .collection("meetings history").snapshots();

  void addMeetingtoFirestore(String roomID) async {
    try {
      await _firestore
          .collection("user")
          .doc(_auth.currentUser!.uid)
          .collection("meetings history")
          .add({
        "meetingRoom": roomID,
        "StartedAt": DateTime.now(),
      });
    } catch (e) {
      print("Firestore error $e");
    }
  }
}
