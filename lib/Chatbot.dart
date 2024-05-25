import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'Service/api_service.dart';
import 'Model/ChatMessage.dart';

class Chatbot extends StatefulWidget {
  const Chatbot({Key? key}) : super(key: key);

  @override
  _ChatbotState createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];
  final Dio dio = Dio();
  late ApiService client;

  @override
  void initState() {
    super.initState();
    client = ApiService(dio);
  }

  Future<void> sendMessage(String message) async {
    setState(() {
      _messages.add(ChatMessage(message: message, isSentByUser: true));
    });

    final response = await client.sendMessage('182180', 'WYrhjYe0s188n4L9', '[uid]', message);

    setState(() {
      _messages.add(ChatMessage(message: response, isSentByUser: false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatbot'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ListTile(
                  title: Text(message.message),
                  subtitle: Text(message.isSentByUser ? 'You' : 'Chatbot'),
                );
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Enter message',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  sendMessage(_controller.text);
                  _controller.clear();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}