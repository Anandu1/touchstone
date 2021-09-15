import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:screen/screen.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({Key? key}) : super(key: key);

  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> with SingleTickerProviderStateMixin{
  bool _isKeptOn = false;
  double brightness = 0;
  Color bulbColor=Colors.yellow[800]!;
  AnimationController? controller;
  Animation<double>? animation;
  @override
  initState() {
    controller=AnimationController(vsync: this,duration: Duration(milliseconds: 1500)
    );
    animation=Tween(
      begin: 0.0,
      end: 1.0
    ).animate(controller!);
    super.initState();
    initPlatformState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  initPlatformState() async {
    bool keptOn = await Screen.isKeptOn;
    double brightness = await Screen.brightness;
    setState((){
      _isKeptOn = keptOn;
      brightness = brightness;
    });
  }
  @override
  Widget build(BuildContext context) {
    controller!.forward();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin:Alignment.centerLeft,
                end: Alignment.centerRight
                , colors: [Colors.blue[900]!,Colors.blue[800]!])
        ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset("assets/Icon ionic-md-arrow-round-back.svg"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text("Bed Room",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
                            Text("4 Lights",style: TextStyle(fontSize: 18,color: Colors.yellow[700],fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            child: Column(
                              children: [
                                SvgPicture.asset("assets/Group 38.svg"),
                                Container(
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: bulbColor
                                  ),
                                ),
                              ],
                            ),),

                      )
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Row(
                //       children: [
                //         Text("4 Lights",style: TextStyle(fontSize: 18,color: Colors.yellow[700],fontWeight: FontWeight.bold),),
                //       ],
                //     ),
                //   ),
                // ),
              SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(1,0),
                  end: Offset.zero
                ).animate(controller!),
                child: Container(
                  height: MediaQuery.of(context).size.height/12,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: tabBar("assets/solution.svg", "Main Light", Colors.white,Colors.blue[900]!)!,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: tabBar("assets/furniture-and-household.svg", "Desk lights", Colors.blue[900]!,Colors.white)!,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: tabBar("assets/bed (1).svg", "Bed Light", Colors.white,Colors.blue[900]!)!,
                      ),
                    ],
                  ),
                ),
              ),
                SlideTransition(
                  position: Tween<Offset>(
                      begin: Offset(0,-1),
                      end: Offset.zero
                  ).animate(controller!),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight:Radius.circular(30) )
                    ),
                    alignment: Alignment.topCenter,
                    transformAlignment: Alignment.center,
                    child: Column(
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 18.0,top: 8),
                              child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white
                                  ),
                                  child: SvgPicture.asset("assets/Icon awesome-power-off.svg",height: 25,)),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 28.0,left: 28),
                          child: Row(
                            children: [

                              Text("Intensity",
                                style: TextStyle(fontSize: 20,color: Colors.blue[900],fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: SvgPicture.asset("assets/solution1.svg")),
                              Expanded(
                                flex: 5,
                                child: Slider(
                                    inactiveColor: Colors.grey,
                                    activeColor: Colors.yellow[700],
                                    value : brightness, onChanged : (double b){
                                  setState((){
                                    brightness = b;
                                  });
                                  Screen.setBrightness(b);
                                }),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: SvgPicture.asset("assets/solution.svg")),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 28.0,left: 28),
                          child: Row(
                            children: [
                              Text("Colors",
                                style: TextStyle(fontSize: 20,color: Colors.blue[900],fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    bulbColor=Colors.pink[200]!;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.pink[200]
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    bulbColor=Colors.lightGreen;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.lightGreen
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    bulbColor=Colors.blue[200]!;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue[200]
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    bulbColor=Colors.deepPurple[200]!;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.deepPurple[200]
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    bulbColor=Colors.purple[200]!;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.purple[200]
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    bulbColor=Colors.orangeAccent[100]!;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.orangeAccent[100]
                                  ),
                                ),
                              ),Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[50],
                                ),
                                child: SvgPicture.asset("assets/+.svg"),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 28.0,left: 28),
                          child: Row(
                            children: [
                              Text("Scenes",
                                style: TextStyle(fontSize: 20,color: Colors.blue[900],fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  sceneTile( "Birthday",Colors.pink[200]!,Colors.orange[100]!,)!,
                                  sceneTile( "Party",Colors.purple[200]!,Colors.purple[100]!,)!,
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  sceneTile( "Relax",Colors.blue[200]!,Colors.blue[100]!,)!,
                                  sceneTile( "Fun",Colors.lightGreen[300]!,Colors.lightGreen[200]!,)!,
                                ],
                              ),
                            )
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
  Widget? sceneTile(String text,Color color1,Color color2,){
    return Container(
      height: MediaQuery.of(context).size.height / 10,
      width: MediaQuery.of(context).size.width / 2.5,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin:Alignment.centerLeft,
        end: Alignment.centerRight
        , colors: [color1,color2])
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset("assets/solution1.svg",color:Colors.white ,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    );
  }
  Widget? tabBar(String path,String title,Color color,Color textColor,){
    return Container(
      padding: EdgeInsets.all(8),
      height: MediaQuery.of(context).size.height / 14,

      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(path,color: textColor,),
          ),
          Text(title,style: TextStyle(fontWeight:FontWeight.bold ,color: textColor,fontSize: 16),)
        ],
      ),
    );
  }
}
