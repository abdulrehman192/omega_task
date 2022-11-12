import '/view/views.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';

class LoginViewModel extends ChangeNotifier
{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  String verificationId = '';

  setVerificationId(id)
  {
    verificationId = id;
    notifyListeners();
  }

  login(BuildContext context) async
  {
    if(phoneController.text.isNotEmpty)
    {
      final phoneNo = "+92${phoneController.text.substring(1,phoneController.text.length )}";
      FirebaseUtility.verifyPhoneNumber(
          verifyId: (verifyId)
          {
            setVerificationId(verifyId);
          },
          phoneNo: phoneNo,
          auth: _auth,
          context: context
      );
      _settingModalBottomSheet(context);
    }
    else
    {
      Common.showSnackBar("Please Enter Correct Mobile #", context );
    }
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(70.0),
        ),
        context: context,
        builder: (BuildContext bc) {
          return OTPGet(
            otpController: otpController,
            onResendCode: (){
              final phoneNo = "+92${phoneController.text.substring(1,phoneController.text.length )}";
              FirebaseUtility.verifyPhoneNumber(
                  verifyId: (verifyId)
                  {
                    setVerificationId(verifyId);
                  },
                  phoneNo: phoneNo,
                  auth: _auth,
                  context: context
              );
              Common.showSnackBar("Please Wait. Code Sent to Your Number", context);
            },
            proceedFunction: (value) async
            {
              if(value == null)
                {
                  Common.showSnackBar("Please Enter OTP Code to proceed", context);
                }
              else
                {
                  if(value.length == 6) {
                    PhoneAuthCredential authCredential = PhoneAuthProvider
                        .credential(
                        verificationId: verificationId,
                        smsCode: value
                    );

                    FirebaseUtility.signInWithPhoneAuthCredential(
                        phoneAuthCredential: authCredential,
                        auth: _auth,
                        context: context,
                        goTo: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const DashboardView()))
                    );
                  }
                }
            },
          );
        }
    );
  }
}