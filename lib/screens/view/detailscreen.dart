import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Controller/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with TickerProviderStateMixin {
  AnimationController? _animationController; // Declare animation controller

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration:
          const Duration(seconds: 5), // Adjust rotation duration as needed
    );
    _animationController?.repeat(); // Set animation to repeat indefinitely
  }

  @override
  void dispose() {
    _animationController?.dispose(); // Dispose controller on widget disposal
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    JsonProvider jsonProvider = Provider.of<JsonProvider>(context);
    JsonProvider jsonProviderFalse =
        Provider.of<JsonProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/img/galaxy.jpg'), fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite,
                          size: 30,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        jsonProviderFalse.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 32,
                      )),
                  AnimatedBuilder(
                    animation: _animationController!,
                    builder: (context, child) => Transform.rotate(
                      angle: _animationController!.value * 2 * pi,
                      // Convert animation value to radians
                      child: Container(
                        height: 320,
                        width: 320,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage(jsonProvider
                              .objectList[jsonProvider.Index].img
                              .toString()),
                        )),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        jsonProviderFalse.next();
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 32,
                      )),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 3,
                  ),
                  Text(
                    jsonProvider.objectList[jsonProvider.Index].n.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 34),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ))
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      (jsonProvider.Index == 0)
                          ? jsonProvider.objectList[jsonProvider.Index].o
                          : "Order From Sun : " +
                              jsonProvider.objectList[jsonProvider.Index].o
                                  .toString(),
                      style: TextStyle(color: Colors.white, fontSize: 24)),
                  Text(
                      (jsonProvider.Index == 0)
                          ? ""
                          : "Moons : " +
                              jsonProvider.objectList[jsonProvider.Index].mns
                                  .toString(),
                      style: TextStyle(color: Colors.white, fontSize: 24))
                ],
              ),
              Text(
                  "Average Temperature Celsius : " +
                      jsonProvider.objectList[jsonProvider.Index].temp_c
                          .toString(),
                  style:
                      TextStyle(color: Colors.white, fontSize: 24, height: 2)),
              Text(
                  "Orbital Period Days : " +
                      jsonProvider.objectList[jsonProvider.Index].op_d
                          .toString(),
                  style:
                      TextStyle(color: Colors.white, fontSize: 24, height: 2)),
              SizedBox(height: 20),
              Text("About :",
                  style:
                      TextStyle(color: Colors.white, fontSize: 24, height: 2)),
              Text(jsonProvider.objectList[jsonProvider.Index].desc.toString(),
                  style:
                      TextStyle(color: Colors.white, fontSize: 18, height: 2))
            ],
          ),
        ),
      ),
    );
  }
}
