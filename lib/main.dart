import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/utils/routes/route_names.dart';
import 'package:mvvm_with_provider/utils/routes/routes.dart';
import 'package:mvvm_with_provider/view_model/auth_view_model.dart';
import 'package:mvvm_with_provider/view_model/get_view_model.dart';
import 'package:mvvm_with_provider/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouteName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
