import 'package:apis_practice/model/post_model.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Post post;
  const DetailsScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(post.body),
      ),
    );
  }
}
