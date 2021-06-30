import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/floor3.dart';
import 'package:myapp/pages/homepage.dart';
import 'package:myapp/pages/servicescategories.dart';

import 'billingpage.dart';
import 'floor4.dart';

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
            // FlatButton(
            //   textColor: Colors.white,
            //   onPressed: () {
            //     Navigator.push<void>(
            //       context,
            //       MaterialPageRoute<void>(
            //         builder: (BuildContext context) => Guidance(),
            //       ),
            //     );
            //     setState(() {});
            //   },
              //   child: Text("الدليل",
              //       style: TextStyle(color: Colors.white, fontSize: 20)),
              //   shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
              // ),
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
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  child: InkWell(
                    child: Text(' الطابق الرابع'),
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
                Card(
                    child: InkWell(
                  child: Text('الطابق الثالث'),
                   onTap: () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => floor3(),
                        ),
                      );
                      setState(() {});
                    },
                )
                )
              ]),
        ),
      ),
    );

    // return Container(
    //     child: Text'),
    // TextButton(
    // onPressed: () {
    //   Navigator.pop(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => HomePage(),
    //     ),
    //   );
    // },
    // child: Text("NAVIGATE")
    // )
    // );
  }
}
