import 'package:apis_practice/ecommerce_ui/home_screen.dart';
import 'package:apis_practice/login_screen_with_api/login_screen.dart';
import 'package:apis_practice/screen/comment_screen.dart';
import 'package:apis_practice/screen/post_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     // home: const PostListScreen(title: 'Flutter Demo Home Page'),
      home:  PostListScreen(title: 'List',),
    );
  }
}

