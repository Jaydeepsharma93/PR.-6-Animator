import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:provider/provider.dart';
import 'package:solar_system/screens/Controller/provider.dart';
import 'package:solar_system/screens/view/detailscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    JsonProvider jsonProvider = Provider.of<JsonProvider>(context);
    JsonProvider jsonProviderFalse =
        Provider.of<JsonProvider>(context, listen: false);
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   actions: [
      //     IconButton(onPressed: () {
      //
      //     }, icon: Icon(Icons.favorite_border))
      //   ],
      // ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/img/galaxy.jpg'), fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.menu,
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
            SizedBox(height: 100),
            CarouselSlider.builder(
                itemCount: jsonProvider.objectList.length,
                itemBuilder: (context, index, realIndex) =>
                    GlassContainer.clearGlass(
                        color: Colors.white.withOpacity(0.1),
                        child: Column(
                          children: [
                            Hero(
                              tag: '$index',
                              child: GestureDetector(
                                onTap: () {
                                  jsonProviderFalse.changeIndex(index);
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DetailScreen(),
                                  ));
                                },
                                child: AnimatedContainer(
                                  height:
                                      (index == jsonProvider.index) ? 360 : 180,
                                  width:
                                      (index == jsonProvider.index) ? 360 : 180,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(jsonProvider
                                              .objectList[index].img
                                              .toString()),
                                          fit: BoxFit.fill)),
                                  duration: Duration(milliseconds: 700),
                                ),
                              ),
                            ),
                            Text(
                              jsonProvider.objectList[index].n.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 28),
                            ),
                            Text(
                              "diameter of " +
                                  jsonProvider.objectList[index].n.toString() +
                                  " : " +
                                  jsonProvider.objectList[index].d_km
                                      .toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )
                          ],
                        )),
                options: CarouselOptions(
                    height: 500,
                    onPageChanged: (index, reason) {
                      jsonProviderFalse.pageChanged(index);
                    },
                    viewportFraction: 0.8,
                    animateToClosest: true,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true))
          ],
        ),
      ),
    );
  }
}
