import 'package:apis_practice/detail_screen.dart';
import 'package:apis_practice/service/api_service.dart';
import 'package:flutter/material.dart';

class PostListScreen extends StatefulWidget {

  const PostListScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {

  List posts = [];

  int page = 1;

  late Future futurePosts;

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {

    super.initState();

    futurePosts = fetchData();

    scrollController.addListener(() {

      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {

        setState(() {
          futurePosts = fetchData();
        });
      }
    });
  }

  Future fetchData() async {

    final newPosts = await ApiService().fetchPosts(page);

    posts.addAll(newPosts);

    page++;

    return posts;
  }

  Future<void> refreshData() async {

    page = 1;

    posts.clear();

    setState(() {
      futurePosts = fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      body: FutureBuilder(
        future: futurePosts,
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting &&
              posts.isEmpty) {

            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          else if (snapshot.hasError) {

            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          }

          return RefreshIndicator(
            onRefresh: refreshData,
            child: ListView.builder(

              controller: scrollController,

              itemCount: posts.length + 1,

              itemBuilder: (context, index) {

                if (index < posts.length) {

                  final post = posts[index];

                  return Card(

                    margin: const EdgeInsets.all(8),

                    child: ListTile(

                      title: Text(post.title),

                      subtitle: Text(post.body),

                      onTap: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetailsScreen(post: post),
                          ),
                        );
                      },
                    ),
                  );
                }

                return const Padding(

                  padding: EdgeInsets.all(20),

                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}