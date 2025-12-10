import 'package:flutter/material.dart';
import '../widgets/custom_font.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Notification extends StatelessWidget {
  const Notification({
    super.key,
    required this.name,
    required this.post,
    required this.description,
    required this.time
  });

  final String name;
  final String post;
  final String description;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ScreenUtil().setSp(15)),
      child: Row(
        children: [
          Icon(
            Icons.person,
            size: ScreenUtil().setSp(50),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(10),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomFont(
                text: name, 
                fontSize: ScreenUtil().setSp(20), 
                color: Colors.black,
                fontWeight: FontWeight.w800,
              ),
              CustomFont(
                text: 'Posted: $post', 
                fontSize: ScreenUtil().setSp(13), 
                color: Colors.black,
              ),
              CustomFont(
                text: description,
                fontSize: ScreenUtil().setSp(12),
                color: Colors.black,
                fontStyle: FontStyle.italic,
              ),
              CustomFont(
                text: time,
                fontSize: 10.sp,
                color: Colors.grey,
          ),
            ],
          ),
          const Spacer(),
          const Icon(Icons.more_horiz),
      ],),
    );
  }
}