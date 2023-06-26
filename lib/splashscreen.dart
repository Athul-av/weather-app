

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/homescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    splashfunction();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: SizedBox( 
      height: 17.h,
      width: 37.w,
      child: const Image(image: AssetImage("assets/images/3845731.png")),
      ),),
    );
  }


  Future splashfunction()async{
   await Future.delayed(const Duration(seconds: 2));
  // ignore: use_build_context_synchronously
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>const  HomeScreen(),));
  }
} 