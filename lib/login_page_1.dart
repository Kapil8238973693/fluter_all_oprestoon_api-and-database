import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page_design_project_assignment/Page_1_api/page_1.dart';
class Login_page_1 extends StatefulWidget {
  const Login_page_1({Key? key}) : super(key: key);

  @override
  State<Login_page_1> createState() => _Login_page_1State();
}
class _Login_page_1State extends State<Login_page_1>{
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Icon(
                  Icons.apple_rounded,
                  size: 150,
                ),
                SizedBox(
                  height: 45,
                ),
                Text(
                  "Hello Again!",
                  style: GoogleFonts.aboreto(
                    fontSize: 52,
                    //fontWeight: FontWeight.bold,
                  ),
                  //TextStyle(
                  //   fontWeight: FontWeight.bold,
                  //   fontSize: 36,
                  // ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Welcome back, you\'ve been missed!",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                // email  textfild
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextFormField(
                        style: TextStyle(color: Colors.black, fontSize: 15),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Email';
                          }
                          if (value.length < 20) {
                            return 'Enter Valid Email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Email'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // password textfild
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextFormField(
                        style: TextStyle(color: Colors.black, fontSize: 15),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Password';
                          }

                          if (value.length < 8) {
                            return 'Enter Valid password';
                          }

                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Password',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // sign in button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: InkWell(
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return Page_1();
                          },
                        ));
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                //not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'not a member?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ' register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
