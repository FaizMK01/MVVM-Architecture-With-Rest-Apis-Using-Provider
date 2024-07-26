import 'package:flutter/material.dart';

import '../view_model/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashServices splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    print('Splash screen initialized');
    splashServices.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Splash Screen",style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),) // Your splash screen UI
      ),
    );
  }
}
