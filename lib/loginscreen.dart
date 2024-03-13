import 'package:attendence_app/homescreen.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController idController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  double screenheight=0;
  double screenwidth=0;

  Color primary=Color(0xffeef444c);
  late SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    final bool isKeyboardVisible=KeyboardVisibilityProvider.isKeyboardVisible(context);
    screenwidth=MediaQuery.of(context).size.width;
    screenheight=MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            isKeyboardVisible ?  SizedBox(height: screenheight/16,):Container(
              margin: EdgeInsets.only(bottom: screenheight/20),
              height: screenheight/3.5,
              width: screenwidth,
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(70),
                )
              ),
              child: Center(
                child: Icon(Icons.person,color: Colors.white,size: screenwidth/5),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:5,bottom: screenheight/50,),
              child:Text("Login" ,style: TextStyle(fontSize: screenwidth/15,fontWeight: FontWeight.bold),
              ),
            ),
            Container(
             alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(horizontal: screenwidth/20),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  fieldText("Employee ID"),
                  customField("Enter your employee id",idController,false),
                  fieldText("Password"),
                  customField("Enter your employee id",passwordController,true),
                  GestureDetector(
                    onTap: ()async {
                      FocusScope.of(context).unfocus();
                      String id = idController.text.trim();
                      String password = passwordController.text.trim();
                      if (id.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Employee id is still empty"),
                            ));
                      } else if (password.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Password id is still empty"),
                            ));
                      } else {
    // QuerySnapshot snap = await FirebaseFirestore.instance
    //     .collection("Employee")
    //     .where('id', isEqualTo: id)
    //     .get();
    //
    // try {
    //   if (password == snap.docs[0]['password']) {
    // sharedPreferences=await SharedPreferences.getInstance();
    // sharedPreferences.setString('employeeId', id).then((_) => {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen())
            );
   // });
                         //   }else{
                        //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        //       content: Text("password is not correct!"),
                        //     ));
                        //   }
                        // } catch (e) {
                        // String error=" ";
                        // if(e.toString()=="RangeError(index):Invalid value: Valid value range is empty:0")
                        // {
                        //   setState(() {
                        //     error="Employee id does not exist";
                        //   });
                        // }else{
                        //   setState(() {
                        //     error="Error occured!";
                        //   });
                        // }
                        // ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                        //   content: Text(error),
                        // ));
                        // }
                    }
                      },
                    child: Container(
                      height: 45,
                      margin: EdgeInsets.only(top:20),
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      child: Center(
                        child: Text("Login",style: TextStyle(fontSize: 22,color: Colors.white,letterSpacing: 2),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget fieldText(String title){
    return Container(
        margin: EdgeInsets.only(bottom:2),
        child: Center(
          child: Text(title,
          style: TextStyle(fontSize: screenwidth/25),
          ),
        ),
      );
    }
  Widget customField( String hinttext,TextEditingController controller,bool obscure ){
    return Container(
      width: screenwidth/1.2,
      margin: EdgeInsets.only(bottom: screenheight/60),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(2,2),
              blurRadius: 10,
            )
          ]
      ),
      child: Row(
        children: [
          Container(
            width: screenwidth/10,
            child: Icon(Icons.person,color: primary,size: screenwidth/15),
          ),
          Expanded(
              child: Padding(
                padding:  EdgeInsets.only(right: screenwidth / 12),
                child: TextFormField(
                  controller: controller,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: screenheight/30),
                      border: InputBorder.none,
                      hintText: hinttext,
                  ),
                  maxLines: 1,
                  obscureText:obscure ,
                ),
              )
          )
        ],
      ),
    );
  }
  }
