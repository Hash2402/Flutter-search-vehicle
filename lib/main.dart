import 'dart:convert';
import 'package:restart_app/restart_app.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:search_vehicle/exp.dart';
import 'package:search_vehicle/f1.dart';
import 'package:search_vehicle/pages/Pilot.dart';

import 'package:search_vehicle/homepage/subscription.dart';
import 'package:search_vehicle/homepage/account_info.dart';
import 'package:search_vehicle/homepage/Vehicle_confirmation.dart';

List info_list = [];
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

List output = [];

class _HomepageState extends State<Homepage> {
  //final controller = TextEditingController();

  Future getoutput() async {
    await new Future.delayed(const Duration(milliseconds:0));
    var response =
    await http.get(Uri.parse("http://carrepo.badak.in/"));
    if (response.statusCode == 200) {
      setState(() {

        output.addAll(json.decode(response.body));
      });
      info_list = List.from(output);
     // print(output.toString());
      //print("Length is " + output.length.toString());
      return output;
    }
    //else {print("Error---------");}
  }

  var m = "";
  @override
  void initState() {
    super.initState();
    getoutput();
    //print("Harsh here "+info_list.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search....."),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchDel(),
                );
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body:DisplayBuild());
  }
}

List searchTerms = info_list;
List output1=[];
List info=[];
class SearchDel extends SearchDelegate {

  Future  get_data(a) async{
    try{

      var send= await http.post(Uri.parse("http://carrepo.badak.in/"),body:a.text );
      var check=jsonDecode(send.body);
      if(check["success"]=="true") {
        print("NAme sent");
      }
      else{
        print("Issue");
      }
      //Getting data
      var response = await http.get(Uri.parse("http://carrepo.badak.in/"));
      if (response.statusCode == 200) {
        info.addAll(json.decode(json.encode(response.body)));
        print("HEllo");
      }
      else {
        print("NOt helllllll---------");
      }
      output1 = List.from(info);
      print(info.toString());
      print("Length is " + output1.length.toString());


    }
    catch(e)
    {
      return (e);
    }


  }


  //static  List searchTerms=output;

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var val in searchTerms) {
      if (val.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(val);
      }
    }
    print("Agayaaaaa----111");
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var res = matchQuery[index];
          return ListTile(
            title: Text(res),

          );
        });
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            query = " ";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    List<String> matchQuery = [];
    for (var val in searchTerms) {
      if (val.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(val);
      }
    }
    print("Here-------");
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var res = matchQuery[index];
          //print(res);
          return ListTile(
            title: Text(res),
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>Display(res)));
            },

          );
        });
  }
}

//Homepage Class

class DisplayBuild extends StatefulWidget {
  const DisplayBuild({Key? key}) : super(key: key);

  @override
  State<DisplayBuild> createState() => _DisplayBuildState();
}

