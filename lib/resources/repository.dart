import 'dart:async';

import 'package:check/resources/news_api_provider.dart';

class Repository {
  final moviesApiProvider = NewsApiProvider();

  Future<dynamic> fetchAllNews(dynamic search) =>
      moviesApiProvider.fetchMovieList(search);
}
