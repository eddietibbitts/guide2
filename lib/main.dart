import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/chat.dart';
import 'pages/profile.dart';
import 'pages/shopping.dart';
import 'pages/create_post.dart';
import 'package:guide2/models/global.dart';
import 'models/appbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appName = 'Guide.';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> pages = [
    HomePage(),
    ShoppingPage(),
    CreatePostPage(),
    ChatPage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 0,
      child: Scaffold(
        body: TabBarView(
          children: pages,
        ),
        bottomNavigationBar: Container(
          color: Colors.grey[800],
          // decoration: BoxDecoration(
          //   boxShadow: [
          //     BoxShadow(
          //       offset: Offset(10, 10)
          //     )
          //   ]
          // ),

          child: new TabBar(
            labelPadding: EdgeInsets.all(3),
            tabs: [
              Tab(
                icon: Icon(Icons.home, size: 33.0),
                //text: "Home",
              ),
              Tab(
                icon: Icon(Icons.shopping_cart, size: 33.0),
                //text: "Shop",
              ),
              Tab(
                icon: Icon(Icons.camera_alt, size: 33.0),
                //text: "Upload",
              ),
              Tab(
                icon: Icon(Icons.chat, size: 33.0),
                //text: "Chat",
              ),
              Tab(
                icon: Icon(Icons.person, size: 33.0),
                //text: "Profile",
              ),
            ],

            unselectedLabelColor: Colors.white,
            labelColor: Colors.deepOrange[300],
            indicatorColor: Colors.transparent,

          ),
        ),
      ),
    );
  }
}

// OLD VERSION




