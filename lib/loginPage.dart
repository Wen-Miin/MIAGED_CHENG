import 'package:flutter/material.dart';
import 'package:miaged/signUpPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'homePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isLoading = false;
  bool _isObscured = true;

  @override
  void dispose() { // libérer la mémoire occupée par les objets emailController et passwordController
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  void _login() async {
    setState(() {
      _isLoading = true;
    });

    Future<User?> authenticate(String email, String password) async {
      try {
        UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        User? user = userCredential.user;
        return user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
        return null;
      } catch (e) {
        print(e.toString());
        return null;
      }
    }

    // Envoyer les informations d'identification au backend pour vérification
    final user = await authenticate(
        emailController.text, passwordController.text);

    setState(() {
      _isLoading = false;
    });

    if (user != null) {
      // Stocker les informations de profil de l'utilisateur dans une variable globale
      //User.currentUser = user;

      // Naviguer vers la page suivante
      //Navigator.pushReplacementNamed(context, '/home');

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomePage(); // TODO : redirection
          },
        ),
      );
    } else {
      // Afficher un message d'erreur si les informations d'identification sont incorrectes
      showDialog(
        context: context,
        builder: (_) =>
            AlertDialog(
              title: Text('Erreur de connexion'),
              content: Text(
                  'Veuillez vérifier vos informations d\'identification et réessayer.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
        title: Text('MIAGED - Login Page'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
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
                  obscureText: _isObscured,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(_isObscured ? Icons.visibility : Icons.visibility_off),
                      onPressed: _togglePasswordVisibility,
                    ),
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
                    onPressed: _login,
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
