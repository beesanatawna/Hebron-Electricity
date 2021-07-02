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
            ],
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 30, 0),
                child: Container(
                  alignment: Alignment.topRight,
                  child: Text(
                    'العميل',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 3, 30, 0),
                child: Container(
                  alignment: Alignment.topRight,
                  child: Text(
                    'رؤى الشريف',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40, 100, 30, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Container(
                        color: Colors.blue[100],
                        height: 200,
                        width: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 70, 100),
                              // child: IconButton(
                              //     onPressed: () {
                              //       Navigator.of(context).push(
                              //         MaterialPageRoute<void>(
                              //           builder: (BuildContext context) =>
                              //               installments(bbills),
                              //         ),
                              //       );
                              //     },
                              //     icon: Icon(
                              //       Icons.feed_rounded,
                              //       size: 100,
                              //     )),
                            ),
                            Text(
                              "آخر الفواتير",
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Container(
                        color: Colors.purple[100],
                        height: 200,
                        width: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 70, 100),
                              // child: IconButton(
                              //     // onPressed: () {
                              //     //   Navigator.of(context).push(
                              //     //     MaterialPageRoute<void>(
                              //     //       builder: (BuildContext context) =>
                              //     //           lastPays(),
                              //     //     ),
                              //     //   );
                              //     // },
                              //     icon: Icon(
                              //       Icons.price_check_sharp,
                              //       size: 100,
                              //     )),
                            ),
                            Text(
                              "آخر الدفعات",
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Container(
                        color: Colors.green[200],
                        height: 200,
                        width: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 70, 100),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.monetization_on_sharp,
                                    size: 100,
                                  )),
                            ),
                            Text(
                              "الأقساط ",
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Container(
                        color: Colors.pink[100],
                        height: 200,
                        width: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 70, 100),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.account_box,
                                    size: 100,
                                  )),
                            ),
                            Text(
                              "بياناتي",
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
