import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Otp_screen.dart';
import 'login_Screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  // static const String KEYLOGIN = "login";
  @override
 void initState() {
    // TODO: implement initState
    super.initState();
   whereToGo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("splashScreen"),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Center(
          child:Text("Home page",style: TextStyle(color: Colors.black,fontSize: 30),)
      ),
    );
  }

  void whereToGo() async{
    var SharedPref = await SharedPreferences.getInstance();
     var isLoggedIN = SharedPref.getBool('raju');


    Timer(Duration(seconds: 4), () {
      if(isLoggedIN ==null){
        Get.to(SharedScreen());
      }else{
        Get.to(OTPScreen());
      }

    });
  }
}
