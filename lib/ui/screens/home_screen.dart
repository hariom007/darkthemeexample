import 'package:darkthemeexample/ui/screens/registerNow.dart';
import 'package:flutter/material.dart';
import 'package:darkthemeexample/notifiers/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  AnimationController animationController;

  Animation<double> animation;
  bool cirAn = false;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);

    var size = MediaQuery.of(context).size;
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              Positioned(
                right: MediaQuery.of(context).size.width / 1.3, //230.0,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      cirAn = true;
                    });
                    themeProvider.darkTheme = !themeProvider.darkTheme;

                    if (animationController.status == AnimationStatus.forward ||
                        animationController.status ==
                            AnimationStatus.completed) {
                      animationController.reset();
                      animationController.forward();
                    } else {
                      animationController.forward();
                    }
                  },
                  child: new Container(
                    height: MediaQuery.of(context).size.height / 5.5,
                    width: MediaQuery.of(context).size.height / 15,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      shape: BoxShape.rectangle,
                      color: Theme.of(context).hoverColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 14, right: 14, bottom: 28),
                      child: themeProvider.darkTheme
                          ? Image.asset(
                        "assets/bulb_off.png",
                        fit: BoxFit.fitHeight,
                      )
                          : Image.asset(
                        "assets/bulb_on.png",
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
              ),

              Column(
                children: <Widget>[
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 25.0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 40, bottom: 0.0, left: 25.0, right: 25.0),
                            height: size.height / 6,
                            width: size.width / 2,
                            child: GestureDetector(
                                onTap: () {},
                                child: themeProvider.darkTheme
                                    ? Image.asset("assets/logo_dark.png")
                                    : Image.asset("assets/logo-light.png")),
                          )
                        ],
                      ),
                    ),
                    flex: 3,
                  ),
                  Flexible(
                      flex: 6,
                      child: Container(
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          elevation: 0,
                          // color: Colors.white,
                          child: Container(
                            height: size.height / 1,
                            width: size.width / 1.1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  'Welcome to',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'GDG New Delhi',
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      width: size.width / 12 / 15,
                                    ),
                                    Text(
                                      "DevFest",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff3972CF)),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Container(
                                      child: Text(
                                        "DevFest'19, our yearly fest, is a really special event for us. It describes both, 'The Community Spirit' and 'The Developer Spirit' to keep learning, sharing and developing solutions together.This year it's going to be shaped like a tech conference with experts from a number of domains including Web, Cloud, Android, Flutter, AR/VR, Security, Firebase, ML, Python, IoT, Design, UX, UI, Kotlin and the list continues.What's more? Obviously, goodies!There's going to be a number of activities in and around the event, be sure to participate!",
                                        maxLines: 8,
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                ),
                                Container(
                                  height: size.height / 16,
                                  width: size.width / 3.2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: GestureDetector(
                                    onTap: () async {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisternOw()));
                                    },
                                    child: Stack(
                                      children: <Widget>[
                                        Center(
                                          child: Image.asset(
                                            "assets/button.png",
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                        Container(
                                          height: size.height / 16,
                                          width: size.width / 3.2,
                                          child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "Register Now",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white),
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ],
          ),
          backgroundColor: Theme.of(context).backgroundColor,
        ),
      ),
    );
  }

}