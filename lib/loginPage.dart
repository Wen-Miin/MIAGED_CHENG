import 'package:flutter/material.dart';
import 'package:miaged/signUpPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'homePage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Connecte-toi ! ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(height: 25),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(29)),
              ),
              //TextFormField(initialValue: "xyz@gmail.com"),
              SizedBox(height: size.height * 0.03),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  width: size.width * 0.8,
                  child: TextField(
                    controller: emailController,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: "Email",
                      fillColor: Colors.teal.shade100,
                    ),
                  )),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  width: size.width * 0.8,
                  child: TextField(
                    controller: passwordController,
                    onChanged: (value) {},
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      // TODO : faire fonctionner l'icone visibilité du mot de passe
                      suffixIcon: Icon(Icons.visibility),
                      hintText: "Mot de passe",
                      fillColor: Colors.teal.shade100,
                    ),
                  ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                child: SizedBox(
                  //height: 100,
                  //width: 200,
                  width: size.width * 0.8,
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                    //onPressed: () {},
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return HomePage(); // TODO : redirection
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Se connecter",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Pas de compte ? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignUpPage();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Créer un compte",
                      style: TextStyle(
                          color: Colors.cyan, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ]),
      ),
    );
  }


}

