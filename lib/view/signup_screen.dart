import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../resources/components/app_button.dart';
import '../resources/components/app_colors.dart';
import '../utils/routes/route_names.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignupScreen> {
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
    emailController.dispose();
    passwordController.dispose();
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
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.teal,
          title: const Text("Sign Up"),
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
                    prefixIcon: Icon(Icons.mail), hintText: 'Enter Your Email'),
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(context, emailNode, passwordNode);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: obscureText,
                controller: passwordController,
                focusNode: passwordNode,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: obscureText
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                    hintText: 'Enter Your Password'),
                onTap: togglePasswordVisibility,
              ),
              const SizedBox(
                height: 50,
              ),
              AppButton(
                  title: "Sign Up",
                  loading: authViewModel.loading,
                  onPress: () {
                    if (emailController.text.isEmpty) {
                      Utils.toastMessage('Please Enter Your Email');
                    } else if (passwordController.text.isEmpty) {
                      Utils.toastMessage('Please Enter Your Password');
                    } else if (passwordController.text.length < 4) {
                      Utils.toastMessage('Please Enter 6 Digit Password');
                    } else {
                      Map data = {
                        "email": emailController.text,
                        "password": passwordController.text
                      };
                      AuthViewModel().register(data, context);

                      Utils.flushBarError("Sign Up Successfully", context);
                    }
                  }),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account"),
                  TextButton(onPressed: (){
                    Navigator.pushNamed(context, RouteName.login);
                  }, child: const Text("Login"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
