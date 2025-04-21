import 'package:flutter/material.dart';
import 'package:my_first_project/utility/utilities.dart';
import 'package:my_first_project/views/home/home-screen.dart';
// Make sure this file exists

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailText = TextEditingController();
  final TextEditingController passwordText = TextEditingController();

  String errorMessage = '';

  void _handleLogin() {
    String email = emailText.text;
    String password = passwordText.text;

    setState(() {
      errorMessage = '';
    });

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        errorMessage = "Email or password cannot be empty";
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email or password cannot be empty')),
        );
      });
      return;
    }

    if (email == "swetha25@gmail.com" && password == "swetha25") {
      setState(() {
        errorMessage = "Login Successful!";
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Login sucessfull")));
      });
      // You can navigate to a home screen here
      Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
    } else {
      setState(() {
        errorMessage = "Incorrect email or password.";
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Incorrect email or password")),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 60, top: 20, bottom: 20),

                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: Text(
                        "Let's Start with \nLogin",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 34,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 50, horizontal: 15),
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            controller: emailText,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.grey),
                              // fillColor: Colors.black,
                              labelText: "Email or Phone",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            controller: passwordText,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.grey),
                              labelText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                // errorMessage =
                                //     "Forgot password feature not implemented.";
                              });
                            },
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        // if (errorMessage.isNotEmpty)
                        //   Padding(
                        //     padding: const EdgeInsets.only(top: 10),
                        //     child: Text(
                        //       errorMessage,
                        //       style: TextStyle(
                        //         color:
                        //             errorMessage == "Login Successful!"
                        //                 ? Colors.green
                        //                 : Colors.red,
                        //         fontWeight: FontWeight.bold,
                        //       ),
                        //     ),
                        //   ),
                        SizedBox(height: 60),
                        SizedBox(
                          height: 40,

                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _handleLogin,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: getColorFromHex("BC2954"),
                              padding: EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(bottom: 40, top: 20),
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                    ),
                    child: Center(
                      // child: RichText(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            "Register",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              // decoration: TextDecoration.underline,
                            ),
                            // Navigator.push(
                            //           context,
                            //           MaterialPageRoute(
                            //             builder: (context) => RegisterPage(),
                            //           ),
                            //         );
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
