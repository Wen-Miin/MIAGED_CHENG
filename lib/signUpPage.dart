import 'package:flutter/material.dart';
import 'package:miaged/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignUpPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isObscured = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  Future<void> _createUserWithEmailAndPassword() async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // User creation successful
      // Do something with the userCredential, such as storing user data in Firestore
      //print('User created: ${userCredential.user.email}');
    } on FirebaseAuthException catch (e) {
      // User creation failed
      // Handle the error, such as displaying an error message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('MIAGED - SignUp Page'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: size.height,
        //child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          Text(
            "Inscris-toi ! ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          SizedBox(height: 25),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            width: size.width * 0.8,
            decoration: BoxDecoration(
                color: Colors.teal, borderRadius: BorderRadius.circular(29)),
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
                //validator: (value) {
                //if (value.isEmpty) {
                //return 'Veuillez saisir votre adresse e-mail';
                //}
                //return null;
                //},
              )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: size.width * 0.8,
            child: TextField(
              onChanged: (value) {},
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                suffixIcon: IconButton(
                    icon: Icon(
                        _isObscured ? Icons.visibility : Icons.visibility_off),
                    onPressed: _togglePasswordVisibility),
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
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                onPressed: () {
                  //if (_formKey.currentState.validate()) {
                  //_createUserWithEmailAndPassword();
                  //}
                },
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
        ]),
      ),
    );
  }
}
