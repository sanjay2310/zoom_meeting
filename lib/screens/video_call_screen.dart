import 'package:flutter/material.dart';
import 'package:jitsi_meet_v1/jitsi_meet.dart';
import 'package:zoom_fake1/resource/auth_method.dart';
import 'package:zoom_fake1/resource/jitsi_meet_method.dart';
import 'package:zoom_fake1/screens/meeting_screen.dart';
import 'package:zoom_fake1/utils/colors.dart';
import 'package:zoom_fake1/widgets/meeting_option.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  final AuthMethods _authMethod = AuthMethods();
  late TextEditingController meetingIdController;
  late TextEditingController nameController;
  bool isAudioMuted = true;
  bool isVideoMuted = true;
  @override
  void initState() {
    meetingIdController = TextEditingController();
    nameController = TextEditingController(text: _authMethod.user.displayName);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    meetingIdController.dispose();
    nameController.dispose();
    JitsiMeet.removeAllListeners();
  }

  _joinMeeting() {
    _jitsiMeetMethods.createMeeting(
        roomName: meetingIdController.text,
        isAudioMuted: isAudioMuted,
        isVideoMuted: isVideoMuted,
        username: nameController.text);
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
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: _joinMeeting,
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'join',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 20),
          MeetingOption(
              text: 'Don\'t Join a Audio',
              isMuted: isAudioMuted,
              onChange: onAudioMuted),
          MeetingOption(
              text: 'Turn Off My Video',
              isMuted: isVideoMuted,
              onChange: onVideoMuted)
        ],
      ),
    );
  }

  onAudioMuted(bool val) {
    setState(() {
      isAudioMuted = val;
    });
  }

  onVideoMuted(bool val) {
    setState(() {
      isVideoMuted = val;
    });
  }
}
