import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../utils/utils.dart';

class OTPGet extends StatefulWidget {
  final Function(String?) proceedFunction;
  final TextEditingController otpController;
  final Function() onResendCode;
  const OTPGet({Key? key, required this.proceedFunction, required this.otpController, required this.onResendCode}) : super(key: key);

  @override
  _OTPGetState createState() => _OTPGetState();
}

class _OTPGetState extends State<OTPGet> with CodeAutoFill {
  String? appSignature;
  String? otpCode;

  _listenOtp()
  {
    SmsAutoFill().listenForCode;
  }

  @override
  void initState() {
    super.initState();
    _listenOtp();
    listenForCode();

    SmsAutoFill().getAppSignature.then((signature) {
      setState(() {
        appSignature = signature;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    cancel();
  }

  @override
  Widget build(BuildContext context) {
    return otpWidget(context);
  }

  otpWidget(BuildContext context)
  {
    otpCode = widget.otpController.text;
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.35,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(70),
              topRight: Radius.circular(50)),
              boxShadow:
                  [
                    BoxShadow(
                    color: Colors.grey.withOpacity(0.5,), blurRadius: 8)
                  ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Enter Code", style: TextStyle(color: Colors.black, fontSize: size.width * 0.05, fontWeight: FontWeight.bold),),
          Text("Code is sent to your registered "
              "phone number ",style: TextStyle(color: Colors.black,fontSize: size.width * 0.035,),textAlign: TextAlign.center,),
          const SizedBox( height: 5,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: PinFieldAutoFill(

              controller: widget.otpController,
              decoration: BoxLooseDecoration(
                textStyle: const TextStyle(fontSize: 20, color: Colors.black),
                strokeColorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
              ),
              currentCode: otpCode,
              onCodeSubmitted: (code) {

              },
              onCodeChanged: (code) {
                if (code!.length == 6) {
                  FocusScope.of(context).requestFocus(FocusNode());
                }
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Didn't receive code?",style: TextStyle( color: Colors.black, fontSize: size.width * 0.035,),),
              ),
              TextButton(
                  onPressed: widget.onResendCode,
                  child: const Text('Resend Code')
              )
            ],
          ),
          ElevatedButton(
            onPressed: ()
            {
              widget.proceedFunction(widget.otpController.text);
            },
            style : ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ))
            ),
            child: const Text('Proceed'),
          )
        ],
      ),
    );
  }

  @override
  void codeUpdated() {
    setState(() {
      otpCode = code!;
    });
  }
}