import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class imageshow extends StatefulWidget {
  @override
  _imageshowState createState() => _imageshowState();
}

class _imageshowState extends State<imageshow> {

  var imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff1F618D),
          title: Text("Image Picker"),
          centerTitle: true,
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: const Color(0xff1F618D),
          ),
        ),

        body: Container(
            child: imageFile == null
                ? Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    color:  Color(0xff1F618D),
                    onPressed: () {
                      _getFromGallery();
                    },
                    child: Text("PICK FROM GALLERY",
                    style: TextStyle(
                      color:   Color(0xffFDFEFE)
                    ),),
                  ),
                  Container(
                    height: 40.0,
                  ),
                  RaisedButton(
                    color:  Color(0xff1F618D),
                    onPressed: () {
                      _getFromCamera();
                    },
                    child: Text("PICK FROM CAMERA",
                      style: TextStyle(
                          color:   Color(0xffFDFEFE)
                      ),
                    ),
                  )
                ],
              ),
            ): Container(
              child: Image.file(
                imageFile,
                fit: BoxFit.cover,
              ),
            )));
  }

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
}