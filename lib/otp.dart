import 'dart:async';

import 'package:flutter/material.dart';

// import 'package:quiver/async.dart';
import 'login.dart';

class otp extends StatefulWidget {
  final String pno;

  otp(this.pno);

  @override
  _otpState createState() => _otpState();
}

class _otpState extends State<otp> {
  var showhide = false;

  double? height;
  double? width;
  TextEditingController? contrller1;
  TextEditingController? contrller2;
  TextEditingController? contrller3;
  TextEditingController? contrller4;
  String code = "";

  // int _start = 19;
  // int _current = 19;

  // void startTimer() {
  //   CountdownTimer countDownTimer = CountdownTimer(
  //     Duration(seconds: _start),
  //     const Duration(seconds: 1),
  //   );
  //
  //   var sub = countDownTimer.listen(null);
  //   sub.onData((duration) {
  //     if (mounted) {
  //       // check whether the state object is in tree
  //       setState(() {
  //         _current = _start - duration.elapsed.inSeconds;
  //       });
  //     }
  //   });
  //
  //   sub.onDone(() {
  //     print("Done");
  //     sub.cancel();
  //   });
  // }

  late Timer timer;
  int start = 19;

  @override
  void initState() {
    startTimer();
    super.initState();
    contrller1 = TextEditingController();
    contrller2 = TextEditingController();
    contrller3 = TextEditingController();
    contrller4 = TextEditingController();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          if (mounted) {
            setState(() {
              start--;
            });
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xff14213d),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "OTP Verification",
          style: TextStyle(color: Color(0xff14213d), fontSize: 18),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text(
                  "We have send verification code to",
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 35),
                child: Text(
                  "+91- " + widget.pno.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      otptextfield(
                          first: true, last: false, controllerr: contrller1),
                      otptextfield(
                          first: false, last: false, controllerr: contrller2),
                      otptextfield(
                          first: false, last: false, controllerr: contrller3),
                      otptextfield(
                          first: false, last: true, controllerr: contrller4),
                    ],
                  ),
                  ElevatedButton(
                    child: Text(start > 0
                        ? "Resend SMS in $start"
                        : "Not received OTP? Resend Now"),
                    onPressed: () {
                      if (start == 0) {
                        setState(() {
                          start = 19;
                          startTimer();
                        });
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            start == 0 ? const Color(0xff14213d) : Colors.grey),
                        elevation: MaterialStateProperty.all(0.0),
                        shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ))),
                  ),
                  ElevatedButton(
                    child: const Text("Verify"),
                    onPressed: () {
                      if (contrller1?.text.trim().length == 1 &&
                          contrller2?.text.trim().length == 1 &&
                          contrller3?.text.trim().length == 1 &&
                          contrller4?.text.trim().length == 1) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const selectcategory()));
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            contrller1?.text.trim().length == 1 &&
                                contrller2?.text.trim().length == 1 &&
                                contrller3?.text.trim().length == 1 &&
                                contrller4?.text.trim().length == 1
                                ? const Color(0xff14213d)
                                : Colors.grey),
                        elevation: MaterialStateProperty.all(0.0),
                        shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ))),
                  ),
                  Visibility(
                      visible: showhide,
                      child: Text(
                        "OTP Is Wrong",
                        style: TextStyle(color: Colors.red),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   startTimer();
  //   // TODO: implement dispose
  //   super.dispose();
  // }

  Widget otptextfield({bool? first, last, TextEditingController? controllerr}) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 35),
      height: height! / 12,
      child: AspectRatio(
        aspectRatio: 0.8,
        child: TextField(
          controller: controllerr,
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: const Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1.9, color: Colors.black54),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1.9, color: Colors.black54),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
