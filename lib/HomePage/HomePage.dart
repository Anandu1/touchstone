import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:touchstone/RoomPage/RoomPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue[900],
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Control\n Panel",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          foregroundImage:AssetImage("assets/profu.jpg") ,
                          radius: 25,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.97),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 28.0, left: 28,bottom: 28),
                          child: Row(
                            children: [
                              Text(
                                "All rooms",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue[900],
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute
                                          (builder: (context){
                                            return RoomPage();
                                        }));
                                      },
                                      child: tile("assets/bed.svg", "Bed room",
                                          "4 lights")!),
                                  tile("assets/room.svg", "Living room",
                                      "2 lights")!,
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  tile("assets/kitchen.svg", "Kitchen",
                                      "5 lights")!,
                                  tile("assets/bathtube.svg", "Bathroom",
                                      "1 lights")!,
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  tile("assets/house.svg", "Outdoor",
                                      "5 lights")!,
                                  tile("assets/balcony.svg", "Balcony",
                                      "2 lights")!,
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/bulb.svg"), label: "Bulb"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/Icon feather-home.svg"),
              label: "Bulb"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/Icon feather-settings.svg"),
              label: "Bulb"),
        ],
      ),
    );
  }

  Widget? tile(String svgPath, String room, String lights) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white),
        color: Colors.white
        // boxShadow: [
        //   BoxShadow(
        //     offset: const Offset(
        //       0.0,
        //       0.0,
        //     ),
        //     blurRadius: 0.0,
        //     spreadRadius: 0.0,
        //   ), //BoxShadow
        //   BoxShadow(
        //     color: Colors.white,
        //     offset: const Offset(0.0, 0.0),
        //     blurRadius: 0.0,
        //     spreadRadius: 0.0,
        //   ), //BoxShadow
        // ],
      ),
      padding: EdgeInsets.all(8),
      height: MediaQuery.of(context).size.height / 5.5,
      width: MediaQuery.of(context).size.width / 2.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 14.0,left: 8),
            child: SvgPicture.asset(svgPath),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0,left: 8),
            child: Text(
              room,
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0,left: 8),
            child: Text(
              lights,
              style: TextStyle(
                color: Colors.orange,fontSize: 16,fontWeight: FontWeight.bold
              ),
            ),
          )
        ],
      ),
    );
  }
}
