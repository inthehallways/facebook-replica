import 'package:flutter/material.dart';
import '../widgets/custom_info.dart' as notif;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: ScreenUtil().screenWidth,
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        children: [
          notif.CustomInformation(
            name: 'Glyza Bermudez',
            post: 'Posted a new comment',
            description: '@Hajj Macaraig sige isa pang asar may kalalagyan ka talaga...',
            time: '2h ago',
            date: 'Jan 6, 2026',
            numOfLikes: 5,
            profileImageUrl: 'assets/images/gly_dp.jpg',
          ),
          const Divider(),

          notif.CustomInformation(
            name: 'Marygail Angelique',
            post: 'Updated her profile picture',
            description: '22 on 22',
            time: '2w ago',
            date: 'Dec 22, 2025',
            numOfLikes: 150,
            profileImageUrl: 'assets/images/marigold.jpg',
          ),
          const Divider(),

          notif.CustomInformation(
            name: 'Christopher Noval',
            post: 'Gaming',
            description: 'Who wants to play later?',
            time: '1d ago',
            date: 'Jan 04, 2026',
            numOfLikes: 12,
            profileImageUrl: 'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg',
          ),
          
          
        ],
      ),
    );
  }
}