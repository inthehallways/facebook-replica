import 'package:flutter/material.dart';
import '../widgets/post_card.dart';
class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  // Enhancement 1:  Create a dynamic post with these considerations: 
  //Assigning number of values, Assigning date in every post, Whether a post has a placeholder or none.

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
      'userName': 'Denese Manuel',
      'postContent': 'Kailan kaya muling makakatawang di ko pinipilit, walang lungkot na sumisilip? Kailan kaya muling makakamit ang yong yakap at halik, ng hindi sa panaginip? Kailan... Kailan ang dating tayo?',
      'numOfLikes': 78,
      'date': 'Dec 1',
      'hasImage': false,
      'profileImage': 'assets/images/denese_dp.jpg'
    },
    {
      'userName': 'Glyza Bermudez',
      'postContent': 'bakla ANU cnasabi m0 tungkol sakin ha..., @Ronald Rafael Seña',
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
      'userName': 'Denese Manuel',
      'postContent': 'SALAMAT NGA PALA SA PISO MO. AHE. LABYU. PAKYU. PRINCESSDENESELALABXYUU..',
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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return NewsFeedCard(
          userName: post['userName'], 
          postContent: post['postContent'],
          numOfLikes: post['numOfLikes'],
          hasImage: post['hasImage'],
          date: post['date'],
          profileImage: post['profileImage'],
          postImage: post['postImage'],
        );
      },
    );
  }
}