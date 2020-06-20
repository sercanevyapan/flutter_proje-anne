import 'package:animated_splash/animated_splash.dart';
import 'package:flutter/material.dart';
import 'package:proje_anne/tabs/motivation.dart';
import 'package:proje_anne/tabs/videolist.dart';

void main() {
  runApp(MaterialApp(
    // Title
    title: "Using Tabs",

    home: AnimatedSplash(
      imagePath: 'assets/logoapp.png',
      home: MyHome(),
      duration: 3000,
      type: AnimatedSplashType.StaticDuration,
    ),
    // Home
  ));
}

class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => MyHomeState();
}

// SingleTickerProviderStateMixin is used for animation
class MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  // Create a tab controller
  TabController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
        // Title
        title: Text("Emzirme Desteği"),
        // Set the background color of the App Bar
        backgroundColor: Colors.purple[300],
      ),
      // Set the TabBar view as the body of the Scaffold
      body: TabBarView(
        // Add tabs as widgets
        children: <Widget>[Motivation(), VideoList()],
        // set the controller
        controller: controller,
      ),
      // Set the bottom navigation bar
      bottomNavigationBar: Material(
        
        // set the color of the bottom navigation bar
        color: Colors.purple,
        // set the tab bar as the child of bottom navigation bar
        child: TabBar(
          indicatorColor: Colors.white,
          tabs: <Tab>[
            Tab(
              // set icon to the tab
              icon: Icon(Icons.format_quote),
              text: "Motivasyon Sözü",
            ),
            Tab(icon: Icon(Icons.video_library), text: "Videolar"),
          ],
          // setup the controller
          controller: controller,
        ),
      ),
    );
  }
}
