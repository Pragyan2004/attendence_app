
import 'package:attendence_app/calander.dart';
import 'package:attendence_app/model/user.dart';
import 'package:attendence_app/profile.dart';
import 'package:attendence_app/services/location.dart';
import 'package:attendence_app/today.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double screenheight=0;
  double screenwidth=0;
  String id='';

  Color primary=Color(0xffeef444c);
  int currentIndex=0;
  List<IconData> navigationIcon=[
    FontAwesomeIcons.calendarAlt,
    FontAwesomeIcons.check,
    FontAwesomeIcons.user,
  ];
  @override
  void initState(){
    super.initState();
      _startLocationService();

  }

  void _startLocationService()async{
    LocationServices().initialize();
    LocationServices().getLongitude().then((value){
      setState(() {
          User.long=value!;
      });

      LocationServices().getLatitude().then((value){
        setState(() {
          User.lat=value!;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
     screenwidth=MediaQuery.of(context).size.width;
    screenheight=MediaQuery.of(context).size.height;
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
          children: [
            new CalanderScreen(),
            new TodayScreen(),
            new ProfileScreen(),
          ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        margin: EdgeInsets.only(left: 17,right: 12,bottom: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(40)),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(2,2),
            )
          ]
        ),
        child: ClipRRect(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i=0;i<navigationIcon.length;i++)...<Expanded>{
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        currentIndex=i;
                      });
                    },
                    child: Container(
                      height: screenheight,
                      width: screenwidth,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              navigationIcon[i],
                              color: i== currentIndex?primary:Colors.black54,
                              size: i==currentIndex?30:25,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 6),
                              height: 3,
                              width: 24,
                              decoration: BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.all(Radius.circular(40)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              }
            ],
          ),
        ),
      ),
    );
  }
}
