import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'cartPage.dart';
import 'homePage.dart';
import 'loginPage.dart';
import 'models/users.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Users user = Users('ID', 'LOGIN', 'PASSWORD', DateTime.now(), 'ADRESSE', 'CODE POSTAL','VILLE');
  //late Users user;

  final _formKey = GlobalKey<FormState>();
  int id = 1;
  late String _login;
  late String _password;
  late DateTime _birthday;
  late String _address;
  late String _postalCode;
  late String _city;

    int _selectedIndex = 2;

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
        break;
      case 1:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Cart()));
        break;
      case 2:
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => ProfilePage()));
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  //static Users getUser(DocumentSnapshot bdd_users) {
  //  final data = bdd_users.data() as Map<String, dynamic>;
  //  return Users(
  //    id:data['id'],
  //    login: data['login'],
  //    password: data['password'],
  //    birthday: data['anniversaire'],
  //    address: data['adresse'],
  //    postalCode: data['code postal'],
  //    city: data['ville'],
  //  );
  //}

  //Future<Users?> getUserByID(String id) async {
  //  final bdd_users = await _firestore.collection('users').doc(id).get();
  //  if (bdd_users.exists) {
  //    return Users(
  //      id: bdd_users.id,
  //      login: bdd_users.get('login'),
  //      password: bdd_users.get('password'),
  //      birthday: bdd_users.get('birthday').toDate(),
  //      address: bdd_users.get('address'),
  //      postalCode: bdd_users.get('postalCode'),
  //      city: bdd_users.get('city'),
  //    );
  //  } else {
  //    return null;
  //  }
  //}

  //void _getUser() async {
  //  Users user = Users('', '', '', DateTime.now(), '', '','');
  //  final bdd_users = await FirebaseFirestore.instance.collection('users').get();
  //  if (bdd_users.docs.isNotEmpty) {
  //    setState(() {
  //     user.id = bdd_users.docs[id].get('id') as String;
  //     user.login = bdd_users.docs[id].get('login');
  //     user.password = bdd_users.docs[id].get('password');
  //     user.birthday = bdd_users.docs[id].get('birthday').toDate();
  //     user.address = bdd_users.docs[id].get('address');
  //     user.postalCode = bdd_users.docs[id].get('postalCode');
  //     user.city = bdd_users.docs[id].get('city');
  //     print(user.login);
  //     user = Users(
  //         user.id,
  //         user.login,
  //         user.password,
  //         user.birthday,
  //         user.address,
  //         user.postalCode,
  //         user.city);
  //    });
  //  } else {
  //    print('Document vide !');
  //  }
  //  //return user;
  //}

  Future<Users> getUser() async {
    print("récupération user");
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('users');
    QuerySnapshot querySnapshot = await collectionReference.get();
    for (var champs in querySnapshot.docs) {
      user = (Users(champs["id"],champs["login"], champs["password"], champs["birthday"], champs["address"],
          champs["postalCode"],champs["city"]));
    }
    return user;
  }

  //Users user = _auth.currentUser;
  //if (user != null) {
  //String uid = user.uid;
  //String email = user.email!;
  //}


  @override
  Widget build(BuildContext context) {
    //final user = widget.user;
    final loginController = TextEditingController(text: user.login);
    final passwordController = TextEditingController(text: user.password);
    final birthdayController = TextEditingController(text: user.birthday.toString());
    final addressController = TextEditingController(text: user.address);
    final postalCodeController = TextEditingController(text: user.postalCode);
    final cityController = TextEditingController(text: user.city);


    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Login'),
                controller: loginController,
                //initialValue: user.login,
                readOnly: true,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                controller: passwordController,
                //initialValue: user.password,
                obscureText: true,
                readOnly: true,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: 'Anniversaire'),
                controller: birthdayController,
                //initialValue: user.birthday.toString(),
                readOnly: true,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: 'Adresse'),
                controller: addressController,
                //initialValue: user.address,
                onChanged: (value) => _address = value,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: 'Code postal'),
                controller: postalCodeController,
                //initialValue: user.postalCode,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChanged: (value) => _postalCode = value,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: 'Ville'),
                controller: cityController,
                //initialValue: user.city,
                onChanged: (value) => _city = value,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Enregistrer les données dans la base de données
                    user.login = _login;
                    user.password = _password;
                    user.birthday = _birthday;
                    user.address = _address;
                    user.postalCode = _postalCode;
                    user.city = _city;

                    // Naviguer vers la page de validation
                    /*Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      //builder: (context) => ValidationPage(),
                      builder: (context) => ProfilePage(),
                    ),
                  );*/
                  }
                },
                child: Text('Valider'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () {
                    // Se déconnecter et naviguer vers la page de login
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  child: Text('Se déconnecter')),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Acheter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Panier',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pinkAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
