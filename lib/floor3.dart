import 'package:flutter/material.dart';
import 'package:myapp/floor4.dart';
import 'package:myapp/servicescategories.dart';
import '2ndproj/firstpage.dart';
import 'guidance.dart';
import 'homepage.dart';

// ignore: camel_case_types
class floor3 extends StatefulWidget {
  const floor3({Key? key}) : super(key: key);

  @override
  _floor3State createState() => _floor3State();
}

// ignore: camel_case_types
class _floor3State extends State<floor3> {
  double _scaleFactor = 1.0;
  double _baseScaleFactor = 1.0;
  double _scale = 1.0;
  late double _previousScale;
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
              title: Text('الطابق الثالث',
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
                FlatButton(
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => floor4(),
                      ),
                    );
                    setState(() {});
                  },
                  child: Text(
                    "الطابق الرابع",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  shape:
                      CircleBorder(side: BorderSide(color: Colors.transparent)),
                ),
                FlatButton(
                  // padding: EdgeInsets.all(4),
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
                      style: TextStyle(color: Colors.white, fontSize: 30)),
                  shape:
                      CircleBorder(side: BorderSide(color: Colors.transparent)),
                ),
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
                  shape:
                      CircleBorder(side: BorderSide(color: Colors.transparent)),
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
                  child: Text(" الفواتير",
                      style: TextStyle(color: Colors.white, fontSize: 30)),
                  shape:
                      CircleBorder(side: BorderSide(color: Colors.transparent)),
                ),

                FlatButton(
                  shape:
                      CircleBorder(side: BorderSide(color: Colors.transparent)),
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
            backgroundColor: Colors.white,
            body: GestureDetector(
              onScaleStart: (details) {
                _baseScaleFactor = _scaleFactor;
              },
              onScaleUpdate: (details) {
                setState(() {
                  _scaleFactor = _baseScaleFactor * details.scale;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/f3.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            )));
  }
}
