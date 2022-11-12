import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:omega_task/utils/color.dart';
import 'package:omega_task/view/dashboard_view.dart';
import 'package:omega_task/viewModel/login_viewModel.dart';
import 'package:provider/provider.dart';
import '/view/login_view.dart';

import 'firebase_options.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=> LoginViewModel()),

        ],
      child:  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: const LoginView(),
    ),
  ));
}
