import 'package:flutter/material.dart';
import 'package:omega_task/utils/color.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final String subTitle;
  const ItemCard({Key? key, required this.title, required this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.40,
      // height: 130,
      child: Column(
        children: [
          SizedBox(
            width: size.width * 0.40,
            height: size.width * 0.32,
            child: Image.asset("assets/images/logo.jpg",
              fit: BoxFit.fill,
            ),

          ),
          const SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                  Text(subTitle, style: const TextStyle(fontSize: 11, color: AppColors.secondaryColor),)
                ],
              ),
              const Icon(Icons.login, color: AppColors.primaryColor, size: 30,)
            ],
          )
        ],
      ),
    );
  }
}
