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
  final String servName;
  final int dalelServiceId;
  Subserv(this.servName, this.dalelServiceId);

  @override
  _SubservState createState() => _SubservState(servName, dalelServiceId);
}

class _SubservState extends State<Subserv> {
  String servName;
  int dalelServiceId;
  _SubservState(this.servName, this.dalelServiceId);

  void fetchSubServices() async {
    List<Subservices> subservices = [];
    http.Response response = await http.get(Uri.parse(
        'http://portal.hepco.ps:7654/api/dalel-service-cat?id=/$dalelServiceId'));

    if (response.statusCode == 200) {
      var jsonArray = jsonDecode(response.body) as List;

      for (int i = 0; i < jsonArray.length; i++) {
        Subservices s = Subservices.fromJson(jsonArray[i]);
        subservices.add(s);
        s.setServices(servName);
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
        body: SizedBox(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: subServices.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Container(
                              height: 80,
                              width: 450,
                              child: Card(
                                color: Colors.blue[200],
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 2,
                                      color: Colors.lightBlue.shade100),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                child: ListTile(
                                  leading: Text(
                                    subServices[index].desc,
                                    style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.start,
                                  ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(7, 5, 7, 5),
                                  title: Text(
                                    subServices[index].name,
                                    style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.start,
                                  ),
                                  // onTap: () {
                                  //   Navigator.push<void>(
                                  //     context,
                                  //     MaterialPageRoute<void>(
                                  //       builder: (BuildContext context) =>
                                  //           Subserv(),
                                  //     ),
                                  //   );
                                  //   setState(() {});
                                  // },
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
