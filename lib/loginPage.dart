import 'package:flutter/material.dart';
import 'package:miaged/signUpPage.dart';

class LoginPage extends StatelessWidget {
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
                  child: PasswordField(),
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


// TODO : faire fonctionner l'icone visibilité du mot de passe
class PasswordField extends StatefulWidget {
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context){
    return TextField(
      onChanged: (value) {},
      obscureText: true,
      decoration: InputDecoration(
        icon: Icon(Icons.lock),
        suffixIcon: Icon(Icons.visibility),
        hintText: "Mot de passe",
        fillColor: Colors.teal.shade100,
      ),
    );
  }
}

