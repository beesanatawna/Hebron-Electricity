import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:myapp/pages/Subservices.dart';
import 'package:myapp/pages/servicescategories.dart';
import '2ndproj/firstpage.dart';
import 'guidance.dart';
import 'homepage.dart';

class Subserv extends StatefulWidget {
  //final int dalelServiceId;
  List<Subservices> subServices = [];
  Subserv(this.subServices);

  @override
  _SubservState createState() => _SubservState(subServices);
}

class _SubservState extends State<Subserv> {
  List<Subservices> subServices = [];
  //int dalelServiceId;
  _SubservState(this.subServices);

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
        appBar: AppBar(
          centerTitle: true,
          title: Text(' الخدمات الفرعية',
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
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
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
                    builder: (BuildContext context) => Servicespage(
                      title: 'الخدمات',
                    ),
                  ),
                );
                setState(() {});
              },
              child: Text("استعلامات الفواتير",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            ),
            FlatButton(
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
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
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bg-dalel-01.png"),
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
                                    child: ListTile(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(7, 5, 7, 5),
                                      title: Text(
                                        subServices[index].name,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                        textDirection: TextDirection.rtl,
                                        textAlign: TextAlign.center,
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
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold),
                                              textDirection: TextDirection.rtl,
                                              textAlign: TextAlign.center,
                                            ),
                                            content: Html(
                                              data: subServices[index].desc,
                                              style: {
                                                'p': Style(
                                                  color: Colors.black87,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.bold,
                                                  textAlign: TextAlign.center,
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
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 30,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    textAlign: TextAlign.center,
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
