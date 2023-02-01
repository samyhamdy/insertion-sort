import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insertion_sort/modules/insertion_sort/insertion_sort_screen.dart';

import '../../shared/components/components.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isTapped = false;
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => setState(() {
              isTapped = !isTapped;
            }));
  }

  bool isselected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        child: Container(
            width: w(context, 1),
            height: h(context, 1),
            color: Colors.white, //color of background of container
            alignment: Alignment
                .center, //animated container that written inside it suadi elghadra
            child: Center(
                child: AnimatedContainer(
              onEnd: () =>
                  getData(), //naviagtion after animated container duaration finished
              height: isTapped ? w(context, .6) : w(context, .1),
              width: isTapped ? w(context, .6) : w(context, .1),
              alignment:
                  isTapped ? Alignment.center : AlignmentDirectional.topCenter,
              duration: Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage("assets/logo.png"), fit: BoxFit.fill),
              ),
            ))),
        onWillPop: _onBackPressed,
      ),
    );
  }

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        // barrierColor: Colors.white,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            content: MainText(
              txt: "هل تريد اغلاق التطبيق؟ ",
              size: 18,
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: MainText(
                  txt: "لا",
                  size: 15,
                ),
              ),
              FlatButton(
                onPressed: () =>
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
                child: MainText(
                  txt: "نعم",
                  size: 15,
                ),
              ),
            ],
          );
        }).then((value) => true);
  }

  getData() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return InsertionSortScreen();
    }));
  }

  w(x, double s) {
    return MediaQuery.of(context).size.width * s;
  }

  h(x, double s) {
    return MediaQuery.of(context).size.height * s;
  }
}



// #eb4326