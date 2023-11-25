import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Otp_screen.dart';
import 'Splash_Screen.dart';

class SharedScreen extends StatefulWidget {
  const SharedScreen({super.key});

  @override
  State<SharedScreen> createState() => _SharedScreenState();
}

class _SharedScreenState extends State<SharedScreen> {
  var nameController = TextEditingController();
  // var namevalue = "NO value save";
  var sameController = TextEditingController();
  // static const String KEYNAME = "name";
  final formkey = GlobalKey<FormState>();
  bool passwordIcon = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shre pref"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 57,
                  child: TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Email";
                      } else if (!value.endsWith("@gmail.com")) {
                        return "Please Enter Valid Gmail";
                      } else if (!value.contains(RegExp(r'[0-9]'))) {
                        return "Please Enter a Number in Mail";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Your Email',
                      hintStyle: TextStyle(fontSize: 14),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey, width: 1)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 57,
                  child: TextFormField(
                    controller: sameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Password";
                      } else if (value.length < 8) {
                        return "Password must be at least 8 characters long";
                      } else if (value.length > 32) {
                        return "Password cannot exceed 32 characters";
                      } else if (!value.contains(RegExp(r'[A-Z]'))) {
                        return "Password must contain at least one uppercase letter";
                      } else if (!value.contains(RegExp(r'[a-z]'))) {
                        return "Password must contain at least one lowercase letter";
                      } else if (!value.contains(RegExp(r'[0-9]'))) {
                        return "Password must contain at least one number";
                      } else if (!value.contains(RegExp(r'[!@#\$%^&*()_+=]'))) {
                        return "Password must contain at least one special character like !@#\$%^&*()_+=";
                      } else if (value.contains(RegExp(r'\s'))) {
                        return "Password cannot contain spaces";
                      } else if (value.contains("password")) {
                        return "Avoid using common words like 'password' in your password";
                      } else {
                        return null;
                      }
                    },
                    obscureText: passwordIcon,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            passwordIcon
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.green,
                          ),
                          onPressed: () {
                            setState(() {
                              passwordIcon = !passwordIcon;
                            });
                          },
                        ),
                        hintText: 'Enter Your Password',
                        hintStyle: TextStyle(fontSize: 14),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1))),
                  ),

                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 54,
                  width: 230,
                  child: ElevatedButton(onPressed: () async{
                     var SharedPref = await SharedPreferences.getInstance();
                    SharedPref.setBool('raju', true);
                    if(formkey.currentState!.validate()){
                      print("ghhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
                      Get.to(OTPScreen());
                    }
                  }, child: Text("Login"),style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)
                  )
                  ),),
                ),

              ],
            ),
          ),

          ),
    );
  }


  }

