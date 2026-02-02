import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nacpil_mobprog/constants.dart';
import '../widgets/post_card.dart';
import 'package:nacpil_mobprog/widgets/custom_button.dart';
import 'package:nacpil_mobprog/widgets/custom_font.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // filter posts by username
  List<Map<String, dynamic>> myPosts(
    List<Map<String, dynamic>> posts,
    String username,
  ) {
    return posts.where((post) => post['userName'] == username).toList();
  }

  // photos tab
  final List<String> photos = [
    'https://scontent.fmnl17-3.fna.fbcdn.net/v/t39.30808-6/513906766_23880173234981428_147944873854666631_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=106&ccb=1-7&_nc_sid=833d8c&_nc_ohc=TNIa6C2ZYqsQ7kNvwEEfxV_&_nc_oc=AdmGn6Q-C9fdzVN2Qc4RTL-8YFKbT6G_sCPp9TsHOUwmFoeAM5ixsQXOXwcdbkEdXXo&_nc_zt=23&_nc_ht=scontent.fmnl17-3.fna&_nc_gid=T_JD1yFJCQKR-FmON3yU_g&oh=00_Afue-mUjvVbJDQZ8zulUzzNcWDmASIDr6FaxLellWFdO-A&oe=6986CB74',
    'https://scontent.fmnl17-2.fna.fbcdn.net/v/t39.30808-6/482217259_9351552551603404_6933381717125666081_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=833d8c&_nc_ohc=dJw_dXZqXlgQ7kNvwGwSrr3&_nc_oc=AdnldyE_az7OV19giTuLjOamzWaQDRqdacxOANp8i6mZcLNMBY2y2uHUsXw2mGl6QAk&_nc_zt=23&_nc_ht=scontent.fmnl17-2.fna&_nc_gid=Sphw-fJtS1g9hOl-FKARzg&oh=00_AfvTU23cW1Ghh_m7GGnZbD1axnJrPq5IFUz7NsFhUVE3Zg&oe=6986CD05',
    'assets/images/pogi.jpg',
    'https://scontent.fmnl17-2.fna.fbcdn.net/v/t39.30808-6/466678496_8673645829394083_8472372046400020416_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=a5f93a&_nc_ohc=mzEadPO67LAQ7kNvwH-QmT4&_nc_oc=AdkbG2lZtKvd6mbjwOx-NIFOFv6sL0QkGZ3KXFQ-WoDJnbgCZOE8jrg3APfD54YEbQ4&_nc_zt=23&_nc_ht=scontent.fmnl17-2.fna&_nc_gid=CsHOB8SWgYgRbS3R60l8bQ&oh=00_Afs0pTFW04AhhIBB2jWx_WRMprWFn4z-bNRTly3UFgsDXA&oe=6986CF04',
    'assets/images/webcamtoy.jpg',
    'https://scontent.fmnl17-2.fna.fbcdn.net/v/t39.30808-6/492315322_9621732071252116_2013730267861509543_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=833d8c&_nc_ohc=UShol4xJsfQQ7kNvwHus5X0&_nc_oc=Adk0sy7UkW6GRVaxFUVa_7kJWXhL0XkZpimvbPQ0vNgIw2wtEwHOC0Y2u4vCcY-H1-c&_nc_zt=23&_nc_ht=scontent.fmnl17-2.fna&_nc_gid=eJTmCTyhv67aSs63Dr9HeQ&oh=00_AfuK7-BgV8LAvLuloWLrQC0B6_GMf57NpC_SlJBbkRY16A&oe=6986E72C',
  ];

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final String username = args?['username'] ?? 'User';
    final List<Map<String, dynamic>> posts = [
      {
        'userName': username,
        'postContent':
            'lahat ng bumoto kay camille villar kayo mag-igib ng tubig sa cavite ha',
        'numOfLikes': 11000,
        'date': 'May 12',
        'hasImage': false,
        'profileImage':
            'https://scontent.fmnl17-2.fna.fbcdn.net/v/t39.30808-6/611631713_25485969811068421_8631641391366438879_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=P_Dvt29-Z0EQ7kNvwFTM6si&_nc_oc=AdnpMYNTMDD698EVFboxT0c9Ch8PCraw3SI_YEI6IML8KBSJFGCMeAYY3XPFXq6XdMs&_nc_zt=23&_nc_ht=scontent.fmnl17-2.fna&_nc_gid=R_yNS66kY7M9MPLehJR6_A&oh=00_AfuRoOT_gHYOcqKbu9GI20nJUOofE1UVS92jxN8achga7A&oe=6986E503'
      },
      {
        'userName': username,
        'postContent': 'my mother mountain <3',
        'numOfLikes': 150,
        'date': 'Jan 5',
        'hasImage': true,
        'profileImage':
            'https://scontent.fmnl17-2.fna.fbcdn.net/v/t39.30808-6/611631713_25485969811068421_8631641391366438879_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=P_Dvt29-Z0EQ7kNvwFTM6si&_nc_oc=AdnpMYNTMDD698EVFboxT0c9Ch8PCraw3SI_YEI6IML8KBSJFGCMeAYY3XPFXq6XdMs&_nc_zt=23&_nc_ht=scontent.fmnl17-2.fna&_nc_gid=R_yNS66kY7M9MPLehJR6_A&oh=00_AfuRoOT_gHYOcqKbu9GI20nJUOofE1UVS92jxN8achga7A&oe=6986E503',
        'postImage':
            'https://scontent.fmnl17-3.fna.fbcdn.net/v/t39.30808-6/513906766_23880173234981428_147944873854666631_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=106&ccb=1-7&_nc_sid=833d8c&_nc_ohc=TNIa6C2ZYqsQ7kNvwEEfxV_&_nc_oc=AdmGn6Q-C9fdzVN2Qc4RTL-8YFKbT6G_sCPp9TsHOUwmFoeAM5ixsQXOXwcdbkEdXXo&_nc_zt=23&_nc_ht=scontent.fmnl17-3.fna&_nc_gid=T_JD1yFJCQKR-FmON3yU_g&oh=00_Afue-mUjvVbJDQZ8zulUzzNcWDmASIDr6FaxLellWFdO-A&oe=6986CB74',
      },
      {
        'userName': username,
        'postContent':
            'walang katapusang schoolworks na para bang wag na lang mag noche buena talaga',
        'numOfLikes': 100,
        'date': 'Nov 28',
        'hasImage': false,
        'profileImage':
            'https://scontent.fmnl17-2.fna.fbcdn.net/v/t39.30808-6/611631713_25485969811068421_8631641391366438879_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=P_Dvt29-Z0EQ7kNvwFTM6si&_nc_oc=AdnpMYNTMDD698EVFboxT0c9Ch8PCraw3SI_YEI6IML8KBSJFGCMeAYY3XPFXq6XdMs&_nc_zt=23&_nc_ht=scontent.fmnl17-2.fna&_nc_gid=R_yNS66kY7M9MPLehJR6_A&oh=00_AfuRoOT_gHYOcqKbu9GI20nJUOofE1UVS92jxN8achga7A&oe=6986E503'
      },
      {
        'userName': username,
        'postContent': 'wala na uwian na corny na...',
        'numOfLikes': 1000,
        'date': 'Nov 30',
        'hasImage': true,
        'profileImage':
            'https://scontent.fmnl17-2.fna.fbcdn.net/v/t39.30808-6/611631713_25485969811068421_8631641391366438879_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=P_Dvt29-Z0EQ7kNvwFTM6si&_nc_oc=AdnpMYNTMDD698EVFboxT0c9Ch8PCraw3SI_YEI6IML8KBSJFGCMeAYY3XPFXq6XdMs&_nc_zt=23&_nc_ht=scontent.fmnl17-2.fna&_nc_gid=R_yNS66kY7M9MPLehJR6_A&oh=00_AfuRoOT_gHYOcqKbu9GI20nJUOofE1UVS92jxN8achga7A&oe=6986E503',
        'postImage': 'assets/images/nakikisali.jpg',
      },
    ];

    final userPosts = myPosts(posts, username);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        SizedBox(
                          height: 200,
                          width: double.infinity,
                          // enhancement 3: Apply the cached_network_image in the profileImage, coverImage, and if photos tab are got from the network.
                          child: CachedNetworkImage(
                            imageUrl: 'https://i.pinimg.com/736x/b2/34/91/b234910e3b4c5fb4f8b1f00864d6a1fa.jpg',
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              color: Colors.grey[300],
                              child: const Center(child: CircularProgressIndicator()),
                            ),
                            errorWidget: (context, url, error) => Container(color: Colors.grey, child: const Icon(Icons.error)),
                          ),
                        ),
                        
                        Positioned(
                          bottom: -50,
                          left: ScreenUtil().setWidth(20),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // enhancement 3: Apply the cached_network_image in the profileImage, coverImage, and if photos tab are got from the network.
                              CachedNetworkImage(
                                imageUrl: 'https://scontent.fmnl17-2.fna.fbcdn.net/v/t39.30808-6/611631713_25485969811068421_8631641391366438879_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=P_Dvt29-Z0EQ7kNvwFTM6si&_nc_oc=AdnpMYNTMDD698EVFboxT0c9Ch8PCraw3SI_YEI6IML8KBSJFGCMeAYY3XPFXq6XdMs&_nc_zt=23&_nc_ht=scontent.fmnl17-2.fna&_nc_gid=R_yNS66kY7M9MPLehJR6_A&oh=00_AfuRoOT_gHYOcqKbu9GI20nJUOofE1UVS92jxN8achga7A&oe=6986E503',
                                imageBuilder: (context, imageProvider) => CircleAvatar(
                                  radius: 50,
                                  backgroundImage: imageProvider,
                                ),

                                placeholder: (context, url) => CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.grey[300],
                                  child: const Padding(
                                    padding: EdgeInsets.all(20.0), // Smaller spinner
                                    child: CircularProgressIndicator(strokeWidth: 2),
                                  ),
                                ),
                                errorWidget: (context, url, error) => const CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.grey,
                                  child: Icon(Icons.error),
                                ),
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
                      padding: EdgeInsetsGeometry.symmetric(
                          horizontal: ScreenUtil().setWidth(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomFont(
                            text: username,
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenUtil().setSp(20),
                            color: Colors.black,
                          ),
                          SizedBox(height: ScreenUtil().setHeight(5)),
                          Row(
                            children: [
                              CustomFont(
                                text: '1k',
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
                              Icon(Icons.circle,
                                  size: ScreenUtil().setSp(5),
                                  color: Colors.grey),
                              SizedBox(width: ScreenUtil().setWidth(5)),
                              CustomFont(
                                text: '479',
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
                                  buttonName: 'Follow', onPressed: () {}),
                              SizedBox(width: ScreenUtil().setWidth(10)),
                              CustomButton(
                                  buttonName: 'Message',
                                  onPressed: () {},
                                  buttonType: 'outlined'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(10)),
                  ],
                ),
              ),

              // profile section tabs
              SliverToBoxAdapter(
                child: TabBar(
                  indicatorColor: FB_DARK_PRIMARY,
                  tabs: [
                    Tab(
                        child: CustomFont(
                            text: 'Posts',
                            fontSize: 15.sp,
                            color: Colors.black)),
                    Tab(
                        child: CustomFont(
                            text: 'About',
                            fontSize: 15.sp,
                            color: Colors.black)),
                    Tab(
                        child: CustomFont(
                            text: 'Photos',
                            fontSize: 15.sp,
                            color: Colors.black)),
                  ],
                ),
              ),
            ];
          },

          // body tab
          body: TabBarView(
            children: [
              ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: userPosts.length,
                itemBuilder: (context, index) {
                  final post = userPosts[index];
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

              // about tab
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(ScreenUtil().setSp(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFont(
                          text: 'About Me',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      SizedBox(height: 10.h),
                      CustomFont(
                          text: 'always, in all ways',
                          fontSize: 14.sp,
                          color: Colors.black),
                      SizedBox(height: 15.h),
                      Divider(),
                      SizedBox(height: 10.h),
                      Row(children: [
                        Icon(Icons.school, color: Colors.grey),
                        SizedBox(width: 10.w),
                        CustomFont(
                            text: 'National University Philippines',
                            fontSize: 14.sp,
                            color: Colors.black),
                      ]),
                      SizedBox(height: 10.h),
                      Row(children: [
                        Icon(Icons.location_on, color: Colors.grey),
                        SizedBox(width: 10.w),
                        CustomFont(
                            text: 'Dasmariñas City, Cavite, Philippines',
                            fontSize: 14.sp,
                            color: Colors.black),
                      ]),
                    ],
                  ),
                ),
              ),

              // photos tab
              GridView.builder(
                padding: EdgeInsets.all(10.sp),
                itemCount: photos.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (context, index) {
                  if (photos[index].startsWith('http')) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: CachedNetworkImage(
                        imageUrl: photos[index],
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          color: Colors.grey[200],
                          child:
                              const Center(child: CircularProgressIndicator()),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    );
                  } else {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: AssetImage(photos[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}