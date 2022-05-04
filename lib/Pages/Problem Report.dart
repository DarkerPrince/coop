import 'package:coop/Constants/constants.dart';
import 'package:flutter/material.dart';

class ProblemPage extends StatefulWidget {
  @override
  _ProblemPageState createState() => _ProblemPageState();
}

class _ProblemPageState extends State<ProblemPage> {
  String dropdownValue = 'Branch';
  String locationBranch = '22 Megenagna';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback Page'),
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
            Text(
              'Report a problem with COOP ATMor Branch',
              style: titleLeading,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 8,
            ),
            Card(
              color: Colors.grey.shade200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('Problem Categories'),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
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
                          'Branch',
                          'ATM',
                          'Mobile Banking',
                          'Mobile App'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Card(
              color: Colors.grey.shade200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Categories'),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200),
                      width: MediaQuery.of(context).size.width,
                      child: DropdownButton<String>(
                        value: locationBranch,
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
                            locationBranch = newValue!;
                          });
                        },
                        items: <String>['22 Megenagna', 'Mexico', 'Bole', 'CMC']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16,
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
                        " Any Problems?",
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
          ],
        ),
      ),
    );
  }
}
