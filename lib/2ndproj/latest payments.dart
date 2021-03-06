import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myapp/2ndproj/payinfo.dart';

class lastPays extends StatefulWidget {
  String nameA;
  List<Payinfo> payinfo1;
  lastPays(this.nameA, this.payinfo1);
  @override
  _lastPayState createState() => _lastPayState(this.nameA, this.payinfo1);
}

class _lastPayState extends State<lastPays> {
  String nameA0;
  List<Payinfo> payinfo2;

  _lastPayState(this.nameA0, this.payinfo2);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.0,
        backgroundColor: Colors.indigo[800],
        title: Text(
          "آخر الدفعات",
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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 25, 30, 0),
            child: Container(
              alignment: Alignment.topRight,
              child: Text(
                'المشترك',
                style: TextStyle(color: Colors.grey, fontSize: 30),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 3, 30, 0),
            child: Container(
              alignment: Alignment.topRight,
              child: Text(
                "${this.nameA0}",
                style: TextStyle(color: Colors.black, fontSize: 40),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(400, 40, 10, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 550,
                  child: Center(
                    child: Text(
                      "الدفعات ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  width: 350,
                  child: Center(
                    child: Text(
                      "التاريخ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: payinfo2.length,
              itemBuilder: (BuildContext context, int index) {
                return Lbillitem(info: payinfo2[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Lbillitem extends StatelessWidget {
  late final Payinfo info;
  Lbillitem({required this.info});
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Padding(
          padding: EdgeInsets.fromLTRB(400, 20, 0, 0),
          child: Container(
            width: 100,
            height: 30,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 550,
                  child: Center(
                    child: Text(
                      "${info.dt}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  width: 350,
                  child: Center(
                    child: Text(
                      "${info.amt}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
