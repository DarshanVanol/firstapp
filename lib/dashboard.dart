import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class Dialoguebox extends StatelessWidget {
//   const Dialoguebox({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       child: Container(
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(40))),
//           height: 150,
//           width: 200,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Dialog Box",
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
//               ),
//               Text("Dialog Box is Opened.... "),
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text(
//                   "OK",
//                   style: TextStyle(
//                       color: Colors.amber,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold),
//                 ),
//               )
//             ],
//           )),
//     );
//   }
// }

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final Future<SharedPreferences> pref = SharedPreferences.getInstance();
  late bool isDarkmode=false;

  Future<void> getpref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool dark = pref.getBool('isdark')??false;
    setState(() {
      isDarkmode=dark;
    });
  }

void setpref(bool isdark){
  pref.then((SharedPreferences _pref) {
    _pref.setBool('isdark', isdark);
  });
}
  
@override
  void initState() {
    
  
    // TODO: implement initState
    super.initState();
    getpref();
  

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Shared Preference"),
          backgroundColor: isDarkmode?Colors.grey[800]:Colors.amber,
        ),
        backgroundColor: isDarkmode?Colors.grey:Colors.white,
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Change Theme",style: TextStyle(color: isDarkmode?Colors.white:Colors.black),),
                Switch(onChanged: (value) async{
                  setState(() {
                    isDarkmode=value;
                    setpref(isDarkmode);
                  });
                  
                },

                value: isDarkmode,
                ),
              ],
            ),
                )
                );
  }
}
