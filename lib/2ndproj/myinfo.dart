import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class myInfo extends StatefulWidget {
  String agreementId;
  String nameA;
  String addressa;
  myInfo(this.agreementId, this.nameA, this.addressa);
  @override
  _myInfoState createState() =>
      _myInfoState(this.agreementId, this.nameA, this.addressa);
}

class _myInfoState extends State<myInfo> {
  String agreementId0;
  String nameA0;
  String addressa0;
  _myInfoState(this.agreementId0, this.nameA0, this.addressa0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.0,
        backgroundColor: Colors.indigo[800],
        title: Text(
          "المعلومات الشخصية",
          style: TextStyle(color: Colors.white, fontSize: 40.0),
        ),
        centerTitle: true,
        leading: Center(
          child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "الرجوع ",
                style: TextStyle(fontSize: 20),
              )),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Container(
                  height: 55,
                  width: 400,
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      "${this.nameA0}",
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Container(
                  height: 55,
                  width: 400,
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      "${this.agreementId0}",
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Container(
                  width: 400,
                  color: Colors.white,
                  child: Center(
                    child: Center(
                      child: Text(
                        "${this.addressa0}",
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
