import 'package:flutter/material.dart';

class confirmation extends StatefulWidget {
  const confirmation({Key? key}) : super(key: key);

  @override
  State<confirmation> createState() => _confirmationState();
}

class _confirmationState extends State<confirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.white,
        body:Center(child: Padding(padding:EdgeInsets.only(top: 30),child:Column(
          children: [
            Container(child: Text("Vehicle Confirmed!",style: TextStyle(fontSize: 24,color: Colors.indigo),),),

            ListTile(title: Text("Vehicle Number                        Value",style: TextStyle(fontSize: 19),),tileColor: Colors.white10,),
            ListTile(title: Text("Date                                             Value",style: TextStyle(fontSize: 19)),),
            ListTile(title: Text("Time                                             Value",style: TextStyle(fontSize: 19)),),

            Expanded(child: Padding(padding:EdgeInsets.fromLTRB(15, 0, 30,0),child:Row(
              children: [
                Container(alignment: Alignment.topLeft,
                    child:ElevatedButton.icon(onPressed: (){

                    }, icon: Icon(Icons.camera_alt_rounded), label:Text("CAMERA"))),
                Container(alignment:Alignment.topRight,padding:EdgeInsets.only(left: 110),child:ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.file_open_sharp), label:Text("FILES"))),

              ],
            ))),
            Expanded(child: Padding(padding:EdgeInsets.fromLTRB(15, 30, 30,0),child:Row(
              children: [
                Container(alignment: Alignment.centerLeft,
                    child:ElevatedButton.icon(onPressed: (){

                    }, icon: Icon(Icons.upload), label:Text("Upload"))),
                Container(alignment:Alignment.centerRight,padding:EdgeInsets.only(left: 130),child:ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.add), label:Text("ADD"))),

              ],
            )))
          ],
        ),
        )));
  }
}