class _DisplayBuildState extends State<DisplayBuild> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Container(child:Padding(padding: const EdgeInsets.only(top: 80,left: 20),child:Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),),
        elevation: 20,
        shadowColor:Colors.blueGrey ,
        child: SizedBox(
            width: 340,
            height: 450,
            child: Padding(

              padding: const EdgeInsets.all(30),
              child: /*Text("Subscription",style:TextStyle(fontSize: 22,color: Colors.black87)*/
              Column(
                children: [
                  Container(
                      child:Center(child: Row(
                        children: [

                          Container(child: Text("Car",style: TextStyle(color: Colors.red,fontSize: 23),),),
                          Container(child: Text("Re",style: TextStyle(color: Colors.purple,fontSize: 23),),),
                          Container(child: Text("Po",style: TextStyle(color: Colors.red,fontSize: 23),),)
                        ],
                      )
                      )),

                  Expanded(child:Container(
                      child: Padding(padding:EdgeInsets.only(top: 10,left: 10),child:Row(
                        children: [
                          //R1C1
                          Container(

                              child: Padding(padding:EdgeInsets.fromLTRB(2, 5, 15, 15),child:SizedBox(
                                height: 90,
                                width: 120,
                                child: ElevatedButton(
                                  child: Stack(
                                    children: <Widget>[
                                      Align(
                                          alignment: Alignment.topCenter,
                                          child:Padding(padding: EdgeInsets.only(top: 15),child:Icon(Icons.calendar_month,size: 28,))
                                      ),
                                      Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(padding: EdgeInsets.only(bottom: 8),child:Text(
                                            "Remaining Days",
                                            textAlign: TextAlign.center,
                                          )
                                          )
                                      )
                                    ],
                                  ),
                                  onPressed: (){},
                                ),
                              ))
                          ),
                          //R1C2
                          Container(
                              child:Padding(padding:EdgeInsets.fromLTRB(5, 0, 3, 10),child:SizedBox(
                                height: 90,
                                width: 120,
                                child: ElevatedButton(
                                  child: Stack(
                                    children: <Widget>[
                                      Align(
                                          alignment: Alignment.topCenter,
                                          child:Padding(padding: EdgeInsets.only(top: 15),child:Icon(Icons.file_open_sharp,size: 26,))
                                      ),
                                      Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(padding: EdgeInsets.only(bottom: 8),child:Text(
                                            "Offline Records",
                                            textAlign: TextAlign.center,
                                          )
                                          )
                                      )
                                    ],
                                  ),
                                  onPressed: (){},
                                ),
                              ))
                          ),
                        ],

                      ),

                      ))),

                  Expanded(child:Container(
                      child:Padding(padding: EdgeInsets.only(left: 10,top: 5),child: Row(
                        children: [
                          //R2C1
                          Container(
                            // alignment: Alignment.bottomRight,
                              child: Padding(padding:EdgeInsets.only(right: 20),child:SizedBox(
                                height: 90,
                                width: 120,
                                child: ElevatedButton(
                                  child: Stack(
                                    children: <Widget>[
                                      Align(
                                          alignment: Alignment.topCenter,
                                          child:Padding(padding: EdgeInsets.only(top: 18),child:Icon(Icons.time_to_leave_sharp,size: 35,))
                                      ),
                                      Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(padding: EdgeInsets.only(bottom: 8),child:Text(
                                            "V-Confirmed",
                                            textAlign: TextAlign.center,
                                          )
                                          )
                                      )
                                    ],
                                  ),
                                  onPressed: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context) => const confirmation()));
                                  },
                                ),
                              ))
                          ),
                          //R2C2
                          Container(
                            // alignment: Alignment.bottomLeft,
                              child: SizedBox(
                                height: 90,
                                width: 120,
                                child: ElevatedButton(
                                  child: Stack(
                                    children: <Widget>[
                                      Align(
                                          alignment: Alignment.topCenter,
                                          child:Padding(padding: EdgeInsets.only(top: 10,bottom:4),child:Icon(Icons.subscriptions_rounded,size: 28,))
                                      ),
                                      Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(padding: EdgeInsets.only(bottom: 8,top:5),child:Text(
                                            "Active Subscription",
                                            textAlign: TextAlign.center,

                                          )
                                          )
                                      )
                                    ],
                                  ),
                                  onPressed: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context) => const subscribe()));
                                  },
                                ),
                              )
                          ),
                        ],
                      ),)
                  )),


                  Container(
                      alignment: Alignment.bottomCenter,
                      child: Padding(padding:EdgeInsets.only(top: 35),child:SizedBox(
                        height: 80,
                        width: 200,
                        child: ElevatedButton(
                          child: Stack(
                            children: <Widget>[
                              Align(
                                  alignment: Alignment.topCenter,
                                  child:Padding(padding: EdgeInsets.only(top: 5),child:Icon(Icons.account_circle,size: 38,))
                              ),
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(padding: EdgeInsets.only(bottom: 8),child:Text(
                                    "My Account",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 23),)
                                  )
                              )
                            ],
                          ),
                          onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => const acc_info()));
                          },
                        ),
                      ))
                  )
                ],

              )
              ,)),
      ),
      ),
      ),
    );
  }
}
