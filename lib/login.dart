import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'otp.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  double? width;
  double? height;

  TextEditingController pnocontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: SizedBox(
                  width: width,
                  height: height! * 0.45,
                  child: Image.network(
                    'https://images.unsplash.com/photo-1509822929063-6b6cfc9b42f2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bG9naW58ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 25),
                      child: const Text(
                        "Super Fast Services \n      at Your Home",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      child: Stack(
                        children: [
                          Divider(
                            color: Colors.grey[400],
                          ),
                          Center(
                            child: Container(
                              height: 16,
                              width: 115,
                              color: Colors.white,
                              child: Center(
                                  child: Text(
                                "Log in or sign up",
                                style: TextStyle(color: Colors.grey[600]),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.phone,
                      controller: pnocontroller,
                      cursorColor: const Color(0xff14213d),
                      cursorHeight: 20,
                      decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xff14213d),
                        )),
                        hintText: 'Enter Phone Number',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 15),
                      child: SizedBox(
                        width: width,
                        height: 40,
                        child: ElevatedButton(
                          child: const Text(
                            "Continue",
                            style: TextStyle(fontSize: 15, letterSpacing: 1),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  pnocontroller.text.trim().length == 10
                                      ? const Color(0xff14213d)
                                      : Colors.grey),
                              elevation: MaterialStateProperty.all(0.0),
                              shape: MaterialStateProperty.all(
                                  const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ))),
                          onPressed: () {
                            if (pnocontroller.text.trim().length == 10) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          otp(pnocontroller.text.toString())));
                            }
                          },
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Divider(
                          color: Colors.grey[400],
                        ),
                        Center(
                          child: Container(
                            height: 16,
                            width: 30,
                            color: Colors.white,
                            child: const Center(child: Text("or")),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xffe9ecef))),
                      child: Center(
                        child: SvgPicture.asset(
                          "Images/gimage1.svg",
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
