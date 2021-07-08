import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Personinfo.dart';
import 'loding.dart';

class Servicespage extends StatefulWidget {
  Servicespage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Servicespage> {
  late TextEditingController _controller;

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo[800],
          title: Text("الخدمات",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              )),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Container(
          child: Column(
            children: [
              SizedBox(
                width: 1300,
                height: 150,
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
                width: 300,
                height: 50,
                child: TextField(
                  enableInteractiveSelection: false,
                  textAlign: TextAlign.right,
                  controller: _controller,
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
              Container(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  child: Text(
                    "دخول",
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            Loading(_controller.text),
                      ),
                    );
                  },
                ),
              ),
            ],
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
