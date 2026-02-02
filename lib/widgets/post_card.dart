import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../constants.dart';
import 'custom_font.dart';
import '../screens/detail_screen.dart';

// ignore: must_be_immutable
class PostCard extends StatelessWidget {
  final String userName;
  final String postContent;
  final String date;
  int numOfLikes;
  final bool hasImage;
  final String? profileImage;
  final String? postImage;
  final bool isAds;
  final String adsMarket;

  PostCard({
    super.key,
    required this.userName,
    required this.postContent,
    this.numOfLikes = 0,
    this.hasImage = false,
    required this.date,
    this.profileImage,
    this.postImage,
    this.isAds = false,
    this.adsMarket = '',
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(ScreenUtil().setSp(10)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                userName: userName,
                postContent: postContent,
                date: date,
                numOfLikes: numOfLikes,
                imageUrl: postImage ?? '',
                profileImageUrl: profileImage ?? '',
              ),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(ScreenUtil().setSp(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: (profileImage != null && profileImage!.startsWith('http'))
                        ? CachedNetworkImageProvider(profileImage!) as ImageProvider
                        : AssetImage(
                            (profileImage == null || profileImage!.isEmpty)
                                ? 'assets/images/aisle_dp.jpg'
                                : profileImage!),
                  ),
                  SizedBox(width: ScreenUtil().setWidth(10)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFont(
                        text: userName,
                        fontSize: ScreenUtil().setSp(15),
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      if (isAds)
                        CustomFont(
                          text: 'Sponsored',
                          fontSize: ScreenUtil().setSp(12),
                          color: Colors.grey,
                        )
                      else
                        Row(
                          children: [
                            CustomFont(
                              text: date,
                              fontSize: ScreenUtil().setSp(12),
                              color: Colors.grey,
                            ),
                            SizedBox(width: ScreenUtil().setWidth(3)),
                            Icon(Icons.public, color: Colors.grey, size: ScreenUtil().setSp(15)),
                          ],
                        ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.more_horiz),
                ],
              ),
              
              SizedBox(height: ScreenUtil().setHeight(5)),
              CustomFont(
                text: postContent,
                fontSize: ScreenUtil().setSp(12),
                color: Colors.black,
              ),
              SizedBox(height: ScreenUtil().setHeight(5)),

              // image logic for local and network images
              (hasImage == true && postImage != null)
                  ? (postImage!.startsWith('http') || postImage!.startsWith('https'))
                      ? CachedNetworkImage(
                          imageUrl: postImage!,
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                          placeholder: (context, url) => Container(
                              height: 200, color: Colors.grey[200], child: const Center(child: CircularProgressIndicator())),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        )
                      : Image.asset(
                          postImage!,
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                        )
                  : const SizedBox(),

              SizedBox(height: ScreenUtil().setHeight(10)),

              // if adsMarket exists, show ad details
              (adsMarket != '') 
              ? Container(
                  padding: EdgeInsets.all(5.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomFont(
                            text: 'MORE DETAILS',
                            fontSize: 17.sp,
                            color: Colors.black,
                          ),
                          CustomFont(
                            text: adsMarket,
                            fontSize: 17.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      // arrow button
                      InkWell(
                        onTap: () {
                           Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                userName: userName,
                                postContent: postContent,
                                date: date,
                                numOfLikes: numOfLikes,
                                imageUrl: postImage ?? '',
                                profileImageUrl: profileImage ?? '',
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: 90.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: FB_DARK_PRIMARY,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Icon(
                            Icons.arrow_right_alt,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              // else, treat it as a normal post
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ActionButton(
                      icon: Icons.thumb_up,
                      label: '$numOfLikes',
                      color: FB_DARK_PRIMARY,
                      onPressed: () {},
                    ),
                    ActionButton(
                      icon: Icons.comment,
                      label: 'Comment',
                      color: FB_DARK_PRIMARY,
                      onPressed: () {},
                    ),
                    ActionButton(
                      icon: Icons.redo,
                      label: 'Share',
                      color: FB_DARK_PRIMARY,
                      onPressed: () {},
                    ),
                  ],
                ),
              (adsMarket != '')
              ? const SizedBox()
              : Row(
                  children: [
                    const CircleAvatar(
                      radius: 13,
                      backgroundImage: AssetImage('assets/images/profile_placeholder.png'),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(10)),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(ScreenUtil().setSp(10), 0, 0, 0),
                        alignment: Alignment.centerLeft,
                        height: ScreenUtil().setHeight(25),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setSp(10))),
                        ),
                        child: CustomFont(
                            text: 'Write a comment...',
                            fontSize: ScreenUtil().setSp(11),
                            color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              // if it's an ad, hide view comments
              (adsMarket != '')
              ? const SizedBox()
              : Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: CustomFont(
                    text: 'View comments',
                    fontSize: ScreenUtil().setSp(12),
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const ActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: color),
      label: CustomFont(
        text: label,
        fontSize: ScreenUtil().setSp(12),
        color: color,
      ),
    );
  }
}