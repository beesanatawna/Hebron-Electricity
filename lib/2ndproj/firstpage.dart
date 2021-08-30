import 'package:flutter/material.dart';
import '../guidance.dart';
import '../homepage.dart';
import 'Personinfo.dart';
import 'loding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quesies Website',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Servicespage(),
    );
  }
}

class Servicespage extends StatefulWidget {
  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Servicespage> {
  late TextEditingController controllerr;

  void initState() {
    super.initState();
    controllerr = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          //leadingWidth: 50,
          toolbarHeight: 90,
          centerTitle: true,
          title: Text('  الاستفسار',
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
              child: Text('الرئيسية',
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
        body: Center(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  width: 1300,
                  height: 280,
                ),
                Text("رقم الخدمة",
                    style: (TextStyle(
                      color: Colors.black,
                      fontSize: 50,
                    ))),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 400,
                  height: 60,
                  child: TextField(
                    enableInteractiveSelection: false,
                    textAlign: TextAlign.right,
                    controller: controllerr,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'ادخل رقم الخدمة',
                      alignLabelWithHint: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    if (controllerr.text != '') {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              Loading(controllerr.text),
                        ),
                      );
                    }
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: Container(
                        width: 400,
                        height: 60,
                        color: Colors.indigo[800],
                        child: Center(
                          child: Text(
                            "دخول",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

Future<Personinfo>? _futureNo;

FutureBuilder<Personinfo> buildFutureBuilder() {
  return FutureBuilder<Personinfo>(
    future: _futureNo,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Text(snapshot.data!.agreementId);
      } else if (snapshot.hasError) {
        return Text('${snapshot.error}');
      }
      return CircularProgressIndicator();
    },
  );
}
