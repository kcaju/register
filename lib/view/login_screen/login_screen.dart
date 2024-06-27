import 'dart:math';

import 'package:flutter/material.dart';
import 'package:testing/dummy_db.dart';
import 'package:testing/view/home_screen/home_screen.dart';
import 'package:testing/view/registeration_screen/registeration_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailkey = TextEditingController();
    TextEditingController passkey = TextEditingController();
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sign in to Your Account",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: emailkey,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter a valid Email";
                  } else if (value.contains("@")) {
                    return null;
                  } else {
                    return "Invalid Email Address";
                  }
                },
                decoration: InputDecoration(
                    hintText: "Your Email Address",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passkey,
                validator: (value) {
                  if (value!.length >= 6) {
                    return null;
                  } else {
                    return " Enter a vaild password";
                  }
                },
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Your Password",
                    hintStyle: TextStyle(color: Colors.grey),
                    suffixIcon: Icon(
                      Icons.visibility_off,
                      color: Colors.grey.withOpacity(0.4),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Icon(Icons.check_box_outlined),
                  Text(
                    "Remember Me",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  Spacer(),
                  Text(
                    "Forgot Password",
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        backgroundColor: WidgetStatePropertyAll(Colors.blue)),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        if (emailkey.text == DummyDb.email1 &&
                            DummyDb.passwo == passkey.text) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                            (route) => false,
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.red,
                              content: Text("Invalid credentials")));
                        }
                      }
                    },
                    child: Text(
                      "Sign in",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterationScreen(),
                          ));
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
