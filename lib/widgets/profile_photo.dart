import 'package:flutter/material.dart';
import 'package:omega_task/utils/utils.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: AppColors.secondaryColor,
      radius: 80,
      child: CircleAvatar(
        backgroundColor: AppColors.primaryColor,
        radius: 73,
        child: CircleAvatar(
          radius: 65,
          backgroundImage: AssetImage("assets/images/profile.jpg"),
        ),
      ),
    );
  }
}
