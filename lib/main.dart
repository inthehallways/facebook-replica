import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../screens/home_screen.dart';
import '../screens/newsfeed_screen.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 715),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Facebook Replica',
          initialRoute: '/login',
          routes: {
            '/login': (context) => const LoginScreen(),
            '/register': (context) => const RegisterScreen(),
            '/newsfeed': (context) => const NewsFeedScreen(),
            '/home': (context) {
              final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
              final username = args['username'] as String;
              return HomeScreen(username: username);
            },
          },
        );
      },
    );
  }
}
