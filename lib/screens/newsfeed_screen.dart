import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/post_card.dart';


class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // normal news feed posts
        ...posts.map((post) => PostCard(
              userName: post['userName'],
              postContent: post['postContent'],
              numOfLikes: post['numOfLikes'],
              hasImage: post['hasImage'],
              date: post['date'],
              profileImage: post['profileImage'],
              postImage: post['postImage'],
              isAds: post['isAds'] ?? false,
              adsMarket: post['adsMarket'] ?? '',
            )),

        SizedBox(height: 20.h),

        // advertisement section title
        Padding(
          padding: EdgeInsets.only(left: 10.w, top: 15.h,bottom: 10.h),
          child: Text(
            "Advertisement/ Promotion",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
        ),

        // carousel slider for ads
        CarouselSlider(
          options: CarouselOptions(
            enableInfiniteScroll: false,
            height: 320.h,
            padEnds: false,
            viewportFraction: 0.9,
          ),
          items: carouselItems(),
        ),

        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }

  // advertisement posts data
  List<Widget> carouselItems() {
    return [
      PostCard(
        userName: '20th Century Studios',
        postContent: 'Everybody wants this.',
        numOfLikes: 10,
        hasImage: true,
        date: '',
        isAds: true,
        adsMarket: 'Watch Official Trailer Here',
        profileImage:
            'https://yt3.googleusercontent.com/ytc/AIdro_k1TJF0hhPG6pPrOH-xAeLMGXMpkBtVmES06mkXUfoZcWI=s900-c-k-c0x00ffffff-no-rj',
        postImage:
            'https://i.ytimg.com/vi/yjXQyBRsMok/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLAbyzbNyO8AllLqXGZEztwn9Tl60g'
      ),
      PostCard(
        userName: 'Chips Ahoy!',
        postContent: 'A cookie straight from the uʍop ǝpᴉsd∩.',
        numOfLikes: 20,
        hasImage: true,
        date: '',
        isAds: true,
        adsMarket: 'Get yours now!',
        profileImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJec9GtB5ygdno7c6sXZ6T99QrG_DN7_0DnA&s',
        postImage:
          'https://imgproxy.divecdn.com/6tS3ZK7xmNHa5MLO1fBWBrbKadrDv7F6y9mghYVCcgE/g:ce/rs:fill:1200:675:1/Z3M6Ly9kaXZlc2l0ZS1zdG9yYWdlL2RpdmVpbWFnZS9MVE9fQ29va2llX1Zpc3VhbC5qcGc=.webp',
      ),  
      PostCard(
        userName: 'foodpanda',
        postContent: 'Craving something? We got you.',
        numOfLikes: 230,
        hasImage: true,
        date: '',
        isAds: true,
        adsMarket: 'Order Now!',
        profileImage:  
          'https://scontent.fmnl17-3.fna.fbcdn.net/v/t39.30808-6/324658882_559201879406797_1451602338147125313_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=hfXmMFM3nNQQ7kNvwG3iHSY&_nc_oc=AdlevNMv97LdqsHLSywy_6kRjSo8fdFnrGaSmg796MbwrrXJGg1nuNz_GLqy3VfEVK0&_nc_zt=23&_nc_ht=scontent.fmnl17-3.fna&_nc_gid=l3fI0Q59N61KHMLwfSJ_ZQ&oh=00_AfuhL0HqGgwU8qWx0aehaPMVotzFIEZBYek3VS4KJDhZVQ&oe=6986D38A',
        postImage: 
          'https://media.istockphoto.com/id/931308812/photo/selection-of-american-food.jpg?s=612x612&w=0&k=20&c=7-2Glc2qVkrWdLaqXwLnNoJLUvc2vMz_QpDTKDcmYiY=',
      ),
      PostCard(
        userName: 'Spotify',
        postContent: 'Listen to your favorite tunes ad-free.',
        numOfLikes: 120,
        hasImage: true,
        date: '',
        isAds: true,
        adsMarket: 'Get Premium',
        profileImage:  
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Spotify_App_Logo.svg/960px-Spotify_App_Logo.svg.png',
        postImage: 
          'https://media.istockphoto.com/id/1474338774/video/music-inspiration-neon-people-woman-headphones.jpg?s=640x640&k=20&c=yONPc29R8SnG7o14jM-LiS40nXn1FxhtoZ6kwUv1e6o=',
      ),
      PostCard(
        userName: 'Netflix',
        postContent: 'Get Premium for as low as ₱169 a month.',
        numOfLikes: 1000,
        hasImage: true,
        date: '',
        isAds: true,
        adsMarket: 'Subscribe Today!',
        profileImage: 
          'https://platform.theverge.com/wp-content/uploads/sites/2/chorus/uploads/chorus_asset/file/15844974/netflixlogo.0.0.1466448626.png?quality=90&strip=all&crop=1.2535702951444%2C0%2C97.492859409711%2C100&w=2400',
        postImage: 
          'https://www.techhive.com/wp-content/uploads/2023/10/Netflix-Hintergrund.jpg?quality=50&strip=all',
      )
    ];

  }
  // normal posts data
  final List<Map<String, dynamic>> posts = const [
    {
      'userName': 'Celesse Aisle Nacpil',
      'postContent':'walang katapusang schoolworks na para bang wag na lang mag noche buena talaga',
      'numOfLikes': 100,
      'date': 'Nov 28',
      'hasImage': false,
      'profileImage': 'assets/images/aisle_dp.jpg'
    },
    {
      'userName': 'Lazada',
      'postContent': 'A, B, C, or D? 👀 Which piece will complete your heart? 💞✨\n\nComment your answer with the hashtag #LazadaPH and check out now to get up to 80% off and up to ₱1,500 off vouchers!\n\n #Lazada22',
      'numOfLikes': 5000,
      'hasImage': true,
      'date': 'Just Now',
      'isAds': true,
      'adsMarket': 'Shop on #Lazada22!',
      'profileImage': 'https://scontent.fmnl17-3.fna.fbcdn.net/v/t39.30808-6/486288000_1067992378690600_6487673286591642346_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=HZveOjJuemYQ7kNvwH2Yk-O&_nc_oc=Adnh8RTMPuWAkRkD-XyhEuZn1vVp6TXXFyzHotJHMlsvXTOWwviZRN4_j_DD-hGkdf8&_nc_zt=23&_nc_ht=scontent.fmnl17-3.fna&_nc_gid=d_6QQsDAIR8LiHjKUfENMg&oh=00_Aft2R2QfZHkG3lnqzGtjZYXjwNLKBRGN-tIsPdxv0mDvSQ&oe=6986D3B0',
      'postImage': 'https://scontent.fmnl17-3.fna.fbcdn.net/v/t39.30808-6/624903319_1323205476502621_3171434952698251606_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=127cfc&_nc_ohc=IHdiGNbfxPIQ7kNvwEt5c7R&_nc_oc=AdkjK9oK_kAEhJm5-9z51iuLq-DFsBU60DgJUFw4u2xvK4OrStUf29E98Y9qhfPa4VQ&_nc_zt=23&_nc_ht=scontent.fmnl17-3.fna&_nc_gid=YwCkEFvl_iTjEfoOG4qUOw&oh=00_Afs8JiTix18MwdHjZWyR9Qipayzgg1A3J8ncu3hJQSEg6g&oe=6986D3C6',
    },
    {
      'userName': 'Chimney Han',
      'postContent': 'hello from my family!! :DDD',
      'numOfLikes': 100,
      'date': 'Nov 28',
      'hasImage': true,
      'profileImage': 'assets/images/chim.jpg',
      'postImage': 'https://i.redd.it/stills-of-madney-and-jee-from-the-s7-finale-v0-8g0xfu61y73d1.jpg?width=2048&format=pjpg&auto=webp&s=115c8b0036c3aee132f680f4ab8976de28a423b8',
    },
    {
      'userName': 'AWS Learning Club - Legarda',
      'postContent':'the all-purpose kween has spoken!',
      'numOfLikes': 1000,
      'date': 'Nov 30',
      'hasImage': true,
      'profileImage': 'assets/images/aws_dp.jpg',
      'postImage': 'assets/images/join-aws.png',

    },
    {
      'userName': 'Denese Manuel',
      'postContent':'Kailan kaya muling makakatawang di ko pinipilit, walang lungkot na sumisilip? Kailan kaya muling makakamit ang yong yakap at halik, ng hindi sa panaginip? Kailan... Kailan ang dating tayo?',
      'numOfLikes': 78,
      'date': 'Dec 1',
      'hasImage': false,
      'profileImage': 'assets/images/denese_dp.jpg'
    },
    {
      'userName': '20th Century Studios',
      'postContent': 'Icons reign forever. The Devil Wears Prada 2 arrives in Philippine cinemas this April 29. #TheDevilWearsPrada2PH',
      'numOfLikes': 100000,
      'hasImage': true,
      'date': '2 hrs ago',
      'isAds': true,
      'adsMarket': 'Watch Official Trailer Now!',
      'profileImage': 'https://yt3.googleusercontent.com/ytc/AIdro_k1TJF0hhPG6pPrOH-xAeLMGXMpkBtVmES06mkXUfoZcWI=s900-c-k-c0x00ffffff-no-rj',
      'postImage': 'https://scontent.fmnl17-3.fna.fbcdn.net/v/t39.30808-6/626223860_1363576839147599_1443226398154596469_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=127cfc&_nc_ohc=EQLj0UrRXMMQ7kNvwHBv07T&_nc_oc=AdkGvk-TQBj_sX3vSv6X3TlwOX8d0eZGnine8G0SWe1JDCq0HpKNwERMWYJ73muOJDE&_nc_zt=23&_nc_ht=scontent.fmnl17-3.fna&_nc_gid=B1ND7Tg8NEZEdQMiG_kg6g&oh=00_Afum0d25Zc01F3_mBDgXlNqEvMJqzAxtj2xO-pOfxfU8Sg&oe=6986D6C3',
    },
    {
      'userName': 'Glyza Bermudez',
      'postContent':'bakla ANU cnasabi m0 tungkol sakin ha..., @Ronald Rafael Seña',
      'numOfLikes': 93,
      'date': 'Dec 1',
      'hasImage': false,
      'profileImage': 'assets/images/gly_dp.jpg'
    },
    {
      'userName': 'Jamaine Tuazon',
      'postContent': 'Sakit na ng daliri ko sa dami kong kachat!!! (Dalawa lng naman) wahahaha at leat mor than one!!',
      'numOfLikes': 153,
      'date': 'Jul 15',
      'hasImage': false,
      'profileImage': 'assets/images/meng_dp.jpg'
    },
    {
      'userName': 'Nike',
      'postContent': 'Back From the Vault: Nike Vomero 5.',
      'numOfLikes': 10000,
      'hasImage': true,
      'date': '2 hrs ago',
      'isAds': true,
      'adsMarket': 'View Collection',
      'profileImage': 'https://thumbs.dreamstime.com/b/web-183282388.jpg',
      'postImage': 'https://shoplineimg.com/646de95ac8fc1d00082e6c5f/66a676ff3e0824001f61c819/800x.png?',
    },
    {
      'userName': 'Denese Manuel',
      'postContent':'SALAMAT NGA PALA SA PISO MO. AHE. LABYU. PAKYU. PRINCESSDENESELALABXYUU..',
      'numOfLikes': 78,
      'date': 'Mar 1',
      'hasImage': false,
      'profileImage': 'assets/images/denese_dp.jpg'
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
}