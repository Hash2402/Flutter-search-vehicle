import 'dart:convert';
import 'package:restart_app/restart_app.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:counter/counter.dart';
import 'package:clipboard/clipboard.dart';

String copy_data="";

class view extends StatefulWidget {
  const view({Key? key}) : super(key: key);

  @override
  State<view> createState() => _viewState();
}

class _viewState extends State<view>/* with AutomaticKeepAliveClientMixin<view>*/ {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      Service().getData();
    });

  }
var _currentindex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vehicle Information"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(future:Service().getData(),builder:(context,snapshot){
               Future.delayed(Duration(seconds:1));
              if(!snapshot.hasData){
                //Restart.restartApp(webOrigin: 'package/search_vehicle/exp.dart');
                return Text ("Fetching");

              }
              else{
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:snapshot.data.length,itemBuilder:(context,index){
                  var mydata=snapshot.data[index];
                  var name=mydata['customer_name'];
                  return ListTile(
                    title: Text(
                      name
                        /*"\nConrtact No     :  "+mydata['contract_no'].toString()+"\n"+
                            "\n"+"Customer Name     :  "+mydata['customer_name'].toString()+"\n"+
                            "\nRC Number    :  "+mydata['rc_number'].toString()+"\n"+
                            "\nChasis Number     :  "+mydata['Chasis_no'].toString()+"\n"+
                            "\nVehicle Model     :  "+mydata['vehicle_model'].toString()+"\n"+
                            "\nEngine Number     :  "+mydata['Engine No'].toString()+"\n"+
                            "\nMaterial     :  "+mydata['material'].toString()+"\n"+
                            "\nDPD_Bkt     :  "+mydata['DPD_Bkt'].toString()+"\n"+
                            "\nSeasoning     :  "+mydata['Seasoning'].toString()+"\n"+
                            "\nOD Amount     :  "+mydata['OD_Amount'].toString()+"\n"+
                            "\nTBR     :  "+mydata['TBR'].toString()+"\n"+
                            "\nSEC_17     :  "+mydata['SEC_17'].toString()+"\n"+
                            "\nZone     :  "+mydata['zone'].toString()+"\n"+
                            "\nAMR Name     :  "+mydata['AMRName'].toString()+"\n"+
                            "\nTCM     :  "+mydata['TCM'].toString()+"\n"+
                            "\nRCH     :  "+mydata['RCH'].toString()+"\n"+
                            "\nFinancier    :  "+mydata['financier'].toString()+"\n"+
                            "\nFUID     :  "+mydata['FUID'].toString()+"\n"+
                            "\nBranch Code     :  "+mydata['Branch_code'].toString()+"\n"*/
                    ,style: TextStyle(fontSize: 20),),
                  );
                } );
              }
            })
          ],
        ),
      ),
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

  /*@override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;*/
}
class Service{

  Future getData() async{
    var data;
    var info;
    var response=await http.get(Uri.parse("http://carrepoinsert.badak.in/"));
    if(response.statusCode==200) {
      if(response.body.isNotEmpty) {
         info =json.decode(response.body);
      }
      else{
        getData();
      }
      //var info =json.decode(response.body);
      data=info;
      copy_data=data.toString();
      //print("HEre");
      //print(copy_data);
      return data;
    }
    else{
      print("Data err");
    }
  }
}

