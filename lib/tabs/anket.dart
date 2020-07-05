import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp(MaterialApp(

      // Title
      title: "Using Tabs",
      // Home
      home: Anket()));
}

class Anket extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'flutter_linkify example',
      home:  Scaffold(
            body: Center(
              child: RaisedButton(onPressed: _launchURL,
              child:  Text(('Görüşlerinizi bildirmek için tıklayınız...'),
              ),
              ),
            ),
      ),
    );
  }

  _launchURL() async{
    const url = "https://docs.google.com/forms/d/e/1FAIpQLScdaHSzAmp0KOfV0stwpRTTeZvBDmNUWvC0L2wrdmRVL9bekA/viewform?usp=sf_link";
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw "Could not launch $url";
    }
  }
}


