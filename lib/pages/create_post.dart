import 'package:flutter/material.dart';
import "package:guide2/pages/home.dart";
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

import '../main.dart';

class CreatePostPage extends StatefulWidget {
  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {

  //determine whether image is selected from camera or gallery

  File _image;
  bool _uploaded = false;
  String _downloadUrl;
  StorageReference _reference = FirebaseStorage.instance.ref().child('myimage.jpg');

  Future getImage(bool isCamera) async {
    File image;

    if (isCamera) {
      image = await ImagePicker.pickImage(source: ImageSource.camera);
    } else {
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }

    setState(() {
      _image = image;
    });
  }

  Future uploadImage () async {
    StorageUploadTask uploadTask = _reference.putFile(_image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    //String _downloadUrl = await taskSnapshot.ref.getDownloadURL();
    setState(() {
      _uploaded = true;
    });
  }

  Future downloadImage() async {
    String downloadAddress = await _reference.getDownloadURL();
    setState(() {
      _downloadUrl = downloadAddress;
    });
  }

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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
                '\nTips for monetising posts:\n',
                style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold)
            ),
            Text(
                    "  - Use a professional camera if possible.\n"
                    "  - Use gridlines to take more balanced photos.\n"
                    "  - Create symmetry in photos.\n"
                    "  - Crop instead of zoom to prevent distortion of photo.\n"
                    "  - Edit your photo before posting.\n"
                    "  - Use a tripod to mount the camera if possible.\n",
                style: TextStyle(fontSize: 16.0)

            ),



            RaisedButton(
              child: Text('Camera'),
              onPressed: () {
                getImage(true);
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              child: Text('Gallery'),
              onPressed: () {
                getImage(false);
              },
            ),
            _image == null
                ? Container()
                : Image.file(
              _image,
              height: 282,
              //width: 300.0,
            ),


            //Text("Are you sure you want to upload this post?"),

            _image == null ? Container() : RaisedButton(

                child: Text("Upload"),

                onPressed: () {
                  showAlertDialog(context);
                }


            ),


//    Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context) {
//                 return new HomePage();}
//                  ));


            _uploaded == false ? Container() : RaisedButton(
              child: Text('Download Image'),
              onPressed: () {
                downloadImage();
              },
            ),
            _downloadUrl == null ? Container() : Image.network(_downloadUrl),
          ],
        ),

      ),
    );



  }
  showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed:  () {Navigator.of(context).pop();}, //closes alert
    );
    Widget continueButton = FlatButton(
      child: Text("Upload"),
        onPressed: () {
          uploadImage();
          Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context) {
            return MyApp();}
          ));
        } //uploads and then closes
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("If you hit 'upload' this will post to the feed for everyone to see."),
      content: Text("Are you sure you want to post this?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );

  }
}


