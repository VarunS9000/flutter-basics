import 'package:flutter/material.dart';
import 'package:widget_tutorial/user.dart';
class SuccessScreen extends StatelessWidget {
  SuccessScreen({ Key? key }) : super(key: key);

  dynamic dataMap = {};

  @override
  Widget build(BuildContext context) {
    dataMap = dataMap.isEmpty?ModalRoute.of(context)!.settings.arguments: dataMap;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Success Screen',
          style: TextStyle(
            color: Colors.black
          ),
          ),
        backgroundColor: Colors.yellow,
        centerTitle: true

      ),

      body: Center(
        child:FutureBuilder(
          future: User.setAttributes(dataMap['name'], dataMap['email'], dataMap['password']),
          builder:(context, AsyncSnapshot<bool> snapshot){
            if(snapshot.hasData){
              return Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Hi ${User.name}, you have sucessfully registered. Please check your email ${User.email} for further steps',
                  style: TextStyle(
                    fontSize: 30
                  ),
                  ),
                );

               
            }

            return CircularProgressIndicator();
          } ,
          )
        ),
      
    );
  }
}