import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/Subservices.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/pages/servicescategories.dart';

import 'billingpage.dart';
import 'data2.dart';
import 'guidance.dart';
import 'homepage.dart';

class Subserv extends StatefulWidget {
  final int dalelServiceId;
  Subserv(this.dalelServiceId);

  @override
  _SubservState createState() => _SubservState(dalelServiceId);
}

class _SubservState extends State<Subserv> {
  int dalelServiceId;
  _SubservState(this.dalelServiceId);

  void fetchSubServices() async {
    List<Subservices> subservices = [];
    http.Response response = await http.get(Uri.parse(
        'http://portal.hepco.ps:7654/api/dalel-service-cat?id=$dalelServiceId'));

    if (response.statusCode == 200) {
      var jsonArray = jsonDecode(response.body) as List;

      for (int i = 0; i < jsonArray.length; i++) {
        Subservices s = Subservices.fromJson(jsonArray[i]);
        subservices.add(s);
      }
      subServices = subservices;
    }
  }

  @override
  void initState() {
    super.initState();
    fetchSubServices();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(' الخدمات الفرعية',
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: TextStyle(color: Colors.white, fontSize: 30)),
          elevation: 20.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          backgroundColor: Colors.indigo[800],
          leading: TextButton(
            child: Text('الصفحة الرئيسية',
                textDirection: TextDirection.rtl,
                style: TextStyle(color: Colors.white, fontSize: 18)),
            onPressed: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => HomePage(),
                ),
              );
              setState(() {});
            },
          ),
          actions: [
            // ignore: deprecated_member_use
            FlatButton(
              textColor: Colors.white,
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => ServicesCategories(),
                  ),
                );
                setState(() {});
              },
              child: Text(
                "الخدمات",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            ),
            // ignore: deprecated_member_use
            FlatButton(
              textColor: Colors.white,
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => Guidance(),
                  ),
                );
                setState(() {});
              },
              child: Text("الدليل",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            ),
            // ignore: deprecated_member_use
            FlatButton(
              textColor: Colors.white,
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => BillingPage(),
                  ),
                );
                setState(() {});
              },
              child: Text("استعلامات الفواتير",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SizedBox(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Expanded(
                      child: ListView.builder(
                          padding: EdgeInsets.all(30.0),
                          itemCount: subServices.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Container(
                                  height: 80,
                                  width: 450,
                                  child: Card(
                                    color: Colors.indigo[800],
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 2,
                                          color: Colors.indigo.shade100),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                    child: ListTile(
                                      leading: Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      contentPadding:
                                          EdgeInsets.fromLTRB(7, 5, 7, 5),
                                      title: Text(
                                        subServices[index].name,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                        textDirection: TextDirection.rtl,
                                        textAlign: TextAlign.center,
                                      ),
                                      onTap: () {},
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  // showMaterialDialog() {
  //   showDialog(
  //       context: context,
  //       barrierDismissible: true,
  //       // set to false if you want to force a rating
  //       builder: (context) {
  //         return DescriptiongDialog(
  //           icon: const Icon(Icons.star, size: 100, color: Colors.deepOrange),
  //           // set your own image/icon widget
  //           title: subServices.name,
  //           description: "Tap a star to set your rating",
  //           submitButton: "Close",
  //           accentColor: Colors.orangeAccent,
  //           // optional

  //         );
  //       });
  // }
}
