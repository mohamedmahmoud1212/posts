import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:newsapp/model/news.dart';
import 'package:newsapp/model/posts.dart';

import '../model/apple.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  Posts? posts;
  // String urll = "https://jsonplaceholder.typicode.com/posts";
  String _url="https://newsapi.org/v2/everything?q=apple&from=2024-09-16&to=2024-09-16&sortBy=popularity&apiKey=5a7a58387a4d4dcdbc83f98678e5daf0";
  News? news;
  String url =
      "https://newsapi.org/v2/everything?q=tesla&from=2024-08-16&sortBy=publishedAt&apiKey=5a7a58387a4d4dcdbc83f98678e5daf0";

  // Future<void> getNews() async {
  //   try {
  //     final response = await http.get(Uri.parse(url));
  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> jsonData = jsonDecode(response.body);
  //       news = News.fromJson(jsonData);
  //       emit(DataReach());
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  ////////////////////
  Future<void> getPosts() async {
    try {
      final response = await http.get(Uri.parse(_url));
      if (response.statusCode == 200) {
        final Map<String , dynamic> jsonData = jsonDecode(response.body);
        posts = Posts.fromJson(jsonData);
          emit(PostsReach());
      }
    } catch (e) {
      print(e);
    }
  }
}
