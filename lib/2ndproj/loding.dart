import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Personinfo.dart';

import 'firstpage.dart';
import 'mainPage.dart';

class Loading extends StatefulWidget {
  final agreementId;
  Loading(this.agreementId) {
    print("kej");
    print(this.agreementId);
    print("kej");
  }
  @override
  _LoadingState createState() => _LoadingState(this.agreementId);
}

class _LoadingState extends State<Loading> {
  final agreementId0;
  _LoadingState(this.agreementId0);

  late List<Personinfo> clintInfo = [];
  void fetchRest() async {
    print(1111111111111);
    print(this.agreementId0);
    print(1111111111111);
    http.Response response = await http.get(Uri.parse(
        'http://api.hepco.ps:8084/integration/login-service.php?id=${this.agreementId0}&fun=logins'));

    if (response.statusCode == 200) {
      var jsonArray = jsonDecode(response.body) as List;
      print(jsonArray);
      if (jsonArray.length != 0) {
        clintInfo =
            jsonArray.map((element) => Personinfo.fromJson(element)).toList();

        Navigator.of(context).pushReplacement(
          MaterialPageRoute<void>(
            builder: (BuildContext context) => MyHomePage(
                clintInfo[0].agreementId,
                clintInfo[0].nameA,
                clintInfo[0].addressa),
          ),
        );
      } else {
        showDialog<String>(
          // useSafeArea: true,

          context: context,
          builder: (BuildContext context) => AlertDialog(
            scrollable: true,
            backgroundColor: Colors.blueGrey[50],
            shape: RoundedRectangleBorder(
                side: BorderSide(width: 5, color: Colors.indigo.shade800)),
            title: new Text(
              "وصف الخدمة",
              style: TextStyle(
                  color: Colors.indigo,
                  fontStyle: FontStyle.normal,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ),
            content: Text(
              'الرقم خاطئ يرجى اعادة المحاولة',
              style: TextStyle(
                  color: Colors.indigo[800],
                  fontStyle: FontStyle.normal,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              Center(
                child: TextButton(
                  autofocus: true,
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => Servicespage(),
                      ),
                    );
                  },
                  child: const Text(
                    'اغلاق',
                    style: TextStyle(
                        color: Colors.indigo,
                        fontStyle: FontStyle.normal,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    fetchRest();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    );
  }
}
