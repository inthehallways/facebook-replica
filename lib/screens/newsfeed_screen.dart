import 'package:flutter/material.dart';
import '../widgets/newsfeed_card.dart';
class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        NewsFeedCard(
          userName: 'Cyrus Robles',
          postContent: 'Kamusta',
          numOfLikes: 100,
          date: 'November 28'
        ),
        NewsFeedCard(
          userName: 'Kween Yasmin', 
          postContent: 'bili na kayo ng green mango graham!!', 
          numOfLikes: 1000,
          hasImage: true,
          date: 'November 30'
        ),
      ],
    );
  }
}