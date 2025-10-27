import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_project/API/api_constants.dart';
import 'package:news_project/API/end_points.dart';
import 'package:news_project/model/SourceResponse.dart';
import 'package:news_project/model/newsResponse.dart';

class ApiManger {
  static Future<SourceResponse> getSources() async {
    Uri url = Uri.http(ApiConstants.baseUrl, EndPoints.sourceApi, {
      'apiKey': ApiConstants.apiKey,
    });
    try {
      var response = await http.get(url);
      String responseBody = response.body;
      var json = jsonDecode(responseBody);
      return SourceResponse.fromJson(json);

      ///or  Sources.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }

  ///https://newsapi.org/v2/everything?q=bitcoin&apiKey=2fd69c3a438242d5bccec944e235f179
  static Future<NewsResponse> getNewsSource(String sourceId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.newsApi, {
      'apiKey': ApiConstants.apiKey,
      'sources': sourceId,
    });

    try {
      var response = await http.get(url);
      return NewsResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      rethrow;
    }
  }
}
