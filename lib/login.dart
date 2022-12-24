

import 'package:firstapp/dashboard.dart';
import 'package:firstapp/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  

  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
   

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login",style: TextStyle(color: Colors.amber),),backgroundColor: Colors.transparent,elevation: 0,),
      body: Container(
        padding: EdgeInsets.fromLTRB(25, 40, 25, 0),
        child: Column(
          
          children: [

        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: TextField(
            controller: _emailcontroller,
            decoration: InputDecoration(label: Text("Email Address"),),
          ),
        ),
         Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child:
        TextField(
          controller: _passwordcontroller,
          obscureText: true,
          decoration: InputDecoration(label: Text("Password"),),
        ),),
         
SizedBox(height: 20,),

        ElevatedButton(onPressed: ()async{
          
          final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
          if( await storage.containsKey(key: _emailcontroller.text)){
            if(await storage.read(key: _emailcontroller.text)==_passwordcontroller.text){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Successfully")));
              // Navigator.of(context).push(MaterialPageRoute(builder: ((context) => Dashboard())));
            }


          }else{
            print("Invalid!!!");
            // showBottomSheet(context: context, builder: (context)=>SnackBar(content: Text("Invalid Email Address"),));
          }
          

        }, child: Text("Login",style: TextStyle(fontSize: 16),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber),fixedSize: MaterialStateProperty.all(Size(300, 50))),
        
        ),
        SizedBox(height: 20,)
        ,Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text("Don't have account? "),TextButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Signup()));
        }, child: Text("Signup",style: TextStyle(color: Colors.amber),))],),
        
      ],)),
    );
  }
}