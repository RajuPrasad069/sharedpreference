import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pinput/pinput.dart';
class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final otpvalidation = GlobalKey<FormState>();
  TextEditingController pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final defaultTheme = PinTheme(
      width: 50,
      height: 50,
      textStyle: TextStyle(color: Colors.green,fontWeight: FontWeight.w500,),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
              color: Colors.green,width: 2
          )
      ),
    );
    final focutPinTheme = defaultTheme.copyDecorationWith(
      border: Border.all(color: Colors.green,width: 2),
      borderRadius: BorderRadius.circular(50),

    );
    final submitPinTheme = defaultTheme.copyWith(
      decoration: defaultTheme.decoration!.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("OTPScreen",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.blue,
        centerTitle: true,
        leading: IconButton(onPressed: (){
          setState(() {
              Get.back();
          });
        }, icon: Icon(Icons.arrow_back,color: Colors.white70,size: 30,)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height:40),
              Text("Enter OTP",style: TextStyle(
                  fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Gilroy'
                //fontFamily: mainFontFamily
              ),),
              SizedBox(height: 10,),
              Text("Please enter the four digit otp we sent to\nyour email.",style: TextStyle(
                  fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey
              ),),
              SizedBox(height: 30,),
              Center(
                child: Form(
                  key: otpvalidation,
                  child: Pinput(
                    controller: pinController,
                    length: 6,
                    defaultPinTheme: defaultTheme,
                    submittedPinTheme: submitPinTheme,
                    focusedPinTheme: focutPinTheme,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please Enter OTP";
                      }
                      else if(value.length<6){
                        return "Not fill All Code";
                      }
                      else{
                        return null;
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 50,),
              SizedBox(
                height: 54,
                width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  if(otpvalidation.currentState!.validate()){
                    Get.to(());
                  }
          
                }, child: Text("Verify",style: TextStyle(
                  fontWeight: FontWeight.bold,fontSize: 20,
                ),),style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)
                )
                ),),
              ),
              SizedBox(height: 8,),
              Center(
                child: Text.rich(
                  TextSpan(
                      text: "I don’t received OTP! ?   ",style: TextStyle(
                      fontSize: 14,color: Colors.grey
                  ),
                      children: [
                        TextSpan(
                            text: 'Resend again',
                            recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()),
                            style: TextStyle(
                                fontSize: 16,color: Colors.green,fontWeight: FontWeight.bold
                            )
                        )
                      ]
                  ),
                ),
              ),
          
            ],
          ),
        ),
      ),
    
    );
  }
}
         
