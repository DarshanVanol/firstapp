import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  

  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
   TextEditingController _confirmpasswordcontroller = TextEditingController();
  TextEditingController _phonecontroller = TextEditingController();

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Signup",style: TextStyle(color: Colors.amber),),backgroundColor: Colors.transparent,elevation: 0, foregroundColor: Colors.amber),
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
          obscureText: true,
          controller: _passwordcontroller,
          decoration: InputDecoration(label: Text("Password"),),
        ),),
         Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child:
        TextField(
          obscureText: true,
          controller: _confirmpasswordcontroller,
          decoration: InputDecoration(label: Text("Confirm Password"),),
        ),), Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child:
        TextField(
          controller: _phonecontroller,
          
          decoration: InputDecoration(label: Text("Phone Number"),),
        ))
        ,
SizedBox(height: 20,),
        ElevatedButton(onPressed: (){
          
          final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
          storage.write(key: _emailcontroller.text, value: _passwordcontroller.text).whenComplete(() => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Signup  Successfully"))));
          

        }, child: Text("Signup",style: TextStyle(fontSize: 16),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber),fixedSize: MaterialStateProperty.all(Size(300, 50))),
        
        )
        
      ],)),
    );
  }
}