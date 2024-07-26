import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/model/login_model.dart';
import 'package:mvvm_with_provider/repository/auth_repository.dart';
import 'package:mvvm_with_provider/utils/routes/route_names.dart';
import 'package:mvvm_with_provider/utils/utils.dart';
import 'package:mvvm_with_provider/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final myRepo = AuthRepository();
  bool loading = false;
  bool signupLoading = false;

  setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  registerLoading(bool value) {
    signupLoading = value;
    notifyListeners();
  }

  Future<void> login(dynamic data, BuildContext context) async {
    setLoading(true);
    myRepo.loginApi(data).then((value) {
      setLoading(false);
      final userPrefrence = Provider.of<UserViewModel>(context,listen: false);
      userPrefrence.saveUser(
        LoginModel(
          token: value['token'].toString()
        )

      );
      if (value != null) {
        Utils.flushBarError("Login Successfully", context);
        Navigator.pushNamed(context, RouteName.home);
      } else {
        Utils.flushBarError("Invalid email or password", context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarError(error.toString(), context);
    });
  }

  Future<void> register(dynamic data, BuildContext context) async {
    registerLoading(true);
    myRepo.registerApi(data).then((value) {
      registerLoading(false);
      if (value != null) {
        Utils.flushBarError("Register Successfully", context);
        Navigator.pushNamed(context, RouteName.home);
      } else {
        Utils.flushBarError("Registration failed", context);
      }
    }).onError((error, stackTrace) {
      registerLoading(false);
      Utils.flushBarError(error.toString(), context);
    });
  }
}
