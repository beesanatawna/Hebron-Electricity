import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/floor4.dart';

import 'billingpage.dart';
import 'floor3.dart';
import 'homepage.dart';
import 'servicescategories.dart';

class Guidance extends StatefulWidget {
  const Guidance({Key? key}) : super(key: key);

  @override
  _GuidanceState createState() => _GuidanceState();
}

class _GuidanceState extends State<Guidance> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'دليل الطوابق',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          centerTitle: true,
          elevation: 20.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          backgroundColor: Colors.indigo[800],
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
            FlatButton(
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
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
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/dalel-bg-01-01.png"),
              fit: BoxFit.fill,
            ),
          ),
          height: (MediaQuery.of(context).size.height),
          width: (MediaQuery.of(context).size.width),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.amber,
                margin: EdgeInsets.only(right: 100),
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    //contentPadding: EdgeInsets.fromLTRB(7, 5, 7, 5),
                    child: Text(
                      'الطابق الرابع',
                      style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      textDirection: TextDirection.rtl,
                    ),
                    onPressed: () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => floor4(),
                        ),
                      );
                      setState(() {});
                    },
                  ),
                ),
              ),
              Container(
                color: Colors.amber,
                margin: EdgeInsets.only(right: 100),
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    // contentPadding: EdgeInsets.fromLTRB(7, 5, 7, 5),
                    child: Text(
                      'الطابق الثالث ',
                      style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      textDirection: TextDirection.rtl,
                    ),
                    onPressed: () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => floor3(),
                        ),
                      );
                      setState(() {});
                    },
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 20.0,
          child: Text(
            'شركة كهرباء الخليل',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
          ),
          color: Colors.indigo[800],
        ),
      ),
    );
  }
}
