import 'package:flutter/material.dart';
import 'package:solar_system/screens/view/homescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 10),() {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen(),));
    },);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(
          image: AssetImage('assets/img/gif.gif'),fit: BoxFit.fill
        )),
      ),
    );
  }
}
