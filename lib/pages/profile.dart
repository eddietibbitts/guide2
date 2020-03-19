import 'package:flutter/material.dart';
import 'package:guide2/main.dart';
import 'package:guide2/models/global.dart';
import 'package:guide2/models/post.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[800],
        title: Text(
          "Guide.",
          style: TextStyle(
            //fontWeight: FontWeight.bold,
            fontSize: 22.0,
            color: Colors.white,
          ),
        ),
      ),

      body: Container( //body between appbar and navbar
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              constraints: BoxConstraints.expand(height: MediaQuery.of(context).size.height- 148), //white gap between the navbar and the content above
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Container( //
                    margin: EdgeInsets.all(20),
                    height: 130, //gap between the content and the bio
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              height: 70,
                              width: 70,
                              child: CircleAvatar(backgroundImage: user.profilePicture,),
                            ),
                            Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(left: 68, right: 20), //posts, followers, following
                                      child: Column(
                                        children: <Widget>[
                                          Text('9', style: TextStyle(fontWeight: FontWeight.bold),),
                                          Text('posts')
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Column(
                                        children: <Widget>[
                                          Text('16K', style: TextStyle(fontWeight: FontWeight.bold),),
                                          Text('followers')
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: Column(
                                        children: <Widget>[
                                          Text('129', style: TextStyle(fontWeight: FontWeight.bold),),
                                          Text('following')
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(5)),
                                        color: Colors.deepOrange[300],
                                      ),
                                      margin: EdgeInsets.only(left: 25.0, right: 5.0),
                                      width: 120,
                                      height: 30,
                                      child: FlatButton(
                                        child: Text('Message',style: TextStyle(color: Colors.white),),
                                        onPressed: () {

                                        },
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      height: 30,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(5)),
                                          border: Border.all(width: 2, color: Color(0xFFE7E7E7))
                                      ),
                                      child: FlatButton(
                                        child: Text('Edit Profile'),
                                        onPressed: ()
                                        {
                                          Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                                          return new SecondScreen();}
                                          ));
                                        }
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(user.username, style: textStyleBold,),
                                Text("Welcome to my page where I share my best outfits."),

                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    color: Colors.white,
                  ),

                  Column(
                    children: getPosts(),
                  )
                ],
              ),
            )
          ],
        )
    ),
    );
  }


  //Logic for post display

  List<Widget> getPosts() {
    List<Widget> postRows = [];
    List<Widget> posts = [];
    int counter = 0;
    for (Post post in userPosts) {
      double marginLeft = 2;
      if (counter == 3) {
        marginLeft = 0;
      } else if (counter == 0) {
        marginLeft = 0;
      }
      posts.add(getPost(post, marginLeft));
      if (counter == 2) {
        postRows.add(Container(
          child: Row(
            children: posts,
          ),
        ));
        posts = [];
        counter = 0;
      } else {
        counter++;
      }
    }
    if (posts.length > 0) {
      postRows.add(Container(
        child: Row(
          children: posts,
        ),
      ));
    }
    return postRows;
  }

  Widget getPost(Post post, double margin) {
    return Container(
      margin: EdgeInsets.only(left: margin, bottom: 2),
      height: 125,
      width: 133,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: post.image,
              fit: BoxFit.fill
          )
      ),
    );
  }

}




class SecondScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey[800],
          title: Text(
            "Guide.",
            style: TextStyle(
              //fontWeight: FontWeight.bold,
              fontSize: 22.0,
              color: Colors.white,
            ),
          ),

        ),
        body: Center(






        ),
      );
    }
  }
