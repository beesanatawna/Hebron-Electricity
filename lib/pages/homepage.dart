import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/services.dart';
import 'package:myapp/pages/servicescategories.dart';
import 'package:http/http.dart' as http;
import '2ndproj/firstpage.dart';
import 'data.dart';
import 'guidance.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Services> services = [];
  void fetchServices() async {
    http.Response response = await http
        .get(Uri.parse('http://portal.hepco.ps:7654/api/dalel-services'));
    if (response.statusCode == 200) {
      var jsonArray = jsonDecode(response.body) as List;
      services = jsonArray.map((e) => Services.fromJson(e)).toList();
      mainServices = services;
    }
  }

  @override
  void initState() {
    super.initState();
    fetchServices();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //title: 'home page',
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Padding(padding: EdgeInsets.all(2)),
                Image.asset(
                  "images/logo2.png",
                  width: 300,
                  height: 300,
                )
              ]),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 40, 30, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Container(
                            color: Colors.blue[100],
                            height: 200,
                            width: 210,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 0, 70, 90),
                                  child: IconButton(
                                      // iconSize: 30,
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute<void>(
                                            builder: (BuildContext context) =>
                                                ServicesCategories(),
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.miscellaneous_services_rounded,
                                        size: 100,
                                      )),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            ServicesCategories(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'الخدمات',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                    textDirection: TextDirection.rtl,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Container(
                            color: Colors.green[100],
                            height: 200,
                            width: 210,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 0, 70, 90),
                                  child: IconButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute<void>(
                                            builder: (BuildContext context) =>
                                                Guidance(),
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.location_on_outlined,
                                        size: 100,
                                      )),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              Guidance(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "الدليل ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Container(
                            color: Colors.red[300],
                            height: 200,
                            width: 210,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 0, 70, 90),
                                  child: IconButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute<void>(
                                            builder: (BuildContext context) =>
                                                Servicespage(
                                              title: 'الخدمات',
                                            ),
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.query_stats_sharp,
                                        size: 100,
                                      )),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              Servicespage(
                                            title: 'الخدمات',
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "استعلامات الفواتير ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textDirection: TextDirection.rtl,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
