import 'package:flutter/material.dart';
import 'package:search_vehicle/Pages/login.dart';


class acc_info extends StatefulWidget {
  const acc_info({Key? key}) : super(key: key);

  @override
  State<acc_info> createState() => _acc_infoState();
}
var pad_top=20;
class _acc_infoState extends State<acc_info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Information"),
        //backgroundColor: Colors.redAccent,
        actions: [

          PopupMenuButton(
            // add icon, by default "3 dot" icon
            // icon: Icon(Icons.book)
              itemBuilder: (context){
                return [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text("Change Profile Picture"),
                  ),

                  PopupMenuItem<int>(
                    value: 1,
                    child: Text("Add KYC Picture"),
                  ),

                  PopupMenuItem<int>(
                    value: 2,
                    child: Text("Download Aadhar Card"),
                  ),
                  PopupMenuItem<int>(
                    value: 3,
                    child: Text("Logout"),

                  ),
                ];
              },
              onSelected:(value){
                if(value == 0){

                }else if(value == 1){
                  print("KYC added");
                }else if(value == 2){
                  print("Aadhar Downloaded");
                }
                else if(value==3){
                  print("Signing off");
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                    return LoginPage();
                  }));
                }
              }
          ),

        ],
      ),
      body:SingleChildScrollView(child:Column(children:[
        Container(child:Padding(padding:EdgeInsets.only(top: 70),child:Column(
          children: [
            Container(child: Icon(Icons.person,size: 60,),),
            Container(child: Text("Harsh Sharma",style: TextStyle(fontSize: 33),),)

          ],
        )))


        ,Container(child:Padding(padding: const EdgeInsets.only(top: 40,left: 30),child:Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),),
          elevation: 20,
          shadowColor:Colors.blueGrey ,
          child: SizedBox(
              width: 320,
              height: 450,
              child: Padding(

                padding: const EdgeInsets.fromLTRB(30,20,30,20),
                child: /*Text("Subscription",style:TextStyle(fontSize: 22,color: Colors.black87)*/
                Column(

                  children: [

                    Container(child:Padding(padding:EdgeInsets.only(top: 10),child:TextField(
                      decoration: InputDecoration(

                        border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(7.0),

                        ),
                        hintText: 'Mobile Number',
                        filled: true,
                        fillColor:Color(0xffe0f2f1),
                        prefixIcon: Icon(Icons.smartphone_rounded),

                      ),

                    ))),

                    Container(child:Padding(padding:EdgeInsets.only(top: 20),child:TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                          hintText: 'Address',
                          filled: true,
                          fillColor:Color(0xffe0f2f1),
                          prefixIcon: Icon(Icons.location_on_outlined)
                      ),

                    ))),
                    Container(child:Padding(padding:EdgeInsets.only(top: 20),child:TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                          hintText: 'Tehsil/District',
                          filled: true,
                          fillColor:Color(0xffe0f2f1),
                          prefixIcon: Icon(Icons.holiday_village_outlined)
                      ),

                    ))),
                    Container(child:Padding(padding:EdgeInsets.only(top: 20),child:TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                          hintText: 'State',
                          filled: true,
                          fillColor:Color(0xffe0f2f1),
                          prefixIcon: Icon(Icons.flag)
                      ),

                    ))),
                    Container(child:Padding(padding:EdgeInsets.only(top: 20),child:TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(

                            borderRadius: BorderRadius.circular(7.0),
                          ),
                          hintText: 'Pin Code',
                          filled: true,
                          fillColor:Color(0xffe0f2f1),
                          prefixIcon: Icon(Icons.pin_rounded)
                      ),

                    ))),

                  ],

                )
                ,)),
        ),
        ),
        )])),
    );
  }
}
