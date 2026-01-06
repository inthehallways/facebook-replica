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
            name: 'Hajj Macaraig',
            post: 'Posted a new comment',
            description: '@Glyza Bermudez pakihanap po ng paki ko...',
            time: '1m ago',
            date: 'Jan 6, 2026',
            numOfLikes: 8,
            profileImageUrl: 'assets/images/hajj.jpg',
          ),
          const Divider(),

          notif.CustomInformation(
            name: 'Sophia Leigh',
            post: 'Updated her status',
            description: 'need mo pala space oh ito ✸ • *. ° · ☀️🌎 ° 🌓 • .°• 🚀 ✯✯ ★ * ° °· . • °★ •▁▂▃▄▅▆▇▇▆▅▄▃',
            time: '10m ago',
            date: 'Jan 6, 2025',
            numOfLikes: 71,
            profileImageUrl: 'assets/images/iya_dp.jpg',
          ),
          const Divider(),

          notif.CustomInformation(
            name: 'Glyza Bermudez',
            post: 'Posted a new comment',
            description: '@Hajj Macaraig sige isa pang asar may kalalagyan ka talaga',
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
            imageUrl: 'assets/images/marigold.jpg',
          ),
          const Divider(),

          notif.CustomInformation(
            name: 'AWS Learning Club - Legarda',
            post: 'Posted a photo',
            description: 'the all-purpose kween has spoken!',
            time: '2w ago',
            date: 'Nov 30, 2025',
            numOfLikes: 1000,
            profileImageUrl: 'assets/images/aws_dp.jpg',
            imageUrl: 'assets/images/join-aws.png',
          ),
          const Divider(),

          notif.CustomInformation(
            name: 'Denese Manuel',
            post: 'Updated her status',
            description: 'SALAMAT NGA PALA SA PISO MO. AHE. LABYU. PAKYU. PRINCESSDENESELALABXYUU..',
            time: '10m ago',
            date: 'Mar 1, 2025',
            numOfLikes: 78,
            profileImageUrl: 'assets/images/denese_dp.jpg',
          ),
        ],
      ),
    );
  }
}