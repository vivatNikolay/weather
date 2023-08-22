import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';

import '../models/api_constants.dart';

class HttpService {

  Future<Map<String, dynamic>> fetchWeather(double lat, double lon) async {
    final queryParameters = {
      'lat': lat.toString(),
      'lon': lon.toString(),
      'appid': ApiConstants.apiKey,
      'exclude': ApiConstants.exclude,
      'units': ApiConstants.units,
    };
    final uri = Uri.https(ApiConstants.url, ApiConstants.postfix, queryParameters);
    try {
      Response res = await get(uri);
      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      } else {
        throw 'Error fetch weather';
      }
    } on SocketException catch(e) {
      throw 'No connection';
    }
  }
}