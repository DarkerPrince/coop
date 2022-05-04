import 'dart:ui';

import 'package:coop/Constants/constants.dart';
import 'package:coop/Pages/Problem%20Report.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackState createState() => _FeedbackState();
}

class _FeedbackState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'Category One';
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback Page'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 6, horizontal: 24),
          child: Column(
            children: [
              Text(
                'Please send us any feedback you have.',
                style: titleLeading.copyWith(
                    fontWeight: FontWeight.w300, color: Colors.black45),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 16,
              ),
              Card(
                color: Colors.grey.shade200,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200),
                  width: MediaQuery.of(context).size.width,
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    hint: Text('Categories'),
                    icon: const Icon(Icons.arrow_drop_down),
                    isExpanded: true,
                    elevation: 16,
                    // borderRadius: BorderRadius.circular(10),
                    style: const TextStyle(
                        fontSize: 18.0, color: coopPrimaryColor),
                    // underline: Container(
                    //   height: 2,
                    //   color: coopPrimaryColor,
                    // ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>[
                      'Category One',
                      'Category Two',
                      'Category Me',
                      'Category Four'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Card(
                  elevation: 10.0,
                  color: Colors.grey.shade200,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 56,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          " Feedback Section",
                          style: titleLeading.copyWith(color: Colors.black54),
                        ),
                      ),
                      TextField(
                        minLines: 8,
                        keyboardType: TextInputType.multiline,
                        style: TextStyle(fontSize: 16),
                        maxLines: null,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Type Something...",
                          hintStyle: labelhint,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(new Radius.circular(0.0)),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Send',
                          style: labelhint,
                        ),
                        style: ElevatedButton.styleFrom(
                            minimumSize:
                                Size(MediaQuery.of(context).size.width, 48)),
                      )
                    ],
                  )),
              SizedBox(
                height: 16,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(coopFeedback),
              ),
              SizedBox(
                height: 32,
              ),
              Divider(
                thickness: 1,
                color: coopMaterialColor.shade100,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Problem with COOP ATM or branch',
                style: labelhint.copyWith(color: Colors.black),
              ),
              SizedBox(
                height: 16,
              ),
              OutlinedButton(
                onPressed: () {
                  Get.to(ProblemPage());
                },
                style: OutlinedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width, 50)),
                child: Text('Let us know'),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                thickness: 1,
                color: coopMaterialColor.shade100,
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
