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
              image: AssetImage("images/guidance-background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SizedBox(
            child: Container(
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        contentPadding: EdgeInsets.fromLTRB(7, 5, 7, 5),
                        title: Text(
                          'الطابق الثالث',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                          textDirection: TextDirection.rtl,
                        ),
                        onTap: () {
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
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                        contentPadding: EdgeInsets.fromLTRB(7, 5, 7, 5),
                        title: Text(
                          'الطابق الرابع',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                          textDirection: TextDirection.rtl,
                        ),
                        onTap: () {
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
                  )
                ],
              ),
            ),
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
