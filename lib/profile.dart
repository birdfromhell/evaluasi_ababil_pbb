  import 'package:flutter/material.dart';

  void main() {
    runApp(MyApp());
  }

  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false, 
        home: ProfilePage(),
      );
    }
  }

  class ProfilePage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Profile Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/id/thumb/2/2c/Analis_Bdg.JPG/242px-Analis_Bdg.JPG'), 
                ),
              ),
              SizedBox(height: 10),
              Text(
                'XII RPL 2',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'SMKN 13 Bandung , West Java', 
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {

                },
                child: Text('Edit Profile'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {

                },
                child: Text('Log Out'),
              ),
            ],
          ),
        ),
      );
    }
  }