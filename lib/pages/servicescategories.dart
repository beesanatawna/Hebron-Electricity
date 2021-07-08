import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/pages/services.dart';
import 'package:myapp/pages/subserv.dart';
import '2ndproj/firstpage.dart';
import 'Subservices.dart';
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
            // ignore: deprecated_member_use
            FlatButton(
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
              child: Text('الصفحة الرئيسية',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(color: Colors.white, fontSize: 20)),
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
              image: AssetImage("images/test-01.png"),
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
                                        onTap: () async {
                                          List<Subservices> subservices = [];
                                          String number =
                                              servicesMenu[index].id.toString();
                                          http.Response response =
                                              await http.get(Uri.parse(
                                                  'http://portal.hepco.ps:7654/api/dalel-service-cat?id=$number'));

                                          if (response.statusCode == 200) {
                                            var jsonArray =
                                                jsonDecode(response.body)
                                                    as List;
                                            for (int i = 0;
                                                i < jsonArray.length;
                                                i++) {
                                              Subservices s =
                                                  Subservices.fromJson(
                                                      jsonArray[i]);
                                              subservices.add(s);
                                            }
                                          }

                                          Navigator.push<void>(
                                            context,
                                            MaterialPageRoute<void>(
                                              builder: (BuildContext context) =>
                                                  Subserv(subservices),
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
