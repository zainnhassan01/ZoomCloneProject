import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoomcloneproject/screens/history_meeting.dart';
import 'package:zoomcloneproject/screens/home.dart';
import 'package:zoomcloneproject/services/providerclass.dart';
import 'package:zoomcloneproject/utilities/colors.dart';

class Home extends StatelessWidget {
   Home({super.key});
  List<Widget> pages = [
    MainHome(),
    const HistoryMeetings(),
    const Text("Contacts"),
    const Text("Settins"),
  ];
  @override
  Widget build(BuildContext context) {
    int page = context.watch<ProviderClass>().pages;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meet & Chat"),
        elevation: 0.0,
        backgroundColor: backgroundColor,
        centerTitle: true,
      ),
      body: pages[page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: page,
        onTap: (value) => context.read<ProviderClass>().pageValue(value),
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        unselectedFontSize: 14,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            label: "Meet & Chat",
            icon: Icon(Icons.comment_bank,),
          ),
          BottomNavigationBarItem(
            label: "Meetings",
            icon: Icon(Icons.lock_clock,),
          ),
          BottomNavigationBarItem(
            label: "Contacts",
            icon: Icon(Icons.person_outline,),
          ),
          BottomNavigationBarItem(
            label: "Settings",
            icon: Icon(Icons.settings_outlined,),
          ),
        ],
      ),
    );
  }
}