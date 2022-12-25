import 'package:flutter/material.dart';


class subscribe extends StatefulWidget {
  const subscribe({Key? key}) : super(key: key);

  @override
  State<subscribe> createState() => _subscribeState();
}

class _subscribeState extends State<subscribe> {
  @override
  Widget build(BuildContext context) {
    double _width=MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(title: Text("ACTIVE SUBSCRIPTION")),
        backgroundColor: Colors.white70,
        body:Container(child:Padding(padding: const EdgeInsets.only(top: 80,left: 20,right: 20),child:Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),),
          elevation: 20,
          shadowColor:Colors.blueGrey ,
          child: SizedBox(
              width:(_width-50) ,
              height: 370,
              child: Padding(

                padding: const EdgeInsets.all(30),
                child: /*Text("Subscription",style:TextStyle(fontSize: 22,color: Colors.black87)*/
                Column(

                  children: [
                    Container(
                      child: Center(child: Text("Active Subscription",style: TextStyle(fontSize: 24),),),
                    ),

                    ListTile(contentPadding: EdgeInsets.fromLTRB(0, 15, 3, 3),title: Text("Starting From",style: TextStyle(fontSize: 19),),subtitle: Text("23/12/2022",style: TextStyle(fontSize: 17)),tileColor: Colors.white10,),
                    ListTile(contentPadding: EdgeInsets.fromLTRB(0, 3, 3, 3),title: Text("Ending On",style: TextStyle(fontSize: 19)),subtitle: Text("23/01/2023",style: TextStyle(fontSize: 17)),),
                    ListTile(contentPadding: EdgeInsets.fromLTRB(0, 3, 3, 3),title: Text("Remaining Days",style: TextStyle(fontSize: 19)),subtitle: Text("Rem. Days :-  -",style: TextStyle(fontSize: 17),),),

                    Container(
                      alignment: Alignment.bottomRight,
                      child: Icon(Icons.access_time_filled,size: 35,),
                    )
                  ],

                )
                ,)),
        ),
        ),
        ));

  }
}
