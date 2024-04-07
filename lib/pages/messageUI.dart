import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<String> _messages = []; // List to store messages
  final TextEditingController _textController =
      TextEditingController(); // Controller for text input

  // Function to send message
  void _sendMessage(String message) {
    setState(() {
      _messages.insert(
          0, message); // Insert message to the beginning of the list
    });
    _textController.clear(); // Clear the text input field after sending message
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              reverse:
                  true, // Reverse the list to show latest messages at the bottom
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_messages[index]),
                  // You can customize message appearance here
                );
              },
            ),
          ),
          Divider(
              height: 1.0), // Divider to separate message list and input field
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor, // Use card color from theme
            ),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  // Function to build text input field and send button
  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(
          color: Theme.of(context)
              .colorScheme
              .secondary), // Use accent color for icon
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _sendMessage,
                decoration: InputDecoration.collapsed(
                  hintText: 'Type a message',
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                if (_textController.text.isNotEmpty) {
                  _sendMessage(_textController.text);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
