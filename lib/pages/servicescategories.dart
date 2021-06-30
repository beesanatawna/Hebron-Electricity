import 'package:flutter/material.dart';
import 'package:myapp/pages/services.dart';
import 'package:myapp/pages/subserv.dart';

import 'billingpage.dart';
import 'data.dart';
import 'data2.dart';
import 'guidance.dart';
import 'homepage.dart';

class ServicesCategories extends StatefulWidget {
  @override
  _ServicesCategoriesState createState() => _ServicesCategoriesState();
}

class _ServicesCategoriesState extends State<ServicesCategories> {
  List<Services> servicesMenu = [];

  @override
  void initState() {
    super.initState();
    servicesMenu = mainServices;
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
            // FlatButton(
            //   textColor: Colors.white,
            //   onPressed: () {
            //     Navigator.push<void>(
            //       context,
            //       MaterialPageRoute<void>(
            //         builder: (BuildContext context) => ServicesCategories(),
            //       ),
            //     );
            //     setState(() {});
            //   },
            //   child: Text(
            //     "الخدمات",
            //     style: TextStyle(color: Colors.white, fontSize: 20),
            //   ),
            //   shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            // ),
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
                          itemCount: servicesMenu.length,
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
                                        servicesMenu[index].name,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                        textDirection: TextDirection.rtl,
                                        textAlign: TextAlign.center,
                                      ),
                                      onTap: () {
                                        Navigator.push<void>(
                                          context,
                                          MaterialPageRoute<void>(
                                            builder: (BuildContext context) =>
                                                Subserv(
                                                    servicesMenu[index].name,
                                                    servicesMenu[index].id),
                                          ),
                                        );
                                        setState(() {});
                                      },
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
}

//  IconButton(
//                   icon: Icon(Icons.home),
//                   onPressed: () {
//                     Navigator.pop(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => HomePage(),
//                         ));
//                     setState(() {});
//                   },
//                 ),
