import 'dart:developer';

import 'package:fetch_api/model/comment_model.dart';
import 'package:http/http.dart' as http;

import '../constants/constants.dart';

class AppService {
  static AppService? _instance;

  AppService._privateConstructor();

  factory AppService() {
    if (_instance != null) {
      return _instance!;
    } else {
      throw Exception("Singleton Object not initialised");
    }
  }
  static void init() {
    _instance ??= AppService._privateConstructor();
  }

  Future<CommentModel> getComments({required int id}) async {
    final url = Uri.parse(Constants.commentApiUrl + id.toString());
    final response = await http.get(url);
    log("Response Status Code=${response.statusCode}");
    return CommentModel.fromJSON(response.body);
  }
}
