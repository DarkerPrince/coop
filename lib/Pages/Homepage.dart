import 'package:coop/Constants/constants.dart';
import 'package:coop/Pages/FeedBack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(top: 32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Image.asset(coopLogo)),
            ),
            SizedBox(
              height: 56.0,
            ),
            Text("Welcome to COOP customer feedback center",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: coopPrimaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w300)),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Image.asset(coopOnboarding),
            ),
            Spacer(),
            ElevatedButton(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Next  ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Icon(Icons.arrow_forward_rounded),
                ],
              ),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width, 60)),
              onPressed: () {
                Get.to(FeedbackPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
