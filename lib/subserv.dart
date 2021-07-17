import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:myapp/Subservices.dart';
import '2ndproj/firstpage.dart';
import 'guidance.dart';
import 'homepage.dart';

class Subserv extends StatefulWidget {
  //final int dalelServiceId;
  List<Subservices> subServices = [];
  final String tittle;
  Subserv(this.subServices, this.tittle);

  @override
  _SubservState createState() => _SubservState(subServices, this.tittle);
}

class _SubservState extends State<Subserv> {
  List<Subservices> subServices = [];
  final tittle;
  //int dalelServiceId;
  _SubservState(this.subServices, this.tittle);

  @override
  void initState() {
    super.initState();
    //fetchSubServices();
  }

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
            backgroundColor: Colors.orangeAccent,
          ),
        ),
        appBar: AppBar(
          toolbarHeight: 90,
          centerTitle: true,
          title: Text('الخدمات الفرعية',
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
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            ),
            // ignore: deprecated_member_use
            FlatButton(
              // padding: EdgeInsets.all(4),
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
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            ),
            // ignore: deprecated_member_use
            FlatButton(
              // padding: EdgeInsets.all(4),
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
              image: AssetImage("images/bg-dalel-01.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            child: SizedBox(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Expanded(
                        child: ListView.builder(
                            padding: EdgeInsets.all(30.0),
                            itemCount: subServices.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 500,
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
                                      child: Center(
                                        child: ListTile(
                                          contentPadding:
                                              EdgeInsets.fromLTRB(7, 5, 7, 5),
                                          title: Center(
                                            child: Text(
                                              subServices[index].name,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold),
                                              textDirection: TextDirection.rtl,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          onTap: () {
                                            showDialog<String>(
                                              // useSafeArea: true,

                                              context: context,
                                              builder: (BuildContext context) =>
                                                  AlertDialog(
                                                scrollable: true,
                                                backgroundColor:
                                                    Colors.blueGrey[50],
                                                shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        width: 5,
                                                        color: Colors
                                                            .indigo.shade800)),
                                                title: new Text(
                                                  "وصف الخدمة",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  textAlign: TextAlign.center,
                                                ),
                                                content: Html(
                                                  data: subServices[index].desc,
                                                  style: {
                                                    'p': Style(
                                                      color: Colors.black87,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  },
                                                ),
                                                actions: <Widget>[
                                                  Center(
                                                    child: TextButton(
                                                      autofocus: true,
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context, 'اغلاق'),
                                                      child: const Text(
                                                        'اغلاق',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 30,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        textDirection:
                                                            TextDirection.rtl,
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
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
