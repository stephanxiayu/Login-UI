import 'package:chat_app_test/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  static const String id= "LOGIN";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
     String _email, _password;
  final auth = FirebaseAuth.instance;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        
         mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

        SingleChildScrollView(
                  child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(tag: "logo", child: Container(
                width: 100,
                child: Image.asset("lib/assets/m1.png"),
              )),
              Text("M. Chat",
              style: TextStyle(fontSize: 40),),
             
            ],
          ),
        ),
        SizedBox(height: 50,),
        TextField(
            onChanged: (value) {
                  setState(() {
                    _email = value.trim();
                  });
                },
         autocorrect: false,
          decoration: InputDecoration(hintText: "Enter Your Email..."),
        ),
        SizedBox(height: 40,),
        TextField(  onChanged: (value) {
                  setState(() {
                    _password = value.trim();
                  });
                },
           autocorrect: false,
          decoration: InputDecoration(hintText: "Enter Your Password..."),
        ),
         SizedBox(height: 50,),
        CustomButton(text: "Login",
        
        callback: (){
                        auth.signInWithEmailAndPassword(
                                email: _email, password: _password).then((_) {Navigator.of(context).pushNamed(ChatPage.id);});
                      }),

        
      ],),
      
    );
  }
}