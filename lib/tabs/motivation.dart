import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:loading/indicator/ball_scale_multiple_indicator.dart';
import 'package:loading/loading.dart';

void main() {
  runApp(MaterialApp(

      // Title
      title: "Using Tabs",
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
                return Loading(
                  indicator: BallScaleMultipleIndicator(),
                  size: 100.0,
                  color: Colors.purpleAccent,
                );

              return Text(snapshot.data.documents[0]['motivasyonsozu'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Colors.purpleAccent,
                      fontFamily: 'Comfortaa'));
            },
          ),
        ),
      ),
    );
  }
}
