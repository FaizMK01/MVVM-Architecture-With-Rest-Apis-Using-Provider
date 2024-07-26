import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{

  //Flutter Toast

  static toastMessage(String message){
    Fluttertoast.showToast(msg: message);
  }

  //Flush Bar

 static void flushBarError(String message,BuildContext context){
    Flushbar(
      message: message,
      duration: Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
 }

 //Snack Bar

static void snackBar(String message,BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}

static void fieldFocusChange(BuildContext context,FocusNode current,FocusNode next){
    current.unfocus();
    FocusScope.of(context).requestFocus(next);



}


}