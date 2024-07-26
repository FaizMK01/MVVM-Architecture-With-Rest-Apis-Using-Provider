abstract class BaseApiServices {

  //get Api
  Future<dynamic> getApi(String url);

  //post Api
  Future<dynamic> postApi(String url, dynamic data);
}
