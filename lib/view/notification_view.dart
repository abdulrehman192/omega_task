import 'package:flutter/material.dart';

import '../utils/utils.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemBuilder: (context, index)
              {
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: AppColors.secondaryColor,
                    backgroundImage: AssetImage("assets/images/logo.jpg"),
                  ),
                  title: const Text("Pak Residencia"),
                  subtitle: const Text("blotting payment received"),
                  trailing: Column(
                    children: const [
                      Icon(Icons.more_horiz, color: AppColors.primaryColor,),
                       Text("3m ago"),
                    ],
                  ),
                  onTap: (){

                  },
                );
              }
      ),
    );
  }
}
