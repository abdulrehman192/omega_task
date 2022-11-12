import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children:  [
            const WelcomeCard(),
            const SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                ItemCard(
                  title: "Installments",
                  subTitle: "10 paid | 50 remaining",
                ),
                ItemCard(
                  title: "Total Plots",
                  subTitle: "1 plot",
                )
              ],
            ),
            const SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                ItemCard(
                  title: "Maintenance",
                  subTitle: "Monthly Charges",
                ),
                ItemCard(
                  title: "Finance",
                  subTitle: "Reports",
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
