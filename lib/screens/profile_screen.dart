import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nacpil_mobprog/constants.dart';
import '../widgets/post_card.dart';
import 'package:nacpil_mobprog/widgets/custom_button.dart';
import 'package:nacpil_mobprog/widgets/custom_font.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

    // Enhancement 3: Reuse the formerly known newsfeed_card to recreate wall post or profile post
    final List<Map<String, dynamic>> posts = const [ 
        {
        'userName': 'Celesse Aisle Nacpil',
        'postContent': 'walang katapusang schoolworks na para bang wag na lang mag noche buena talaga',
        'numOfLikes': 100,
        'date': 'Nov 28',
        'hasImage': false,
        'profileImage': 'assets/images/aisle_dp.jpg'
        },
        {
        'userName': 'AWS Learning Club - Legarda',
        'postContent': 'the all-purpose kween has spoken!',
        'numOfLikes': 1000,
        'date': 'Nov 30',
        'hasImage': true,
        'profileImage': 'assets/images/aws_dp.jpg',
        'postImage': 'assets/images/join-aws.png',
        },
        {
        'userName': 'Celesse Aisle Nacpil',
        'postContent': 'wala na uwian na corny na...',
        'numOfLikes': 1000,
        'date': 'Nov 30',
        'hasImage': true,
        'profileImage': 'assets/images/aisle_dp.jpg',
        'postImage': 'assets/images/nakikisali.jpg',
        },
  ];

  List<Map<String, dynamic>> get myPosts {
    return posts
        .where((post) => post['userName'] == 'Celesse Aisle Nacpil')
        .toList();
    } // End of Enhancement 3

    final List<String> photos = [
    'assets/images/nakikisali.jpg',
    'assets/images/me.png',
    'assets/images/pogi.jpg',
    'assets/images/lewls.jpg',
    'assets/images/webcamtoy.jpg',
    'assets/images/463.png',
    ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Container(
            color: Colors.white,
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Stack(
                            clipBehavior: Clip.none,
                             children: [
                                Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        image: const DecorationImage(
                                            image: AssetImage('assets/images/cover.jpg'), // Change cover photo
                                            fit: BoxFit.cover,
                                        ),
                                    ),
                                ),
                                Positioned(
                                    bottom: -50,
                                    left: ScreenUtil().setWidth(20),
                                    child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                            const CircleAvatar(
                                                radius: 50,
                                                backgroundImage: AssetImage('assets/images/aisle_dp.jpg'), // Change profile picture
                                            ),
                                            Positioned(
                                                bottom: 0,
                                                right: 0,
                                                child: CircleAvatar(
                                                    radius: 15,
                                                    backgroundColor: Colors.grey[300],
                                                    child: const Icon(
                                                        Icons.camera_alt,
                                                        size: 16,
                                                        color: Colors.black,
                                                    ),
                                                ),
                                            ),
                                        ],
                                    ),
                                ),
                            ],
                        ),
                        SizedBox(height: ScreenUtil().setHeight(55)),
                        Padding(
                            padding:
                                EdgeInsetsGeometry.symmetric(horizontal: ScreenUtil().setWidth(20)),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    CustomFont(
                                        text: 'Celesse Aisle Nacpil', // Enhancement 1: Customize the profile name into your name
                                        fontWeight: FontWeight.bold,
                                        fontSize: ScreenUtil().setSp(20),
                                        color: Colors.black,
                                    ),
                                    SizedBox(height: ScreenUtil().setHeight(5)),
                                    Row(
                                        children: [
                                            CustomFont(
                                                text: '1k', // Enhancement 2: Customize the number of followers and number of following
                                                fontSize: ScreenUtil().setSp(15),
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                            ),
                                            SizedBox(width: ScreenUtil().setWidth(10)),
                                            CustomFont(
                                                text: 'followers',
                                                fontSize: ScreenUtil().setSp(15),
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w100,
                                            ),
                                            SizedBox(width: ScreenUtil().setWidth(5)),
                                            Icon(
                                                Icons.circle,
                                                size: ScreenUtil().setSp(5),
                                                color: Colors.grey,
                                            ),
                                            SizedBox(width: ScreenUtil().setWidth(5)),
                                            CustomFont(
                                                text: '479', // Enhancement 2: Customize the number of followers and number of following
                                                fontSize: ScreenUtil().setSp(15),
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                            ),
                                            SizedBox(width: ScreenUtil().setWidth(10)),
                                            CustomFont(
                                                text: 'following',
                                                fontSize: ScreenUtil().setSp(15),
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w100,
                                            ),
                                        ],
                                    ),
                                    SizedBox(height: ScreenUtil().setHeight(10)),
                                    Row(
                                        children: [
                                            CustomButton(
                                                buttonName: 'Follow',
                                                onPressed: () {},
                                            ),
                                            SizedBox(width: ScreenUtil().setWidth(10)),
                                            CustomButton(
                                                buttonName: 'Message',
                                                onPressed: () {},
                                                buttonType: 'outlined',
                                            ),
                                        ],
                                    ),
                                ],
                            ),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(10)),
                        TabBar(
                            indicatorColor: FB_DARK_PRIMARY,
                            tabs: [
                                Tab(
                                    child: CustomFont(
                                        text: 'Posts',
                                        fontSize: ScreenUtil().setSp(15),
                                        color: Colors.black,
                                    ),
                                ),
                                Tab(
                                    child: CustomFont(
                                        text: 'About',
                                        fontSize: ScreenUtil().setSp(15),
                                        color: Colors.black,
                                    ),
                                ),
                                Tab(
                                    child: CustomFont(
                                        text: 'Photos',
                                        fontSize: ScreenUtil().setSp(15),
                                        color: Colors.black,
                                    ),
                                ),
                            ],
                        ),
                        SizedBox(
                            height: ScreenUtil().setHeight(2000),
                            child: TabBarView(
                                children: [
                                    // Post Section (Part of Enhancement 3)
                                    ListView.builder(
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        itemCount: myPosts.length,
                                        itemBuilder: (context, index) {
                                            final post = myPosts[index];
                                            return PostCard(
                                            userName: post['userName'],
                                            postContent: post['postContent'],
                                            numOfLikes: post['numOfLikes'],
                                            hasImage: post['hasImage'],
                                            date: post['date'],
                                            profileImage: post['profileImage'],
                                            postImage: post['postImage'],
                                            );
                                        },
                                    ),
                                    // About Section (Enhancement 4: Create an About tab about yourself. Can be based on your own Facebook)
                                    Padding(
                                        padding: EdgeInsets.all(ScreenUtil().setSp(20)),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                            CustomFont(
                                                text: 'About Me',
                                                fontSize: ScreenUtil().setSp(18),
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                            ),
                                            SizedBox(height: ScreenUtil().setHeight(10)),
                                            CustomFont(
                                                text:
                                                    'always, in all ways',
                                                fontSize: ScreenUtil().setSp(14),
                                                color: Colors.black,
                                            ),
                                            SizedBox(height: ScreenUtil().setHeight(15)),
                                            Divider(),
                                            SizedBox(height: ScreenUtil().setHeight(10)),
                                            Row(
                                                children: [
                                                Icon(Icons.school, color: Colors.grey),
                                                SizedBox(width: ScreenUtil().setWidth(10)),
                                                CustomFont(
                                                    text: 'National University Philippines',
                                                    fontSize: ScreenUtil().setSp(14),
                                                    color: Colors.black,
                                                ),
                                                ],
                                            ),
                                            SizedBox(height: ScreenUtil().setHeight(10)),
                                            Row(
                                                children: [
                                                Icon(Icons.location_on, color: Colors.grey),
                                                SizedBox(width: ScreenUtil().setWidth(10)),
                                                CustomFont(
                                                    text: 'Dasmariñas City, Cavite, Philippines',
                                                    fontSize: ScreenUtil().setSp(14),
                                                    color: Colors.black,
                                                ),
                                                ],
                                            ),
                                            ],
                                        ),
                                    ),
                                    // Photos Section (Enhancement 5: Use GridView class to create photos tab)
                                    Padding (
                                        padding: EdgeInsets.all(ScreenUtil().setSp(10)),
                                        child: GridView.builder(
                                            physics: const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: photos.length,
                                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            crossAxisSpacing: 5,
                                            mainAxisSpacing: 5,
                                            ),
                                        itemBuilder: (context, index) {
                                            return Container(
                                                decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                image: DecorationImage(
                                                    image: AssetImage(photos[index]),
                                                    fit: BoxFit.cover,
                                                ),
                                                ),
                                            );
                                        },
                                        ),                                      
                                    )
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