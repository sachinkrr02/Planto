import 'package:flutter/material.dart';
import 'package:planto/pages/homepage.dart';
import 'package:planto/pages/loginSignup/login.dart';
import 'package:planto/pages/loginSignup/signup.dart';

class LoginHome extends StatelessWidget {
  const LoginHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Align(
          alignment: Alignment(0.5, 1),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
              shape: CircleBorder(),
              backgroundColor: Colors.lightGreen,
            ),
            child: Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Image.asset('assets/lo1.png'),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
            child: const Text(
              "Welcome to Planto",
              style: TextStyle(
                fontSize: 60,
              ),
              softWrap: true,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                  primary: Colors.black,
                  shape: const RoundedRectangleBorder(),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage()),
                  );
                },
                child: Text(
                  "Signup",
                  style: TextStyle(fontSize: 19, color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  backgroundColor: Colors.lightGreen,
                ),
                child: Icon(
                  Icons.arrow_forward,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already got an account?",
                style: TextStyle(fontSize: 16),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Loginpage(),
                      ),
                    );
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 20, color: Colors.lightGreen),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
