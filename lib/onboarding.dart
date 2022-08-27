import 'package:flutter/material.dart';

import 'login.dart';

class onbording extends StatefulWidget {
  @override
  State<onbording> createState() => _onbordingState();
}

class _onbordingState extends State<onbording> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

//BackGround Color : 0xff14213d
//ForeGround Color : 0xffadb5bd / 0xff6c757d

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              onPageChanged: (int page) {
                setState(() {
                  currentIndex = page;
                });
              },
              controller: _pageController,
              children: [
                Container(
                  padding:
                  const EdgeInsets.only(left: 50, right: 50, bottom: 80),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 350,
                        child: Image.asset("Images/1.gif"),
                      ),
                      const Text(
                        "Say GoodBye to Your Puncture Troubles!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff14213d),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        child: const Text(
                          "Do Not Stop, Keep Traveling",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff6c757d),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                  const EdgeInsets.only(left: 50, right: 50, bottom: 80),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 350,
                        child: Image.asset("Images/2.gif"),
                      ),
                      const Text(
                        "Live Updates & Tracking",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff14213d),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        child: const Text(
                          "Dedicated Serviceman at Your Service",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff6c757d),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                  const EdgeInsets.only(left: 50, right: 50, bottom: 80),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 350,
                        child: Image.asset("Images/3.gif"),
                      ),
                      const Text(
                        "Repair Your Puncture on Your Fingertips",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff14213d),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        child: const Text(
                          "SuperFast Services",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff6c757d),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                  const EdgeInsets.only(left: 50, right: 50, bottom: 80),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 350,
                        child: Image.asset("Images/3.gif"),
                      ),
                      const Text(
                        "Stay Home, Stay Safe",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff14213d),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        child: const Text(
                          "Service at Your Own Destination",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff6c757d),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              bottom: 45,
              left: 30,
              child: Row(
                children: _buildIndicator(),
              ),
            ),
            Positioned(
              bottom: 25,
              right: 30,
              child: Container(
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (currentIndex < 3) {
                          currentIndex++;
                          if (currentIndex < 4) {
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          }
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 24,
                      color: Colors.white,
                    )),
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff14213d),
                ),
              ),
            ),
            Positioned(
              top: 25,
              right: 30,
              child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(color: Colors.grey[500], fontSize: 18),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  //Extra Widgets

//Create the indicator decorations widget
  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10.0,
      width: isActive ? 20 : 8,
      margin: const EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        color: Colors.blueGrey[900],
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

//Create the indicator list
  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < 4; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}
