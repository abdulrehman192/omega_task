import 'dart:math';

import 'package:flutter/material.dart';
import 'package:omega_task/utils/color.dart';
import 'package:omega_task/widgets/profile_photo.dart';

import '../widgets/widgets.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            const ProfilePhoto(),
            const SizedBox(height: 15,),
            const Text("Muhammad Ali", style: TextStyle(color: AppColors.primaryColor, fontSize: 22, fontWeight: FontWeight.bold),),
            const Text("Engineer", style: TextStyle(color: AppColors.secondaryColor, fontWeight: FontWeight.bold, fontSize: 20),),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                 UserItemCard(
                  icon: Icon(Icons.home, size: 70,color: Colors.white,),
                  title: "3",
                  subTitle: "Plots",
                ),
                UserItemCard(
                  icon: Icon(Icons.monetization_on, size: 70,color: Colors.white,),
                  title: "120K",
                  subTitle: "Paid Amount",
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                UserItemCard(
                  icon: Icon(Icons.money, size: 70,color: Colors.white,),
                  title: "20",
                  subTitle: "Installments left",
                ),
                UserItemCard(
                  icon: Icon(Icons.monetization_on, size: 70,color: Colors.white,),
                  title: "350K",
                  subTitle: "Remaining Charges",
                ),
              ],
            ),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: (){

                },
                style : ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ))
                ),
                child: const Text("Logout"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
