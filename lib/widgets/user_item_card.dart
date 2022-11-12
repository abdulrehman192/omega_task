import 'package:flutter/material.dart';
import 'package:omega_task/utils/color.dart';

class UserItemCard extends StatelessWidget {
  final Widget icon;
  final String title;
  final String subTitle;
  const UserItemCard({Key? key, required this.icon, required this.title, required this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width : 130,
      height: 150,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.primaryColor
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          icon,
          Text(title, style: const TextStyle(fontSize: 26, color: Colors.white),),
          Text(subTitle, style: const TextStyle(fontSize: 12, color: Colors.white),)
        ],
      ),
    );
  }
}
