import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planto/home/homepage.dart';
import 'package:planto/pages/loginSignup/signup.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signin() async {
    var emailAddress = emailController.text.trim();
    var password = passwordController.text.trim();

    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);

      if (credential.user != null) {
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
        children: [
          Image.asset("assets/lobgr.png"),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Login to your account",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: "Email",
              contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              prefixIcon: Icon(Icons.email_outlined),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              hintText: "Password",
              contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              prefixIcon: Icon(Icons.lock),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () {},
              child: Text("Forgot your password?"),
            ),
          ),
          SizedBox(
            height: 0,
          ),
          ElevatedButton(
            onPressed: () {
              signin();
            },
            child: Text(
              "Sign In",
              style: TextStyle(fontSize: 19, color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen),
          ),
          SizedBox(
            height: 25,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Or Signin with",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/google.png",
                  height: 40,
                  width: 40,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/facebook.png',
                  height: 40,
                  width: 40,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/phone-call.png',
                  height: 40,
                  width: 40,
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: TextStyle(fontSize: 16),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage()),
                  );
                },
                child: Text(
                  'Signup',
                  style: TextStyle(fontSize: 18, color: Colors.lightGreen),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
