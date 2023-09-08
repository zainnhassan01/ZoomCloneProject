import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zoomcloneproject/utilities/colors.dart';
import 'package:zoomcloneproject/services/firestore.dart';
import 'package:zoomcloneproject/widgets/loading.dart';

class HistoryMeetings extends StatelessWidget {
  const HistoryMeetings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Meeting History",
          style: TextStyle(fontSize: 18),
        ),
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: StreamBuilder<dynamic>(
        stream: FirestoreMethods().meetingHistory,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Loading();
          }
          return ListView.builder(
            itemCount: (snapshot.data as dynamic).docs.length,
            itemBuilder:(context, index) => ListTile(
              title: Text("Room Name: ${(snapshot.data as dynamic).docs[index]["meetingRoom"]}"),
              subtitle: Text("Joined on: ${DateFormat.yMMMd().format((snapshot.data as dynamic).docs[index]["StartedAt"].toDate())}"),
            ),
          );
        },
      ),
    );
  }
}
