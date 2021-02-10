import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:hello_flutter/utils/my_routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changedBtn = false;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/login_image.png",
                  fit: BoxFit.fitHeight,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Welcome $name",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter username",
                          labelText: "Username",
                        ),
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter password",
                          labelText: "Password",
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      InkWell(
                        onTap: () async {
                          setState(() {
                            changedBtn = true;
                          });
                          await Future.delayed(Duration(seconds: 1));
                          Navigator.pushNamed(context, MyRoutes.homeRoute);
                        },
                        child: AnimatedContainer(
                          alignment: Alignment.center,
                          duration: Duration(seconds: 1),
                          width: changedBtn ? 50 : 140,
                          height: 50,
                          decoration: BoxDecoration(
                            // shape: changedBtn
                            //     ? BoxShape.circle
                            //     : BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.circular(changedBtn ? 50 : 8),
                            color: Colors.deepPurple,
                          ),
                          child: changedBtn
                              ? Icon(Icons.done, color: Colors.white)
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                        ),
                      ),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                      //   },
                      //   style: TextButton.styleFrom(minimumSize: Size(140, 40)),
                      //   child: Text(
                      //     "Login",
                      //     style: TextStyle(
                      //       fontSize: 18,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
