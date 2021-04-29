import 'dart:convert';

import 'package:blog_app/model/blog_model.dart';
import 'package:http/http.dart' as http;

class BlogNetWorkService {
  Future<NewsBlog> getBlogApi() async {
    final String uri =
        'https://raw.githubusercontent.com/Muhaiminur/muhaiminur.github.io/master/misfitflutter.tech';

    try {
      http.Response response = await http.get(Uri.parse(uri));
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonTask = json.decode(response.body);
        final NewsBlog news = NewsBlog.fromJson(jsonTask);
        return news;
      } else {
        throw Exception("No found");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
