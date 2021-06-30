import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/homepage.dart';
import 'package:myapp/pages/servicescategories.dart';

import 'guidance.dart';

class BillingPage extends StatefulWidget {
  const BillingPage({Key? key}) : super(key: key);

  @override
  _BillingPageState createState() => _BillingPageState();
}

class _BillingPageState extends State<BillingPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'home page',
      home: Scaffold(
        backgroundColor: Colors.white,
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
            //   FlatButton(
            //     textColor: Colors.white,
            //     onPressed: () {
            //       Navigator.push<void>(
            //         context,
            //         MaterialPageRoute<void>(
            //           builder: (BuildContext context) => BillingPage(),
            //         ),
            //       );
            //       setState(() {});
            //     },
            //   child: Text("استعلامات الفواتير",
            //       style: TextStyle(color: Colors.white, fontSize: 20)),
            //   shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            // ),
          ],
        ),
      )
    );
  }
}
