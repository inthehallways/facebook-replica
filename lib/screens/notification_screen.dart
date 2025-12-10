import 'package:flutter/material.dart';
import '../widgets/notification.dart' as notif;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

// General Enhancement: Add 10-20 Notifications with dummy data
class _NotificationScreenState extends State<NotificationScreen> {
  final List<Map<String, String>> notifications = List.generate(
    10,
    (index) => {
      'name': 'User ${index + 1}',
      'post': 'Title ${index + 1}',
      'description': 'Description',
      'time': '${index + 1}h ago'
    },
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: ScreenUtil().screenWidth,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 10.h), 
        itemCount: notifications.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final notifData = notifications[index];
          return notif.Notification(
            name: notifData['name']!,
            post: notifData['post']!,
            description: notifData['description']!,
            time: notifData['time']!
          );
        },
      ),
    );
  }
}