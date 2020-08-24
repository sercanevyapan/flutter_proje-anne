import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() {
  runApp(MaterialApp(

      // Home
      home: Motivation()));
}

class Motivation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MotivationState();
}

class MotivationState extends State<Motivation> {
  String title = "Title";
  String helper = "helper";

  //Firebase messaging
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();

    _firebaseMessaging.configure(
      onMessage: (message) async {
        setState(() {
          title = message["notification"]["title"];
          helper = "Mesajınız var";
        });
      },
      onResume: (message) async {
        setState(() {
          title = message["data"]["title"];
          helper = "Mesaj bildirimlerden açıldı";
        });
      },
      onLaunch: (message) async {
        setState(() {
          title = message["data"]["title"];
          helper = "Mesaj bildirimlerden açıldı";
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: Center(
          child: StreamBuilder(
            stream: Firestore.instance.collection('motivation').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Text('Yükleniyor..',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.purpleAccent,
                    ));

              return Card(
                margin: EdgeInsets.all(16.0),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(snapshot.data.documents[0]['motivasyonsozu'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          color: Colors.purpleAccent,
                          fontFamily: 'Comfortaa')),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
