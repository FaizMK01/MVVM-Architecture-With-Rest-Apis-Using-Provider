import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/resources/components/app_colors.dart';

class AppButton extends StatelessWidget {

  final String title;
  final VoidCallback onPress;
  final bool loading;
  const AppButton(
      {super.key,required this.title,required this.onPress,this.loading=false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 180,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.purple,
          foregroundColor: AppColors.white,
        ),
          child:loading?CircularProgressIndicator():Text(title),
      ),
    );
  }
}
