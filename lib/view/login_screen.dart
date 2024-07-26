import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/resources/components/app_button.dart';
import 'package:mvvm_with_provider/resources/components/app_colors.dart';
import 'package:mvvm_with_provider/utils/routes/route_names.dart';
import 'package:mvvm_with_provider/utils/utils.dart';
import 'package:mvvm_with_provider/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();

  void togglePasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  void dispose() {
    emailController.clear();
    passwordController.clear();
    emailNode.dispose();
    passwordNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.teal,
          automaticallyImplyLeading: false,
          title: const Text("Login"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(38.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                focusNode: emailNode,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.mail),
                  hintText: 'Enter Your Email',
                ),
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(context, emailNode, passwordNode);
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                obscureText: obscureText,
                controller: passwordController,
                focusNode: passwordNode,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: GestureDetector(
                    onTap: togglePasswordVisibility,
                    child: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                  hintText: 'Enter Your Password',
                ),
              ),
              const SizedBox(height: 50),
              AppButton(
                title: "Login",
                loading: authViewModel.loading,
                onPress: () {
                  if (emailController.text.isEmpty) {
                    Utils.toastMessage('Please Enter Your Email');
                  } else if (passwordController.text.isEmpty) {
                    Utils.toastMessage('Please Enter Your Password');
                  } else if (passwordController.text.length < 6) {
                    Utils.toastMessage('Please Enter 6 Digit Password');
                  } else {
                    Map data = {
                      "email": emailController.text,
                      "password": passwordController.text,
                    };
                    authViewModel.login(data, context);
                  }
                },
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteName.signup);
                    },
                    child: Text("Sign Up"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
