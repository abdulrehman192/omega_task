import 'package:omega_task/utils/color.dart';
import 'package:provider/provider.dart';

import '/viewModel/viewModels.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        // padding: const EdgeInsets.all(15),
        child: Container(
          alignment: Alignment.bottomCenter,
          width: size.width,
          height: size.height,
          color: AppColors.secondaryColor,
          child: Column(
            children: [
              const Spacer(),
              Container(
                width: size.width,
                height: size.height * 0.35,
                padding: const EdgeInsets.all(35),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)
                  )
                ),
                child: Consumer<LoginViewModel>(
                  builder: (_, vm, __) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                        const Text("Mobile :", style: TextStyle(fontWeight: FontWeight.bold),),
                        InputFiled(
                            controller: vm.phoneController,
                            hintText: "Enter Mobile Number Here",
                            maxLength: 11,
                            keyboard: TextInputType.number,
                        ),
                        const SizedBox(height: 15,),
                        SizedBox(
                          width: size.width,
                          height : 45,
                          child: ElevatedButton(
                            onPressed: (){
                              vm.login(context);
                            },
                            style : ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              ))
                            ),
                            child: const Text("Login", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                          ),
                        )
                      ],
                    );
                  }
                ),
              )
            ],
          )
        ),
      ),
    );
  }


}
