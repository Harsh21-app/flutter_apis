import 'dart:convert';
import 'package:apis_practice/model/comment_model.dart';
import 'package:apis_practice/model/post_model.dart';
import 'package:http/http.dart' as http;
class ApiService {
  Future<List<Post>> fetchPosts(int page) async{
    try{
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts?_page=$page&_limit=10'),
      );

      if(response.statusCode == 200){
        List data = jsonDecode(response.body);
        return data.map((e) => Post.fromJson(e)).toList();
      } else{
        throw Exception("Server Error: ${response.statusCode}");
      }
    } catch (e){
      print(e.toString());
      throw Exception("Failed to load data");
    }
  }

  Future<List<Comments>> fetchComments() async{
    try{
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));

      if(response.statusCode == 200){
         List data = jsonDecode(response.body);
        return data.map((e)=>Comments.fromJson(e)).toList();
      } else{
        throw Exception("Server Error: ${response.statusCode}");
      }

    }
    catch(e){
      print(e.toString());
      throw Exception("Failed to load data");
    }

  }

}