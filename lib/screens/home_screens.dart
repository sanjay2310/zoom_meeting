import 'package:flutter/material.dart';
import 'package:zoom_fake1/resource/auth_method.dart';
import 'package:zoom_fake1/screens/history_meeting.dart';
import 'package:zoom_fake1/screens/meeting_screen.dart';
import 'package:zoom_fake1/utils/colors.dart';
import 'package:zoom_fake1/widgets/custom_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    MeetingScreen(),
    const HistoryMeetingScreen(),
    const Text('Cooming soon'),
    CustomButton(text: 'Logout', onPressed:()=> AuthMethods().signOut())
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text('Meet & Chat'),
        centerTitle: true,
        elevation: 0,
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        unselectedFontSize: 14,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.comment_bank), label: 'Meet&Chat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.lock_clock), label: 'Meeting'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined), label: 'Contacts'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: 'Setting'),
        ],
      ),
    );
  }
}
