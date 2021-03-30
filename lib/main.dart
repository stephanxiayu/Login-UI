

import 'package:chat_app_test/login.dart';
import 'package:chat_app_test/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    initialRoute: MyHomePage.id,
    routes: {
      MyHomePage.id: (context)=>MyHomePage(),
      Registration.id: (context)=>Registration(),
      Login.id:(context)=>Login(),
      ChatPage.id:(context)=>ChatPage(),
    },
  ));
}


class MyHomePage extends StatelessWidget {
static const String id= "HOMESCREEN";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Row(
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
         SizedBox(height: 50,),
            CustomButton(text: "Login",
            callback: (){Navigator.of(context).pushNamed(Login.id);},),

           
            CustomButton(text: "Register",
            callback: (){Navigator.of(context).pushNamed(Registration.id);},)

      ],)
      
    );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback callback;
  final String text;

  const CustomButton({Key key, this.callback, this.text}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Material(
        elevation: 8.0,
        borderRadius: BorderRadius.circular(30),
        child:MaterialButton(onPressed: callback,
        minWidth: 200.0,
        height: 45,
        child: Text(text),
        )
        
         ,),
    );
  }
}




class ChatPage extends StatefulWidget {
  static const String id= "CHATPAGE";
   final User user;
   const ChatPage({Key key, this.user}) : super(key: key);
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}