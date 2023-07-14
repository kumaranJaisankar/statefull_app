import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:statefull_app/Constants/constans.dart';
import 'package:statefull_app/model/blog_model.dart';

class BlogApi {
  String baseUri = "${(blogUrl)}/blogs/allposts/";
  Future<List<BlogDataModel>> getAllBlogList() async {
    try {
      var response = await http.get(Uri.parse(baseUri));
      if (response.statusCode == 200) {
        return (jsonDecode(response.body) as List)
            .map((e) => BlogDataModel.fromJson(e))
            .toList();
      } else {
        throw Exception('internal server error');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
