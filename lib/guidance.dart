import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/floor4.dart';
import '2ndproj/firstpage.dart';
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
        floatingActionButton: Container(
          height: 150,
          width: 150,
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.of(context).pop();
            },
            label: const Text(
              'الرجوع',
              textDirection: TextDirection.rtl,
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            backgroundColor: Colors.indigo,
          ),
        ),
        appBar: AppBar(
          //leadingWidth: 50,
          toolbarHeight: 90,
          centerTitle: true,
          title: Text('دليل الطوابق',
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: TextStyle(color: Colors.white, fontSize: 45)),
          elevation: 20.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
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
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            ),
            FlatButton(
              textColor: Colors.white,
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => Servicespage(),
                  ),
                );
                setState(() {});
              },
              child: Text("الفواتير",
                  style: TextStyle(color: Colors.white, fontSize: 30)),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            ),
            FlatButton(
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
              child: Text(' الرئيسية',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(color: Colors.white, fontSize: 30)),
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
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => floor4(),
                      ),
                    );
                    setState(() {});
                  },
                  child: Container(
                    height: 500,
                    width: 300,
                    color: Colors.amber,
                    margin: EdgeInsets.only(right: 200),
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 100,
                            child: Container(
                                alignment: Alignment.topCenter,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("images/icon1.png"),
                                    fit: BoxFit.contain,
                                  ),
                                )),
                          ),
                          Text(
                            'الطابق الرابع',
                            style: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.normal,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                            textDirection: TextDirection.rtl,
                          ),
                          Text(
                            ' المكاتب الادارية و شؤون الموطفين ',
                            style: TextStyle(
                              color: Colors.black,
                              fontStyle: FontStyle.normal,
                              fontSize: 20,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(16.0),
                              primary: Colors.white,
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            child: Text(
                              'اضغط للمزيد',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 20,
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
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => floor3(),
                      ),
                    );
                    setState(() {});
                  },
                  child: Container(
                    height: 500,
                    width: 300,
                    color: Colors.amber,
                    margin: EdgeInsets.only(right: 200),
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 100,
                            child: Container(
                                decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("images/icon2.png"),
                                fit: BoxFit.contain,
                              ),
                            )),
                          ),
                          Text(
                            'الطابق الثالث',
                            style: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.normal,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                            textDirection: TextDirection.rtl,
                          ),
                          Text(
                            ' خدمات الجمهور والفوترة وقسم تكنولوجيا المعلومات ',
                            style: TextStyle(
                              color: Colors.black,
                              fontStyle: FontStyle.normal,
                              fontSize: 20,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(16.0),
                              primary: Colors.white,
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            child: Text(
                              'اضغط للمزيد',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 20,
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
                        ],
                      ),
                    ),
                  ),
                )
              ],
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
