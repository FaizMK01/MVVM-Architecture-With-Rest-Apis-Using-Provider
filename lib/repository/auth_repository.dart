import 'package:mvvm_with_provider/model/get_model.dart';
import '../data/network/networkApiServices.dart';
import '../resources/api_urls.dart';


class AuthRepository {
  NetworkApiServices networkApiServices = NetworkApiServices();

  // Login Api
  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic loginResponse = await networkApiServices.postApi(ApiUrls.loginUrl, data);
      return loginResponse;
    } catch (e) {
      print(e.toString());
    }
  }

  // Sign Up Api
  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic registerResponse = await networkApiServices.postApi(ApiUrls.registerUrl, data);
      return registerResponse;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<GetModel?> getApi() async {
    try {
      dynamic getResponse = await networkApiServices.getApi(ApiUrls.getUrl);
      return getResponse  = GetModel.fromJson(getResponse);
    } catch (e) {
      print(e.toString());
    }
  }

}
