import 'package:flutter/material.dart';

import 'package:myapp/pages/services.dart';
import 'package:myapp/pages/subserv.dart';

import 'billingpage.dart';
import 'data.dart';

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
          centerTitle: true,
          title: Text('قسم الخدمات',
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
                                                Subserv(servicesMenu[index].id),
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
