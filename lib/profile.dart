import 'package:attendence_app/model/user.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  double screenheight=0;
  double screenwidth=0;
  Color primary=Color(0xffeef444c);
  String birth="Date of birth";

  TextEditingController firstNameController=TextEditingController();
  TextEditingController lastNameController=TextEditingController();
  TextEditingController addressController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    screenwidth=MediaQuery.of(context).size.width;
    screenheight=MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 80,bottom: 24),
              height: 100,
              width: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: primary,
              ),
              child: Center(
                  child: Icon(Icons.person,
                  color: Colors.white,
                  size:80,
                  ),
              ),
            ),
            Align(
              alignment: Alignment.center,
                child: Text("Employee ${User.employeeId}",
                style: TextStyle(fontSize: 20,)
                ),
            ),
            SizedBox(height: 24),
            textField("First Name","First name",firstNameController),
            textField("Last Name","Last name",lastNameController),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(birth,
              style: TextStyle(
                color: Colors.black87
              ),),
            ),
            GestureDetector(
              onTap: ()async{
                final month= await showDatePicker(
                    context: context,
                    initialDate:DateTime.now() ,
                    firstDate: DateTime(1950),
                    lastDate: DateTime.now(),
                  builder: (context,child){
                      return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.light(
                              primary: primary,
                              secondary: primary,
                              onSecondary: Colors.white,
                            ),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                primary: primary,
                              )
                            ),
                            textTheme: TextTheme(
                              headline4: TextStyle(
                                fontSize: 18,
                              )
                            )
                          ),
                          child: child!
                      );
                  }
                ).then((value) {
                  setState(() {
                    birth=DateFormat("MM/dd/yyyy").format(value!);
                  });
                });
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 12),
                height: kToolbarHeight,
                width: screenwidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: Colors.black54,
                  ),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    birth,
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize:16,
                    ),
                  ),
                ),
              ),
            ),
            textField("Address","Address",addressController),
            GestureDetector(
              onTap: ()async{
                String firstname=firstNameController.text;
                String lastname=lastNameController.text;
                String birthDate=birth;
                String address=addressController.text;
                if(User.conEdit){
                if(firstname.isEmpty){
                  showSnackBox("Please enter Firstname");
                }else if(lastname.isEmpty) {
                  showSnackBox("Please enter lastname");
                }else if(birth.isEmpty) {
                  showSnackBox("Please enter Date of Birth");
                }  else if(address.isEmpty) {
                  showSnackBox("Please enter Address");
                }else {
                  showSnackBox(
                      "you can't edit anymore,please contact support system team");
                }
                }
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 12),
                height: kToolbarHeight,
                width: screenwidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                    color: primary,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize:16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textField(String hint,String title,TextEditingController controller){
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 15),
          child: TextFormField(
            controller: controller,
            cursorColor: Colors.black45,
            maxLines: 1,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.black),

              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black,),
              ),

              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black,),
              ),
            ),
          ),
        ),
      ],
    );
  }
  void showSnackBox(String text){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
          content: Text(
            text
          )
      )
    );
  }
}