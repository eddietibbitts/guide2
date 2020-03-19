import 'package:flutter/material.dart';
import 'user.dart';
import 'post.dart';
import 'comment.dart';
import 'appbar.dart';


TextStyle textStyle = new TextStyle(fontFamily: 'Gotham');
TextStyle textStyleBold = new TextStyle(fontFamily: 'Gotham', fontWeight: FontWeight.bold, color: Colors.black);
TextStyle textStyleLightGrey = new TextStyle(fontFamily: 'Gotham', color: Colors.grey[800]);


Post post1 = new Post(new AssetImage('lib/assets/photo_1.jpeg'), user, "My first post", DateTime.now(), [follower1, follower2, follower3], [], false, false);
final User user = new User('eddietibbitts', AssetImage('lib/assets/my_profile.jpg'), [
  follower1,
  follower2,
  follower3
], [
  follower1,
  follower2,
  follower3,
  follower4,
  follower5,
  follower6
], [], [], false);
User follower1 = new User('joe_bloggs', AssetImage('lib/assets/follower3.jpeg'), [], [], [], [], true);
User follower2 = new User('johnsmith', AssetImage('lib/assets/follower2.jpg'), [], [], [], [], false);
User follower3 = new User('david_beckham', AssetImage('lib/assets/their_profile.jpeg'), [], [], [], [], true);
User follower4 = new User('hugoboss', AssetImage('lib/assets/profile3.png'), [], [], [], [], true);
User follower5 = new User('katemoss', AssetImage('lib/assets/profile6.jpg'), [], [], [], [], true);
User follower6 = new User('lady_gaga', AssetImage('lib/assets/profile4.png'), [], [], [], [], false);
List<Post> userPosts = [
  new Post(new AssetImage('lib/assets/photo_1.jpeg'), user, "My first post", DateTime.now(), [follower1, follower2, follower3, follower4, follower5, follower6], [
    new Comment(follower1, "Wow!", DateTime.now(), false),
    new Comment(follower2, "Nice one", DateTime.now(), false),
    new Comment(follower4, "Looking good", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('lib/assets/post2.jpg'), follower1, "Check this!", DateTime.now(), [user, follower2, follower3, follower4, follower5], [
    new Comment(follower3, "This is awesome!", DateTime.now(), false),
    new Comment(follower1, "Who took this? Great shot.", DateTime.now(), false),
    new Comment(user, "My friend. Thank you!", DateTime.now(), false),
    new Comment(follower5, "Inspirational!", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('lib/assets/profile6.jpg'), follower1, "This is such a great post though", DateTime.now(), [user, follower2, follower3, follower4, follower5], [
    new Comment(follower3, "This is awesome!", DateTime.now(), false),
    new Comment(follower1, "Who took this? Great shot.", DateTime.now(), false),
    new Comment(user, "My friend. Thank you!", DateTime.now(), false),
    new Comment(follower5, "Inspirational!", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('lib/assets/photo5.jpg'), follower1, "This is such a great post though", DateTime.now(), [user, follower2, follower3, follower4, follower5], [
    new Comment(follower3, "This is awesome!", DateTime.now(), false),
    new Comment(follower1, "Who took this? Great shot.", DateTime.now(), false),
    new Comment(user, "My friend. Thank you!", DateTime.now(), false),
    new Comment(follower5, "Inspirational!", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('lib/assets/photo4.jpg'), follower1, "This is such a great post though", DateTime.now(), [user, follower2, follower3, follower4, follower5], [
    new Comment(follower3, "This is awesome!", DateTime.now(), false),
    new Comment(follower1, "Who took this? Great shot.", DateTime.now(), false),
    new Comment(user, "My friend. Thank you!", DateTime.now(), false),
    new Comment(follower5, "Inspirational!", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('lib/assets/follower2.jpg'), follower1, "This is such a great post though", DateTime.now(), [user, follower2, follower3, follower4, follower5], [
    new Comment(follower3, "This is awesome!", DateTime.now(), false),
    new Comment(follower1, "Who took this? Great shot.", DateTime.now(), false),
    new Comment(user, "My friend. Thank you!", DateTime.now(), false),
    new Comment(follower5, "Inspirational!", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('lib/assets/their_profile.jpeg'), follower2, "This is such a great post though", DateTime.now(), [user, follower2, follower3, follower4, follower5], [
    new Comment(follower3, "This is awesome!", DateTime.now(), false),
    new Comment(follower1, "Who took this? Great shot.", DateTime.now(), false),
    new Comment(user, "My friend. Thank you!", DateTime.now(), false),
    new Comment(follower5, "Inspirational!", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('lib/assets/follower2.jpg'), follower3, "This is such a great post though", DateTime.now(), [user, follower2, follower3, follower4, follower5], [
    new Comment(follower3, "This is awesome!", DateTime.now(), false),
    new Comment(follower1, "Who took this? Great shot.", DateTime.now(), false),
    new Comment(user, "My friend. Thank you!", DateTime.now(), false),
    new Comment(follower5, "Inspirational!", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('lib/assets/post2.jpg'), follower1, "This is such a great post though", DateTime.now(), [user, follower2, follower3, follower4, follower5], [
    new Comment(follower3, "This is awesome!", DateTime.now(), false),
    new Comment(follower1, "Who took this? Great shot.", DateTime.now(), false),
    new Comment(user, "My friend. Thank you!", DateTime.now(), false),
    new Comment(follower5, "Inspirational!", DateTime.now(), false)
  ], false, false),
];


String title = "Guide.";