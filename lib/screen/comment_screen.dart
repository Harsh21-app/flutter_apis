import 'package:apis_practice/detail_screen.dart';
import 'package:apis_practice/service/api_service.dart';
import 'package:flutter/material.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {

  final ApiService _apiService = ApiService();
  Future<void> refreshData() async {
    await _apiService.fetchComments();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comment Screen'),
      ),
      body: FutureBuilder(
        future: _apiService.fetchComments(),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }

          else if(snapshot.hasError){
            return  Center(child: Text("Error: ${snapshot.error}"),);
          }

          else {
            final comments = snapshot.data!;
            return RefreshIndicator(onRefresh: refreshData,child: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context,index){
                  final comment = comments[index];

                  return Card(
                    margin: const EdgeInsets.all(8),
                    child: ListTile(
                      title: Text(comment.id.toString()),
                      subtitle: Text(comment.body!),
                    ),
                  );
                }), );
          }
        },
      ),
    );
  }
}
