import 'package:edu_expo/screens/user_info_screen.dart';
import "package:flutter/material.dart";

class UserType extends StatefulWidget {
  const UserType({ Key? key }) : super(key: key);

  @override
  _UserTypeState createState() => _UserTypeState();
}
enum userType { student, university }
class _UserTypeState extends State<UserType> {

  userType? _user = userType.student;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text("finishing up..", style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 20,),
                  Text("are you a student or a university?", style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[700]
                  ),),
                ],
              ),
               Column(
                children: <Widget>[
                  radiobut(),
                  
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 3, left: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border(
                    bottom: BorderSide(color: Colors.black),
                    top: BorderSide(color: Colors.black),
                    left: BorderSide(color: Colors.black),
                    right: BorderSide(color: Colors.black),
                  )
                ),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                     //home screen path
                             Navigator.push(
                              context,
                              MaterialPageRoute(
                               builder: (context)=> UserInfoScreen()));
                  },
                  color: Colors.greenAccent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Text("Next", style: TextStyle(
                    fontWeight: FontWeight.w600, 
                    fontSize: 18
                  ),),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget>[
                  Text("Already have an account?"),
                  Text(" Login", style: TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 18
                  ),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
      Widget radiobut(){
    
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('university'),
          leading: Radio<userType>(
            value: userType.university,
            groupValue: _user,
            onChanged: (userType? value) {
              setState(() {
                _user = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('student'),
          leading: Radio<userType>(
            value: userType.student,
            groupValue: _user,
            onChanged: (userType? value) {
              setState(() {
                _user = value;
              });
            },
          ),
        ),
      ],
    );

  }
  }



