import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool passwordHide = true;

  List<bool> checkBoxValues = [false,false,false];

  Row checkBoxElement(String value, int index){

    return Row(
      children: [
        Checkbox(
          value: checkBoxValues[index], 
          onChanged: (value){}),
          Padding(
            padding: EdgeInsets.all(5),
            child: Text(value),
            )

      ],
    );
  }

  @override
  void initState(){
    super.initState();

    password.addListener(() { 
      if(password.text.contains(RegExp(r'[A-Z]'))){
        setState(() {
          checkBoxValues[0]= true;
        });
      }

      if(!password.text.contains(RegExp(r'[A-Z]'))){
        setState(() {
          checkBoxValues[0]= false;
        });
      }

      if(password.text.contains(RegExp(r'[0-9]'))){
        setState(() {
          checkBoxValues[1]= true;
        });
      }

      if(!password.text.contains(RegExp(r'[0-9]'))){
        setState(() {
          checkBoxValues[1]= false;
        });
      }

      if(password.text.length>=8){
        setState(() {
          checkBoxValues[2]= true;
        });
      }

      if(password.text.length<8){
        setState(() {
          checkBoxValues[2]= false;
        });
      }
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First App'),
        backgroundColor:Colors.green,
        centerTitle: true,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
             ListTile(
              leading: Icon(
                Icons.account_circle,
                size: 40,
                color: Colors.black,
                ),
              title: TextFormField(
                controller: name,
                decoration: const InputDecoration(hintText: 'Name'),
              ),
              trailing: IconButton(
                onPressed: (){
                  name.clear();
                }, 
                icon: Icon(
                  Icons.clear,
                  color: Colors.black,
                  )),
             ),
              ListTile(
              leading: Icon(
                Icons.email,
                size: 40,
                color: Colors.black,
                ),
              title: TextFormField(
                controller: email,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
              trailing: IconButton(
                onPressed: (){
                  email.clear();
                }, 
                icon: Icon(
                  Icons.clear,
                  color: Colors.black,
                  )),
             ),
              ListTile(
              leading: Icon(
                Icons.keyboard,
                size: 40,
                color: Colors.black,
                ),
              title: TextFormField(
                controller: password,
                decoration: const InputDecoration(hintText: 'Password'),
                obscureText: passwordHide,
              ),
              trailing: IconButton(
                onPressed: (){
                  setState(() {
                     passwordHide = !passwordHide;
                  });
                 
                }, 
                icon: Icon(
                  Icons.remove_red_eye,
                  color: passwordHide?Colors.black:Colors.blue,
                  )),
             ),
             checkBoxElement('Minimum one UpperCase', 0),
             checkBoxElement('Minimum one number', 1),
             checkBoxElement('Minimum 8 characters', 2),
             TextButton(
              onPressed: (){
                if(!name.text.contains(RegExp(r'[A-Za-z]')) || name.text.contains(RegExp(r'[0-9]'))){
                  Fluttertoast.showToast(msg: 'Invalid name');
                }

                else if(!EmailValidator.validate(email.text)){
                   Fluttertoast.showToast(msg: 'Invalid email');
                }

                else if(password.text.length<8){
                  Fluttertoast.showToast(msg: 'Password should atlest have 8 characters');
                }
                else{
                  Navigator.pushNamed(context, '/success',arguments: {
                    'name': name.text,
                    'email':email.text,
                    'password':password.text
                  });
                  name.clear();
                  email.clear();
                  password.clear();
                }
              }, 
              child: Text('Submit'))
            ],
          ),
        ),
      ),
      
    );
  }
}