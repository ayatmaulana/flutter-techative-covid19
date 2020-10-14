import 'package:CovidApp/model/stats.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class CovidAPI {
  Dio dio = new Dio();

  Future<Stats> getStats() async {
    Response response =
        await dio.get("https://dekontaminasi.com/api/id/covid19/stats");
    final responseData = response.data.toString();
    // print(responseData);
    Map<String, dynamic> jsonResponse = jsonDecode(responseData);
    // print(jsonResponse);
    final convert = Stats.fromJson(jsonResponse);
    print("conver");
    print(convert);
    return convert;
  }
}
