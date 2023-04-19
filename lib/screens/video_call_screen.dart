import 'package:flutter/material.dart';
import 'package:zoom_fake1/utils/colors.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  late TextEditingController meetingIdController;
  late TextEditingController nameController;
  @override
  void initState() {
    meetingIdController = TextEditingController();
    nameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: backgroundColor,
          title: const Text(
            'Join a Meeting',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          centerTitle: true),
      body: Column(
        children: [
          TextField(
            controller: meetingIdController,
            maxLines: 1,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              fillColor: secondaryBackgroundColor,
              filled: true,
              border: InputBorder.none,
              hintText: 'Room-Id',
              contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: nameController,
            maxLines: 1,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              fillColor: secondaryBackgroundColor,
              filled: true,
              border: InputBorder.none,
              hintText: 'Name',
              contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0),
            ),
          )
        ],
      ),
    );
  }
}
