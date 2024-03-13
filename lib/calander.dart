import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class CalanderScreen extends StatefulWidget {
  const CalanderScreen({super.key});

  @override
  State<CalanderScreen> createState() => _CalanderScreenState();
}

class _CalanderScreenState extends State<CalanderScreen> {
  double screenheight=0;
  double screenwidth=0;
  Color primary=Color(0xffeef444c);
  @override
  Widget build(BuildContext context) {
    screenwidth=MediaQuery.of(context).size.width;
    screenheight=MediaQuery.of(context).size.height;

    return Scaffold(
      body:SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 32),
              child: Text("My Attendence",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: screenwidth/20),),
            ),
            Stack(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(top: 32),
                  child: Text(DateFormat('MMMM').format(DateTime.now()),style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: screenwidth/20),),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 32),
                  child: Text("Pick A Month",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: screenwidth/20),),
                ),
              ],
            ),
            Container(
                margin: EdgeInsets.only(top: 12,left:6,right:10,bottom: 32),
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.red,
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
                          margin: EdgeInsets.only(),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Center(
                            child: Text(DateFormat('EE\ndd').format(DateTime.now()),style: TextStyle(color: Colors.white),),
                          ),
                        )
                    ),
                    Expanded(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Check In",style: TextStyle(fontSize: screenwidth/20,color: Colors.black54),),
                              Text("11:00",style: TextStyle(fontSize: screenwidth/18,color: Colors.black54,fontWeight: FontWeight.bold)),
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
                              Text("--/--",style: TextStyle(fontSize: screenwidth/18,color: Colors.black54,fontWeight: FontWeight.bold)),
                            ],
                          ),
                        )
                    )
                  ],
                )
            ),
            Container(
                margin: EdgeInsets.only(top: 12,bottom: 32,left:6,right:10),
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.green,
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
                    margin: EdgeInsets.only(),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Center(
                child: Text(DateFormat('EE\ndd').format(DateTime.now()),style: TextStyle(color: Colors.white),),
              ),
            )
      ),
                    Expanded(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Check In",style: TextStyle(fontSize: screenwidth/20,color: Colors.black54),),
                              Text("10:30",style: TextStyle(fontSize: screenwidth/18,color: Colors.black54,fontWeight: FontWeight.bold)),
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
                              StreamBuilder(
                                  stream: Stream.periodic(const Duration(seconds: 1)),
                                  builder: (context,snapshot) {
                                    return Container(
                                      padding: EdgeInsets.only(left: 50),
                                      alignment: Alignment.centerLeft,
                                      child: Text(DateFormat('hh:mm').format(DateTime.now()),
                                          style: TextStyle(fontSize: screenwidth/18,color: Colors.black54,fontWeight: FontWeight.bold)),
                                    );
                                  }),],
                          ),
                        )
                    )
                  ],
                )
            ),
            Container(
                margin: EdgeInsets.only(top: 12,bottom: 32,left:6,right:10),
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.green,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(2,2),
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Row(
                  children: [
                Expanded(
                    child: Container(
                    margin: EdgeInsets.only(),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Center(
                child: Text(DateFormat('EE\ndd').format(DateTime.now()),style: TextStyle(color: Colors.white),),
              ),
            )
      ),
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
                              Text("--/--",style: TextStyle(fontSize: screenwidth/18,color: Colors.black54,fontWeight: FontWeight.bold)),
                            ],
                          ),
                        )
                    )
                  ],
                )
            ),
          ],
        ),
      )
    );
  }
}