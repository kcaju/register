import 'package:flutter/material.dart';
import 'package:testing/dummy_db.dart';
import 'package:testing/view/login_screen/login_screen.dart';

class RegisterationScreen extends StatelessWidget {
  const RegisterationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController pass = TextEditingController();
    TextEditingController pass1 = TextEditingController();
    TextEditingController emailkey = TextEditingController();

    GlobalKey<FormState> _formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Sign Up for Free",
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
                controller: pass,
                validator: (value) {
                  if (value == null) {
                    return "Enter a password";
                  } else if (value.length >= 6) {
                    return null;
                  } else {
                    return "Enter a password";
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
                height: 20,
              ),
              TextFormField(
                controller: pass1,
                validator: (value) {
                  if (pass.text == pass1.text) {
                    return null;
                  } else {
                    return "Password is not matching";
                  }
                },
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Your Confirm Password",
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
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        backgroundColor: WidgetStatePropertyAll(Colors.blue)),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        DummyDb.email1 = emailkey.text;
                        DummyDb.passwo = pass.text;
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ));
                      }
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
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
                            builder: (context) => LoginScreen(),
                          ));
                    },
                    child: Text(
                      "Sign In",
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
