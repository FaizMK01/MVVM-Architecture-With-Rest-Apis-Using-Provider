import 'package:flutter/cupertino.dart';
import 'package:mvvm_with_provider/data/response/api_response.dart';
import '../model/get_model.dart';
import '../repository/auth_repository.dart';

class GetViewModel with ChangeNotifier {
  final myRepo = AuthRepository();

  ApiResponse<GetModel> getData = ApiResponse.loading();

  setGetData(ApiResponse<GetModel> response){
    getData = response;
    notifyListeners();
  }

  Future<void> get() async{
    setGetData(ApiResponse.loading());
    myRepo.getApi().then((value){
      setGetData(ApiResponse.completed(value));
    }).onError((error,stackTrace){
      setGetData(ApiResponse.error(error.toString()));

    });
  }

}