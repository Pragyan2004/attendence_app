import 'package:attendence_app/homescreen.dart';
import 'package:attendence_app/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        useMaterial3: true,
      ),
      home: const KeyboardVisibilityProvider(
        child: HomeScreen(),
          // child: LoginScreen(),
      ),
    );
  }
}
//
// class AuthCheck extends StatefulWidget {
//   const AuthCheck({super.key});
//
//   @override
//   State<AuthCheck> createState() => _AuthCheckState();
// }
//
// class _AuthCheckState extends State<AuthCheck> {
//   bool userAvailabe =false;
//   late SharedPreferences sharedPreferences;
//
//   @override
//   void initState(){
//     super.initState();
//
//   }
//   void _getCurrentUser()async {
//     sharedPreferences = await SharedPreferences.getInstance();
//     try {
//       if(sharedPreferences.getString('employeeId')!=" "){
//         setState(() {
//           userAvailabe=true;
//         });
//       }
//     } catch (e) {
//       setState(() {
//          userAvailabe=false;
//        });
//      }
//    }
//    @override
//    Widget build(BuildContext context) {
//      return userAvailabe?  HomeScreen(): LoginScreen();
//    }
//  }

