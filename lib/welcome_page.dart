import 'package:flutter/material.dart';
import 'package:miaged/loginPage.dart';
import 'package:miaged/signUpPage.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MIAGED - Welcome Page'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            SizedBox(height: 45),
            Text(
              "Bienvenue sur Miaged !",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(height: 75),
            Image.asset(
              "assets/images/MIAGE_LOGO.png",
              width: 200, // TODO : taille à modifier si besoin
            ),
            SizedBox(height: 75),
            Container(
              child: SizedBox(
                //height: 100,
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "LOGIN",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: SizedBox(
                //height: 100,
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
                  onPressed: () {
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
                    "SIGN UP",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
          ]),
        ),
      ),
    );
  }
}
