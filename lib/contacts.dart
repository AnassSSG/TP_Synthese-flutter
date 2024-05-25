import 'package:flutter/material.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _contacts = [];

  void _addContact() {
    setState(() {
      _contacts.add(_controller.text);
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter contact name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _addContact,
            child: Text('Save Contact'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _contacts.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text(_contacts[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}