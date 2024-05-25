import 'package:flutter/material.dart';
import 'package:synthese/Chatbot.dart';
import 'package:synthese/contacts.dart';
import 'package:synthese/meteo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
              'Home Page',
              style: TextStyle(
                color: Colors.cyan,
                fontSize: 20,
              )
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              const DrawerHeader(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/Anass.png'),
                    radius: 80,
                  )
              ),
              ListTile(
                title: const Text('Home'),
                onTap: () {
                },
                leading: const Icon(
                  Icons.home,
                  color: Colors.cyan,
                ),
              ),
              ListTile(
                  title: const Text('Contacts'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Contacts()),
                    );
                  },
                  leading: const Icon(
                    Icons.contacts,
                    color: Colors.cyan,
                  )
              ),
              ListTile(
                title: const Text('Meteo'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Meteo()),
                  );
                },
                leading: const Icon(
                  Icons.cloud,
                  color: Colors.cyan,
                ),
              ),
              ListTile(
                title: const Text('Chatbot'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Chatbot()),
                  );
                },
                leading: const Icon(
                  Icons.chat,
                  color: Colors.cyan,
                ),
              ),
            ],
          ),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
            },
            child: const Icon(Icons.add)
        )
    );
  }
}

