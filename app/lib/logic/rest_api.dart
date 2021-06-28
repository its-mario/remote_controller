import 'package:dio/dio.dart';
import 'dart:convert';

// TO:DO Replace this code with a fully UDP comunication or TCP
class RestApi {
  final String domain;
  late final String baseUrl;
  final dio = Dio();

  RestApi({required this.domain}) {
    this.baseUrl = "http://$domain/";
  }
  // Use this function when other functios trow errors
  // and return them  {or this is a bad idea idk :( }
  Future<bool> checkConnection() async {
    Response response;
    try {
      response = await dio.get(baseUrl);
      if (response.statusCode == 200)
        return true;
      else
        return false;
    } catch (e) {
      return false;
    }
  }

  void click(bool? sideAsBool) async {
    final int side = sideAsBool ?? false ? 1 : 0;
    final url = baseUrl + "click/" + side.toString();

    try {
      dio.post(url);
    } catch (e) {
      print(e);
    }
  }

  void press(List<dynamic> keys) async {
    final url = baseUrl + "keys";

    final json = jsonEncode({"keys": keys});

    try {
      dio.post(url, data: json);
    } catch (e) {
      print("Error sending ");
    }
  }

  void write(String text) {
    final url = baseUrl + "write";
    final json = jsonEncode({"text": text});

    try {
      dio.post(url, data: json);
    } catch (e) {
      print("Error sending ");
    }
  }
}
