import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertest/Shared/component/componentButton.dart';

class FlightsScreen extends StatefulWidget {
  @override
  _FlightsScreenState createState() => _FlightsScreenState();
}

class _FlightsScreenState extends State<FlightsScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 4,
                child: Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "From",
                              style: TextStyle(
                                  color: Color(0xff5B5B5B),
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              "To",
                              style: TextStyle(
                                  color: Color(0xff5B5B5B),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              "LON",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text("DXB",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              "London AirBort",
                              style: TextStyle(
                                  color: Color(0xff5B5B5B),
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              "Dubai AirBort",
                              style: TextStyle(
                                  color: Color(0xff5B5B5B),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ///////////// Text Plan ///////////
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2 - 45,
                              child: Text(
                                "- - - - - - - - - - - - - - - - ",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.airplanemode_on,
                                  textDirection: TextDirection.rtl,
                                  color: Color(0xffFE6078),
                                ),
                                onPressed: () {}),
                            Container(
                              width: MediaQuery.of(context).size.width / 2 - 45,
                              child: Text(
                                "- - - - - - - - - - - - - - - - ",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Date of departure",
                              style: TextStyle(
                                  color: Color(0xff5B5B5B),
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              "passenger  ",
                              style: TextStyle(
                                  color: Color(0xff5B5B5B),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),

                        //////// number of passenger and date ////////
                        Row(
                          children: [
                            Text(
                              "Thu,18 Oct 2021",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            ////// number ++ or ---///////
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      index > 0 ? index-- : index = 0;
                                    });
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "-",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "$index",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      index++;
                                    });
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "+",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        defaultButton(
                            width: MediaQuery.of(context).size.width,
                            background: Color(0xffFE6078),
                            text: "Search Flight",
                            function: () {}),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            //////////// Card 2 details Airport /////////
            listAirport(),
            listAirport(),
            listAirport(),
            listAirport(),
          ],
        ),
      ),
    );
  }

  Widget listAirport() => Padding(
        padding: const EdgeInsets.only(
          left: 8.0,
          right: 8,
        ),
        child: Card(
          elevation: 4,
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "London AirPort",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 110,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          "LON",
                                          style: TextStyle(color: Colors.grey),
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                          "DXB",
                                          style: TextStyle(color: Colors.grey),
                                        )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(flex: 1, child: Text("")),
                                    Expanded(
                                        flex: 2,
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 10,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                            ),
                                            Text(" - - - - - - "),
                                            Container(
                                              width: 10,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                            ),
                                          ],
                                        )),
                                    Expanded(flex: 1, child: Text("")),
                                  ],
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          "06:00 AM",
                                          style: TextStyle(color: Colors.grey),
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                          "12:20 AM",
                                          style: TextStyle(color: Colors.grey),
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          "RP 6000",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                          "16 Remain",
                                          style: TextStyle(
                                              color: Color(0xffFE5575)),
                                        )),
                                  ],
                                ),
                              ],
                            )),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Container(
                                height: 110,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          "https://www.emaratalyoum.com/polopoly_fs/1.1497302.1622667805!/image/image.jpg_gen/derivatives/rectangular_640/image.jpg",
                                        ),
                                        fit: BoxFit.fill)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Color(0xffFFF3F5),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          "Business Class",
                          style:
                              TextStyle(color: Color(0xffF96F84), fontSize: 12),
                        )),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        "2 Hour 18 Minute",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      defaultButton1(
                          width: MediaQuery.of(context).size.width / 4 - 10,
                          background: Color(0xffF96F84),
                          text: "Book",
                          function: () {}),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
