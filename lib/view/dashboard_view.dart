import 'package:flutter/material.dart';
import 'package:omega_task/utils/color.dart';
import 'package:omega_task/view/home_view.dart';
import 'package:omega_task/view/notification_view.dart';
import 'package:omega_task/view/profile_view.dart';
import 'package:omega_task/view/report_view.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int index = 0;
  final views = const  [
    HomeView(),
    ReportView(),
    NotificationView(),
    ProfileView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primaryColor,
        title: Row(
          children: const [
            CircleAvatar(
              backgroundColor: AppColors.secondaryColor,
              backgroundImage: AssetImage("assets/images/logo.jpg"),
            ),
            SizedBox(width: 5,),
            Text("Pak Residencia")
          ],
        ),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: (){},
              splashRadius: 20,
              icon: const Icon(Icons.more_horiz,)
          )
        ],
      ),

      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 250,
              decoration: const BoxDecoration(
                  color: AppColors.secondaryColor,
                image: DecorationImage(
                  image: AssetImage("assets/images/logo.jpg"),
                  fit: BoxFit.fill
                ),
              ),
            ),
            const SizedBox(height: 10,),
            ListTile(
              leading: const Icon(Icons.home, color: AppColors.secondaryColor,),
              title: const Text("Home", style: TextStyle(fontSize: 20, color: AppColors.secondaryColor),),
              onTap: (){
                setState(() {
                  index = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.details, color: AppColors.secondaryColor,),
              title: const Text("Plot Details", style: TextStyle(fontSize: 20, color: AppColors.secondaryColor),),
              onTap: (){

              },
            ),
            ListTile(
              leading: const Icon(Icons.history, color: AppColors.secondaryColor,),
              title: const Text("Installment History", style: TextStyle(fontSize: 20, color: AppColors.secondaryColor),),
              onTap: (){

              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications, color: AppColors.secondaryColor,),
              title: const Text("Notifications", style: TextStyle(fontSize: 20, color: AppColors.secondaryColor),),
              onTap: (){
                setState(() {
                  index = 2;
                });
                Navigator.pop(context);
              },
            ),
            const Spacer(),
            ListTile(
              leading: const Icon(Icons.logout, color: AppColors.secondaryColor,),
              title: const Text("Logout", style: TextStyle(fontSize: 20, color: AppColors.secondaryColor),),
              onTap: (){

              },
            ),
            const SizedBox(height: 20 ,)
          ],
        ),
      ),
      body: views[index],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: index,
        onTap: (i)
        {
          setState(() {
            index = i;
          });
        },
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.secondaryColor,
        items: const [
          BottomNavigationBarItem(

              icon: Icon(Icons.apps),
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: "Reports"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "Notification"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile"
          )
        ],

      ),
    );
  }
}
