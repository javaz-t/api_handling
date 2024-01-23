import 'dart:convert';

import 'package:api_handing/api/api_endpoints.dart';
import 'package:http/http.dart ' as http;
import 'package:api_handing/api/model/post_model.dart';

import '../api/model/comment_model.dart';

class PostService {
  final client = http.Client();

  Future<List<PostModel>?> getAllPosts() async {
    try {
      final response =
          await client.get(Uri.parse("${Api().baseUrl}${Api().postEndPoint}"));

      if (response.statusCode == 200) {
        final List<dynamic> responseBody = jsonDecode(response.body);
        final List<PostModel> posts =
            responseBody.map((json) => PostModel.fromJson(json)).toList();
        return posts;
      }
    } catch (e) {
      print(e);
    }
  }

  //for comment
  Future<List<CommentModel>?> getComments(int? id) async {
    try {
      final response = await client.get(Uri.parse('${Api().baseUrl}${Api().commentEndPoint}'));
      if (response.statusCode == 200) {
        final List responseBody = jsonDecode(response.body);
        final List<CommentModel> comments =
            responseBody.map((json) => CommentModel.fromJson(json)).toList();
        return comments;
      }
    } catch (e) {
      print(e);
    }
  }
}
