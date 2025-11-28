import 'package:flutter/material.dart';
import '../widgets/newsfeed_card.dart';
class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        NewsFeedCard(
          userName: 'Celesse Aisle Nacpil',
          postContent: 'walang katapusang schoolworks na para bang wag na lang mag noche buena talaga',
          numOfLikes: 100,
          date: 'November 28'
        ),
        NewsFeedCard(
          userName: 'Celesse Aisle Nacpil', 
          postContent: 'wala na uwian na corny na...', 
          numOfLikes: 1000,
          hasImage: true,
          date: 'November 30'
        ),
      ],
    );
  }
}