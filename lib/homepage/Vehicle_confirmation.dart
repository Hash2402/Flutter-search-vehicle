import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

final ImagePicker picker = ImagePicker();

class confirmation extends StatefulWidget {
  const confirmation({Key? key}) : super(key: key);

  @override
  State<confirmation> createState() => _confirmationState();
}

class _confirmationState extends State<confirmation> {
  var _selectedmedia;
  void get_image() async {
    //final ImagePicker picker = ImagePicker();
    var m = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedmedia = File(m!.path);
    });
  }

  void camera_image() async {
    final ImagePicker picker = ImagePicker();
    var m = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 50,
        preferredCameraDevice: CameraDevice.front);
    setState(() {
      _selectedmedia = File(m!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.white,
        body: Center(
            child: Padding(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Container(
                child: Text(
                  "Vehicle Confirmed!",
                  style: TextStyle(fontSize: 24, color: Colors.indigo),
                ),
              ),
              ListTile(
                title: Text(
                  "Vehicle Number                                  Value",
                  style: TextStyle(fontSize: 19),
                ),
                tileColor: Colors.white10,
              ),
              ListTile(
                title: Text(
                    "Date                                                      Value",
                    style: TextStyle(fontSize: 19)),
              ),
              ListTile(
                title: Text(
                    "Time                                                     Value",
                    style: TextStyle(fontSize: 19)),
              ),
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
                      child: Row(
                        children: [
                          Container(
                              alignment: Alignment.topLeft,
                              child: ElevatedButton.icon(
                                  onPressed: () {
                                    camera_image();
                                  },
                                  icon: Icon(Icons.camera_alt_rounded),
                                  label: Text("CAMERA"))),
                          Container(
                              alignment: Alignment.topRight,
                              padding: EdgeInsets.only(left: 130),
                              child: ElevatedButton.icon(
                                  onPressed: () {
                                    get_image();
                                  },
                                  icon: Icon(Icons.file_open_sharp),
                                  label: Text("FILES"))),
                        ],
                      ))),
              Padding(
                  padding: EdgeInsets.only(),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    height: 270,
                    width: 270,
                    child: Center(
                      child: _selectedmedia != null
                          ? Image.file(
                              _selectedmedia,
                            )
                          : Text("Image here"),
                    ),
                  )),
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(15, 10, 30, 0),
                      child: Row(
                        children: [
                          Container(
                              alignment: Alignment.centerLeft,
                              child: ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: Icon(Icons.upload),
                                  label: Text("Upload"))),
                          Container(
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(left: 140),
                              child: ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: Icon(Icons.add),
                                  label: Text("ADD"))),
                        ],
                      )))
            ],
          ),
        )));
  }
}
