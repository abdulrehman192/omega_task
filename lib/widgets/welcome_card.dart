import 'package:flutter/material.dart';
import 'package:omega_task/utils/utils.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: 140,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: size.width * 0.92,
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.primaryColor
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Pak Residencia Plots", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
                  Padding(
                    padding: EdgeInsets.only(right: 100.0),
                    child: Text("Plots for sale and commercial apartments are available", style: TextStyle(color: Colors.white54),),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 10,
            child: Container(
              height: 80,
              width: size.width * 0.30,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/pic.png"),
                  fit: BoxFit.cover
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}
