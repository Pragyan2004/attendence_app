import 'dart:async';
import 'dart:collection';

import 'package:attendence_app/model/user.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:slide_to_act/slide_to_act.dart';
class TodayScreen extends StatefulWidget {
  const TodayScreen({super.key});

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  double screenheight=0;
  double screenwidth=0;
  String location=" ";

  Color primary=Color(0xffeef444c);
  void _getLocation()async{
    List<Placemark> placemark=await placemarkFromCoordinates(User.lat, User.long);
    setState(() {
      location="${placemark[0].street},${placemark[0].administrativeArea},${placemark[0].postalCode},${placemark[0].country}";
    });
  }
  @override
  Widget build(BuildContext context) {
    screenwidth=MediaQuery.of(context).size.width;
    screenheight=MediaQuery.of(context).size.height;

    return Scaffold(
     body: SingleChildScrollView(
       padding: EdgeInsets.only(top: 40,left: 10),
       child: Column(
         children: [
           Container(
             alignment: Alignment.centerLeft,
             margin: EdgeInsets.only(top: 32),
             child: Text("WELCOME",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: screenwidth/20),),
           ),
           Container(
             alignment: Alignment.centerLeft,
             child: Text("Employee" + User.employeeId ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: screenwidth/18),),
           ),
           Container(
             alignment: Alignment.centerLeft,
             margin: EdgeInsets.only(top: 32),
             child: Text("Today's Status",style: TextStyle(fontWeight: FontWeight.bold,fontSize: screenwidth/18),),
           ),
           Container(
             margin: EdgeInsets.only(top: 12,bottom: 32),
             height: 150,
             decoration: BoxDecoration(
               color: Colors.white,
               boxShadow: [
                 BoxShadow(
                   color: Colors.black26,
                   blurRadius: 10,
                   offset: Offset(2,2),
                 )
               ],
               borderRadius: BorderRadius.all(Radius.circular(20)),
             ),
           child: Row(
            children: [
               Expanded(
                   child: Container(
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Text("Check In",style: TextStyle(fontSize: screenwidth/20,color: Colors.black54),),
                         Text("09:30",style: TextStyle(fontSize: screenwidth/18,color: Colors.black54,fontWeight: FontWeight.bold)),
                       ],
                     ),
                   )
               ),
               Expanded(
                   child: Container(
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Text("Check out",style: TextStyle(fontSize: screenwidth/20,color: Colors.black54)),
                         Text(DateFormat('hh:mm').format(DateTime.now()),style: TextStyle(fontSize: screenwidth/18,color: Colors.black54,fontWeight: FontWeight.bold)),
                       ],
                     ),
                   )
               )
             ],
           )
           ),
           Container(
               alignment: Alignment.centerLeft,
               child:RichText(text: TextSpan(text: DateTime.now().day.toString(),style: TextStyle(fontSize: screenwidth/20,color: Colors.black54,fontWeight: FontWeight.bold),
                   children: [
                     TextSpan(text: DateFormat(' MMMM yyyy').format(DateTime.now()),style: TextStyle(fontWeight: FontWeight.bold,fontSize: screenwidth/18,color: Colors.black45))
                   ]
               )
               )
           ),
           StreamBuilder(
               stream: Stream.periodic(const Duration(seconds: 1)),
               builder: (context,snapshot) {
                 return Container(
                   alignment: Alignment.centerLeft,
                   child: Text(DateFormat('hh:mm:ss a').format(DateTime.now()),
                       style: TextStyle(
                           fontSize: screenwidth / 20, color: Colors.black54)),
                 );
               }),
           Container(
             margin: EdgeInsets.only(top: 24),
             child: Builder(builder: (context){
               final GlobalKey<SlideActionState> key=GlobalKey();
               return SlideAction(
                 text: "Slide to Check out",
                 textStyle: TextStyle(color: Colors.black45,fontSize: screenwidth/20),
                 outerColor: Colors.white,
                 innerColor: primary,
                 key: key,
                 onSubmit: (){
                   if(User.lat!=0){
                     _getLocation();
                   }else{
                     Timer(Duration(seconds: 3),(){
                       Container(
                           height:100,
                           color: Colors.red,
                           child: Text(location));
                     });
                   }
                  // print(DateFormat('hh:mm').format(DateTime.now()));
                 },
               );
             }
             ),
           ),
           location!=" "?
           Padding(
             padding: EdgeInsets.only(left: 30,right: 20,top:40),
             child: Container(
                 height: 70,
                 width: screenwidth,
                 decoration: BoxDecoration(
                   color: Colors.white70,
                   boxShadow: [
                     BoxShadow(
                       offset: Offset(2,2),
                       blurRadius:4

                       )
                   ]
                  ),
                 child: Padding(
                   padding: const EdgeInsets.only(left: 8.0,top: 5),
                   child: Text("  Location:\n"+location,style:TextStyle(fontWeight: FontWeight.bold),),
                 )),
           ):
               SizedBox(),
         ],
       ),
     ),
    );
  }
}
