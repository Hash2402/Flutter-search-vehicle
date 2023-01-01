import 'package:flutter/material.dart';
import 'package:search_vehicle/pages/bezierContainer.dart';
import 'package:search_vehicle/Pages/login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:search_vehicle/main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

final uname=TextEditingController();
final pwd=TextEditingController();
final email=TextEditingController();
bool validate =false;
bool _visible=false;
class SignUpPage extends StatefulWidget {
  SignUpPage({Key ?key, this.title}) : super(key: key);

  final String? title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {


  Future signup() async{
    String url="http://192.168.29.128/vehicle/signup.php";

    setState(() {
      _visible = true;
    });


    var data={
      'username':uname.text,
      'password':pwd.text,
      'email':email.text,
    };

    var response=await http.post(Uri.parse(url),body:json.encode(data));
    if (response.statusCode==200)
    {
      print(data);
      print("Hereeeee");
      if(response.body.isEmpty)
      {
        print("Empty");
      }
      print(response.body);
      var msg=jsonDecode(response.body);
      print(msg.toString());
      if(msg['SignupStatus']==true){
        setState(() {
          //hide progress indicator
          print("Here");
          _visible = false;
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
            return LoginPage();
          }));
          uname.clear();
          email.clear();
          pwd.clear();
        });
      }
      else
      {
        showMessage(msg['message']);

      }
      /*Navigator.push(
          context, MaterialPageRoute(builder: (context) =>(uname:msg['userInfo']['NAME'])));*/


    }
    else
    {
      print("herer----");
      setState(() {
        _visible=false;
        showMessage("Error during Connecting");
      });
    }
  }
  Future<dynamic> showMessage(String msg) async {
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: new Text(msg),
        actions: [
          TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text("Ok"))
        ],
      );
    });
  }




  /*Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }*/

  Widget _entryField(String title, {bool isPassword = false}) {
    var current_controller;
    String method;
    if(title=='Username'){
      current_controller=uname;
      method='validate_uname(current_controller)';
    }
    else if(title=='Email id'){
      current_controller=email;
      method='validate_email(current_controller)';
    }
    else{
      current_controller=pwd;
      method='validate_pwd(current_controller)';
    }
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: current_controller,
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return InkWell(child:Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xff00bfa5), Color(0xff1e88e5)])),
      child: Text(
        'Register Now',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    ),
      onTap: (){
        signup();

      },
    );
  }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
          return LoginPage();
        }));
        uname.clear();
        email.clear();
        pwd.clear();
        },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Car',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Color(0xffe46b10)
          ),

          children: [
            TextSpan(
              text: 'Re',
              style: TextStyle(color: Colors.blue, fontSize: 30),
            ),
            TextSpan(
              text: 'Po',
              style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Username"),
        _entryField("Email id"),
        _entryField("Password", isPassword: true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    _title(),
                    SizedBox(
                      height: 50,
                    ),
                    _emailPasswordWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    _submitButton(),
                    SizedBox(height: height * .14),
                    _loginAccountLabel(),
                  ],
                ),
              ),
            ),
            //Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }
}