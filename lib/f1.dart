import 'dart:convert';
import 'package:clipboard/clipboard.dart';
import 'package:http/http.dart' as http;
import 'package:search_vehicle/exp.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restart_app/restart_app.dart';
import 'package:search_vehicle/pages/try.dart';
List output=[];
dynamic out="";

var ar;
/*get_data(a) async{
    List info=[];
    var data=jsonEncode(a);

    var url = Uri.parse("http://carrepoinsert.badak.in/");

    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request('POST', url);
    request.bodyFields = {
      "rc_number":a,

    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("success");
      List li=[];
      dynamic  fetched_data=await response.stream.bytesToString();
      li.addAll(fetched_data);
      out=fetched_data;
     // print(fetched_data);
      print(out.length);
      print(li);
      return out;
    }
    else {
      print("failed");
      print(response.reasonPhrase);
      return false;
    }
}*/



class Display extends StatelessWidget {
  final  name;

  Display(this.name);


  get_data(a) async{
    List info=[];
    List li=[];
    var data=jsonEncode(a);
    ar=a;
    var url = Uri.parse("http://carrepoinsert.badak.in/");

    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request('POST', url);
    request.bodyFields = {
      "rc_number":a,

    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("success");

      dynamic fetched_data=await response.stream.bytesToString();
      print(fetched_data);
      li=List.from(jsonDecode(fetched_data));
      out=fetched_data;
      //print(fetched_data);
      //print(out.length);
      //print(li);
      //Navigator.push(out,MaterialPageRoute(builder: (context)=>betry()));


    }
    else {
      print("failed");
      print(response.reasonPhrase);
      return false;
    }
    return li;
  }


dynamic display;
  var _currentindex=0;
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero,()async {
      //print(name);
      display=await get_data(name);
      //print(display);
      //print("Here"+name);
      //print("Hello ");

    });
    return Scaffold(
      appBar: AppBar(title: Text("Vehicle Information"),),
      body: Container(
        child: FutureBuilder(future:get_data(name),builder: (context,AsyncSnapshot snapshot){
                if(snapshot.hasData) {
                  return ListView.builder(itemCount: 1,itemBuilder: (context,index){
                    var data=snapshot.data[index];
                    return
                    ListTile(
                      title:Text(
                            "\nConrtact No        :  "+data['contract_no'].toString()+"\n"+
                            "\n"+"Name            :  "+data['customer_name'].toString()+"\n"+
                            "\nRC Number          :  "+data['rc_number'].toString()+"\n"+
                            "\nChasis Number      :  "+data['Chasis_no'].toString()+"\n"+
                            "\nVehicle Model      :  "+data['vehicle_model'].toString()+"\n"+
                            "\nEngine Number      :  "+data['Engine No'].toString()+"\n"+
                            "\nMaterial           :  "+data['material'].toString()+"\n"+
                            "\nDPD_Bkt            :  "+data['DPD_Bkt'].toString()+"\n"+
                            "\nSeasoning          :  "+data['Seasoning'].toString()+"\n"+
                            "\nOD Amount          :  "+data['OD_Amount'].toString()+"\n"+
                            "\nTBR                :  "+data['TBR'].toString()+"\n"+
                            "\nSEC_17             :  "+data['SEC_17'].toString()+"\n"+
                            "\nZone               :  "+data['zone'].toString()+"\n"+
                            "\nAMR Name           :  "+data['AMRName'].toString()+"\n"+
                            "\nTCM                :  "+data['TCM'].toString()+"\n"+
                            "\nRCH                :  "+data['RCH'].toString()+"\n"+
                            "\nFinancier          :  "+data['financier'].toString()+"\n"+
                            "\nFUID               :  "+data['FUID'].toString()+"\n"+
                            "\nBranch Code        :  "+data['Branch_code'].toString()+"\n"
                        ,style: TextStyle(fontSize: 20,color: Colors.indigoAccent),),
                    );
                  });
                }
                else
                  {
                    return CircularProgressIndicator();
                  }

              },)
      ),

    );
  }

}
class bottom extends StatefulWidget {
  const bottom({Key? key}) : super(key: key);

  @override
  State<bottom> createState() => _bottomState();
}

class _bottomState extends State<bottom> {
  var _currentindex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey,
        currentIndex: _currentindex,
        unselectedFontSize: 15,
        selectedFontSize: 20,
        items: [
          BottomNavigationBarItem(
            icon: (Icon(Icons.check_circle_outline_rounded)),
            label: "Confirm",
            backgroundColor: Colors.cyan,

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.whatsapp),
            label: "Whatsapp",
            backgroundColor: Colors.green,

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wrap_text_rounded),
            label: "Repo",
            backgroundColor: Colors.deepOrangeAccent,

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.copy),
            label: "Copy",
            backgroundColor: Colors.blue,


          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cancel_rounded),
            label: "Cancel",
            backgroundColor: Colors.indigoAccent,

          ),

        ],
        onTap: (index){
          setState(() {
            _currentindex=index;

          });
          if(_currentindex==3)
          {
            FlutterClipboard.copy(copy_data);
            print("copied");
            /* Scaffold(
              body: SnackBarPage(),
            );*/
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Copied"))
            );
          }
        },

      ),
    );
  }
}






