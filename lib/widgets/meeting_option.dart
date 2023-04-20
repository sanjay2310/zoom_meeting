import 'package:flutter/material.dart';
import 'package:zoom_fake1/utils/colors.dart';

class MeetingOption extends StatelessWidget {
  final String text;
  final bool isMuted;
  final Function(bool) onChange;
  
  const MeetingOption(
      {super.key,
      required this.text,
      required this.isMuted,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: secondaryBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
          Switch(value: isMuted, onChanged: onChange)
        ],
      ),
    );
  }
}
