import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'welcome_page.dart';

void main() => runApp(MainPage());

class MainPage extends StatelessWidget {
  // This widget is the root of your application.
  //@override
  //Widget build(BuildContext context) => Scaffold(
  //  body: StreamBuilder<User?>(
  //    stream: FirebaseAuth.instance.authStateChanges(),
  //    builder: (context,snapshot){
  //      if(snapshot.hasData){
  //        return HomePage();
  //      } else {
  //        return LoginPage();
  //      }
  //    },
  //  ),
  //);
  //const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
          primaryColor: Colors.teal,
          scaffoldBackgroundColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: Colors.teal,
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Colors.tealAccent,
            iconColor: Colors.teal,
            prefixIconColor: Colors.teal,
            //contentPadding: EdgeInsets.symmetric(
            //    horizontal: defaultPadding, vertical: defaultPadding),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
          )),
      home: WelcomePage(),
    );
  }

}

class MiagedHomePage extends StatefulWidget {
  const MiagedHomePage({super.key, required this.title});

  final String title;

  @override
  State<MiagedHomePage> createState() => _MiagedHomePageState();
}

class _MiagedHomePageState extends State<MiagedHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Home',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            //ElevatedButton(onPressed: _LoginPageState())
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
