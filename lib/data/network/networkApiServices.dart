import 'dart:convert';
import 'package:http/http.dart' as http;
import '../app_exceptions.dart';
import 'baseApiServices.dart';

class NetworkApiServices extends BaseApiServices {

  dynamic apiResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body);
      case 401:
        throw UnauthorizedException(response.body);
      default:
        throw FetchDataException('Error occurred while communicating with server with status code: ${response.statusCode}');
    }
  }

  @override
  Future getApi(String url) async {
    dynamic jsonResponse;
    try {
      final response = await http.get(Uri.parse(url));
      jsonResponse = apiResponse(response);
      print('GET Response: ${response.body}');
    } catch (e) {
      print(e.toString());
    }
    return jsonResponse;
  }

  @override
  Future postApi(String url, data) async {
    dynamic jsonResponse;
    try {
      final response = await http.post(Uri.parse(url), body: data);
      jsonResponse = apiResponse(response);
      print('POST Response: ${response.body}');
    } catch (e) {
      print(e.toString());
    }
    return jsonResponse;
  }
}
