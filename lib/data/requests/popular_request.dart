import 'dart:convert';
import 'dart:developer';
import 'package:final_project/domain/models/popular_images_model.dart';
import 'package:http/http.dart' as http;
import '../../domain/models/popular_details_model.dart';
import '../../domain/models/popular_model.dart';

class PopularRequest {
  static void getPopular({
    required Function(PopularModel)? onSuccess,
    required Function(int statusCode)? onError,
  }) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    await http
        .get(
            Uri.parse(
                'https://api.themoviedb.org/3/person/popular?api_key=2dfe23358236069710a379edd4c65a6b'),
            headers: headers)
        .then((response) {
      if (response.statusCode == 200) {
        Map<String, dynamic> decoded = {};
        decoded = json.decode(response.body);
        PopularModel popularModel = PopularModel.fromJson(decoded);
        onSuccess!(popularModel);
      } else {
        onError!(response.statusCode);
      }
      log(response.statusCode.toString(), name: 'this is status code :');
      log(response.body, name: 'this is my response');
    });
  }

  static void getPopularImages({
    required int id,
    required Function(PopularImagesModel)? onSuccess,
    required Function(int statusCode)? onError,
  }) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    await http
        .get(
            Uri.parse(
                'https://api.themoviedb.org/3/person/$id/images?api_key=2dfe23358236069710a379edd4c65a6b'),
            headers: headers)
        .then((response) {
      if (response.statusCode == 200) {
        Map<String, dynamic> decoded = {};
        decoded = json.decode(response.body);
        PopularImagesModel popularImagesModel =PopularImagesModel.fromJson(decoded);
        onSuccess!(popularImagesModel);

      } else {
        onError!(response.statusCode);
      }
      log(response.statusCode.toString(),name: 'this is status code :');
      log(response.body,name: 'this is My Body :');
    });
  }

   static void getPopularDetails({
     required int id,
    required Function(PopularDetailsModel)? onSuccess,
    required Function(int statusCode)? onError,
  }) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    await http
        .get(
        Uri.parse(
            'https://api.themoviedb.org/3/person/$id?api_key=2dfe23358236069710a379edd4c65a6b'),
        headers: headers)
        .then((response) {
      if (response.statusCode == 200) {
        Map<String, dynamic> decoded = {};
        decoded = json.decode(response.body);
        PopularDetailsModel popularDetailsModel =PopularDetailsModel.fromJson(decoded);
        onSuccess!(popularDetailsModel);

      } else {
        onError!(response.statusCode);
      }
      log(response.statusCode.toString(),name: 'this is status code :');
      log(response.body,name: 'this is my Body :');
    });
  }
}
