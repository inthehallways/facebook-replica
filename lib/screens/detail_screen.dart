import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nacpil_mobprog/constants.dart';
import '../widgets/custom_font.dart';

class DetailScreen extends StatefulWidget {
  final String userName;
  final String postContent;
  final String date;
  final int numOfLikes;
  final String imageUrl;
  final String profileImageUrl;

  const DetailScreen({
    super.key,
    required this.userName,
    required this.postContent,
    this.numOfLikes = 0,
    required this.date,
    this.imageUrl = '',
    this.profileImageUrl = '',
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late int currentLikes;
  bool isLiked = false;
  @override
  void initState() {
    super.initState();
    currentLikes = widget.numOfLikes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomFont(
          text: widget.userName,
          fontSize: ScreenUtil().setSp(20),
          color: Colors.black,
        ),
      ),
      body: Container(
        color: Colors.white,
        height: ScreenUtil().screenHeight,
        child: SingleChildScrollView(
          child: Column(
            children: [
              (widget.imageUrl == '')
                  ? const SizedBox(height: 0)
                  : SizedBox(
                      width: double.infinity,
                      child: (widget.imageUrl.startsWith('http'))
                          ? Image.network(widget.imageUrl, fit: BoxFit.fitWidth)
                          : Image.asset(widget.imageUrl, fit: BoxFit.fitWidth),
                    ),
              
              SizedBox(height: ScreenUtil().setHeight(20)),

              Container(
                padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    (widget.profileImageUrl == '')
                        ? const Icon(Icons.person)
                        : CircleAvatar(
                            radius: ScreenUtil().setSp(25),
                            backgroundImage: (widget.profileImageUrl.startsWith('http'))
                                ? NetworkImage(widget.profileImageUrl)
                                : AssetImage(widget.profileImageUrl) as ImageProvider,
                          ),
                    SizedBox(width: ScreenUtil().setWidth(10)),
                    
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomFont(
                          text: widget.userName,
                          fontSize: ScreenUtil().setSp(20),
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        Row(
                          children: [
                            CustomFont(
                              text: widget.date,
                              fontSize: ScreenUtil().setSp(15),
                              color: Colors.grey,
                            ),
                            SizedBox(width: ScreenUtil().setWidth(3)),
                            Icon(
                              Icons.public,
                              color: Colors.grey,
                              size: ScreenUtil().setSp(18),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.more_horiz),
                  ],
                ),
              ),

              SizedBox(height: ScreenUtil().setHeight(15)),

              Container(
                padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                alignment: Alignment.centerLeft,
                child: CustomFont(
                  text: widget.postContent,
                  fontSize: ScreenUtil().setSp(18),
                  color: Colors.black,
                ),
              ),

              SizedBox(height: ScreenUtil().setHeight(30)),
              const Divider(),

              Container(
                padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //  enhancement 3: number of likes on DetailScreen will increment when like button was clicked. 
                    TextButton.icon(
                      onPressed: () {
                        setState(() {
                          if (isLiked) {
                            currentLikes--; 
                            isLiked = false;
                          } else {
                            currentLikes++; 
                            isLiked = true;
                          }
                        });
                      },
                      icon: Icon(
                        Icons.thumb_up, 
                        color: isLiked ? FB_DARK_PRIMARY : FB_LIGHT_PRIMARY
                      ), 
                      label: CustomFont(
                        text: (currentLikes == 0) ? 'Like' : currentLikes.toString(),
                        fontSize: ScreenUtil().setSp(12),
                        color: isLiked ? FB_DARK_PRIMARY : FB_DARK_PRIMARY
                      ),
                    ),
                    
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.comment, color: FB_LIGHT_PRIMARY),
                      label: CustomFont(
                        text: 'Comment',
                        fontSize: ScreenUtil().setSp(12),
                        color: FB_DARK_PRIMARY
                      ),
                    ),
                    
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.redo, color: FB_LIGHT_PRIMARY),
                      label: CustomFont(
                        text: 'Share',
                        fontSize: ScreenUtil().setSp(12),
                        color: FB_DARK_PRIMARY,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}