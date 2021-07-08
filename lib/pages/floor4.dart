import 'package:flutter/material.dart';
import 'package:myapp/pages/floor3.dart';
import 'package:myapp/pages/servicescategories.dart';
import '2ndproj/firstpage.dart';
import 'guidance.dart';
import 'homepage.dart';

// ignore: camel_case_types
class floor4 extends StatefulWidget {
  const floor4({Key? key}) : super(key: key);

  @override
  _floor3State createState() => _floor3State();
}

// ignore: camel_case_types
class _floor3State extends State<floor4> {
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
            actions: [
              FlatButton(
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => floor3(),
                    ),
                  );
                  setState(() {});
                },
                child: Text(
                  "الطابق الثالث",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                shape:
                    CircleBorder(side: BorderSide(color: Colors.transparent)),
              ),
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
                shape:
                    CircleBorder(side: BorderSide(color: Colors.transparent)),
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
                shape:
                    CircleBorder(side: BorderSide(color: Colors.transparent)),
              ),
              FlatButton(
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => Servicespage(
                        title: 'الخدمات',
                      ),
                    ),
                  );
                  setState(() {});
                },
                child: Text("استعلامات الفواتير",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                shape:
                    CircleBorder(side: BorderSide(color: Colors.transparent)),
              ),
              FlatButton(
                shape:
                    CircleBorder(side: BorderSide(color: Colors.transparent)),
                child: Text('الصفحة الرئيسية',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(color: Colors.white, fontSize: 20)),
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
          backgroundColor: Colors.white,
          body: SizedBox(
              width: 1500,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.all(5)),
                        Image.asset(
                          "images/f4.jpg",
                          width: 1350,
                          height: 600,
                        ),
                      ],
                    )
                  ])),
        ));
  }
}
