import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/services.dart';
import 'package:myapp/pages/servicescategories.dart';
import 'package:http/http.dart' as http;
import 'billingpage.dart';
import 'data.dart';
import 'guidance.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Services> services = [];
  void fetchServices() async {
    http.Response response = await http
        .get(Uri.parse('http://portal.hepco.ps:7654/api/dalel-services'));
    if (response.statusCode == 200) {
      var jsonArray = jsonDecode(response.body) as List;
      services = jsonArray.map((e) => Services.fromJson(e)).toList();
      mainServices = services;
    }
  }

  @override
  void initState() {
    super.initState();
    fetchServices();
  }

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     //title: 'home page',
    //     home: Scaffold(
    //       backgroundColor: Colors.white,
    //       body: Column(
    //         children: [
    //           Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    //             Padding(padding: EdgeInsets.all(3)),
    //             Image.asset(
    //               "images/logo2.png",
    //               width: 300,
    //               height: 300,
    //             )
    //           ]),
    //           Column(
    //             children: [
    //               Padding(
    //                 padding: EdgeInsets.fromLTRB(20, 40, 30, 0),
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: [
    //                     Padding(
    //                       padding: EdgeInsets.all(30.0),
    //                       child: Container(
    //                         color: Colors.blue[100],
    //                         height: 200,
    //                         width: 210,
    //                         child: Column(
    //                           mainAxisAlignment: MainAxisAlignment.center,
    //                           crossAxisAlignment: CrossAxisAlignment.center,
    //                           children: [
    //                             Container(
    //                               padding: EdgeInsets.fromLTRB(0, 0, 70, 100),
    //                               child: IconButton(
    //                                   onPressed: () {
    //                                     Navigator.of(context).push(
    //                                       MaterialPageRoute<void>(
    //                                         builder: (BuildContext context) =>
    //                                             ServicesCategories(),
    //                                       ),
    //                                     );
    //                                   },
    //                                   icon: Icon(
    //                                     Icons.miscellaneous_services_rounded,
    //                                     size: 100,
    //                                   )),
    //                             ),
    //                             Text(
    //                               'الخدمات',
    //                               style: TextStyle(
    //                                   fontStyle: FontStyle.normal,
    //                                   fontSize: 30,
    //                                   fontWeight: FontWeight.bold),
    //                               textDirection: TextDirection.rtl,
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                     Padding(
    //                       padding: EdgeInsets.all(30.0),
    //                       child: Container(
    //                         color: Colors.green[100],
    //                         height: 200,
    //                         width: 210,
    //                         child: Column(
    //                           mainAxisAlignment: MainAxisAlignment.center,
    //                           crossAxisAlignment: CrossAxisAlignment.center,
    //                           children: [
    //                             Container(
    //                               padding: EdgeInsets.fromLTRB(0, 0, 70, 100),
    //                               child: IconButton(
    //                                   onPressed: () {
    //                                     Navigator.of(context).push(
    //                                       MaterialPageRoute<void>(
    //                                         builder: (BuildContext context) =>
    //                                             Guidance(),
    //                                       ),
    //                                     );
    //                                   },
    //                                   icon: Icon(
    //                                     Icons.location_on_outlined,
    //                                     size: 100,
    //                                   )),
    //                             ),
    //                             Text(
    //                               "الدليل ",
    //                               style: TextStyle(
    //                                   fontStyle: FontStyle.normal,
    //                                   fontSize: 30,
    //                                   fontWeight: FontWeight.bold),
    //                             )
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                     Padding(
    //                       padding: EdgeInsets.all(30.0),
    //                       child: Container(
    //                         color: Colors.red[300],
    //                         height: 200,
    //                         width: 210,
    //                         child: Column(
    //                           mainAxisAlignment: MainAxisAlignment.center,
    //                           crossAxisAlignment: CrossAxisAlignment.center,
    //                           children: [
    //                             Container(
    //                               padding: EdgeInsets.fromLTRB(0, 0, 70, 100),
    //                               child: IconButton(
    //                                   onPressed: () {},
    //                                   icon: Icon(
    //                                     Icons.query_stats_sharp,
    //                                     size: 100,
    //                                   )),
    //                             ),
    //                             Text(
    //                               "استعلامات الفواتير ",
    //                               style: TextStyle(
    //                                 fontStyle: FontStyle.normal,
    //                                 fontSize: 30,
    //                                 fontWeight: FontWeight.bold,
    //                               ),
    //                               textDirection: TextDirection.rtl,
    //                             )
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'home page',
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          width: 1500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.all(5)),
                  Image.asset(
                    "images/logo2.png",
                    width: 250,
                    height: 250,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(1, 1, 1, 1),
                height: 80,
                width: 450,
                padding: EdgeInsets.all(3),
                child: Container(
                  child: Card(
                    color: Colors.blue[100],
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 2, color: Colors.lightBlue.shade100),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.fromLTRB(7, 5, 7, 5),
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue[100],
                        child: Image.asset(
                          "images/sponsorship.png",
                          color: Colors.black,
                          cacheWidth: 50,
                          width: 50,
                          height: 50,
                        ),
                      ),
                      title: Text(
                        'الخدمات',
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        textDirection: TextDirection.rtl,
                      ),
                      onTap: () {
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                ServicesCategories(),
                          ),
                        );
                        setState(() {});
                      },
                    ),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(5, 5, 7, 5),
                  height: 80,
                  width: 450,
                  padding: EdgeInsets.all(3),
                  child: Container(
                    child: Card(
                      color: Colors.green[100],
                      shape: RoundedRectangleBorder(
                        side:
                            BorderSide(width: 2, color: Colors.green.shade100),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.fromLTRB(7, 5, 7, 5),
                        leading: CircleAvatar(
                          backgroundColor: Colors.green[100],
                          child: Image.asset(
                            "images/guidance.png",
                            width: 50,
                            height: 50,
                            cacheWidth: 50,
                            color: Colors.black,
                          ),
                        ),
                        title: Text(
                          'الدليل',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                          textDirection: TextDirection.rtl,
                        ),
                        onTap: () {
                          Navigator.push<void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => Guidance(),
                            ),
                          );
                        },
                      ),
                    ),
                  )),
              Container(
                margin: EdgeInsets.fromLTRB(1, 1, 1, 1),
                height: 80,
                width: 450,
                padding: EdgeInsets.all(3),
                child: Container(
                  child: Card(
                    color: Colors.red[300],
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 2, color: Colors.red.shade50),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.fromLTRB(7, 5, 7, 5),
                      leading: CircleAvatar(
                        backgroundColor: Colors.red[300],
                        child: Image.asset(
                          "images/bill.png",
                          width: 50,
                          height: 50,
                          cacheWidth: 50,
                          color: Colors.black,
                        ),
                      ),
                      title: Text(
                        'استعلامات الفواتير',
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        textDirection: TextDirection.rtl,
                      ),
                      onTap: () {
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => BillingPage(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
