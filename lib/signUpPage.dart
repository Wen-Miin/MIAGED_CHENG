import 'package:flutter/material.dart';
import 'package:miaged/loginPage.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Body());
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      //child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Inscris-toi ! ",
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
                    onChanged: (value) {},
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
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
                    onPressed: () {},
                    //onPressed: () {
                    //  Navigator.push(
                    //    context,
                    //    MaterialPageRoute(
                    //      builder: (context) {
                    //        return LoginPage(); // TODO : redirection
                    //      },
                    //    ),
                    //  );
                    //},
                    child: Text(
                      "S'inscrire",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Déjà un compte ? "),
                  GestureDetector(
                    onTap: () {
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
                      "Se connecter",
                      style: TextStyle(
                          color: Colors.cyan, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ]
        ),
      //),
    );
  }
}
