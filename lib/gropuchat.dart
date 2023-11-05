import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GroupChatPage extends StatefulWidget {
  @override
  _GroupChatPageState createState() => _GroupChatPageState();
}

class _GroupChatPageState extends State<GroupChatPage> {
  final _messages = <ChatMessage>[];
  final _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();

    // Listen for new messages in the group chat
    _firestore.collection('group_chats').doc('my_group_chat').collection('messages').snapshots().listen((snapshot) {
      setState(() {
        _messages.clear();
        for (var document in snapshot.docs) {
          _messages.add(ChatMessage(sender: document.data()['sender'], message: document.data()['message']));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Group Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ChatMessageBubble(message: _messages[index]);
              },
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Type your message here...',
            ),
            onSubmitted: (message) {
              // Send the message to Firebase
              _firestore.collection('group_chats').doc('my_group_chat').collection('messages').add({
                'sender': 'You',
                'message': message,
              });
            },
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String sender;
  final String message;

  ChatMessage({required this.sender, required this.message});
}

class ChatMessageBubble extends StatelessWidget {
  final ChatMessage message;

  ChatMessageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message.sender, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(message.message),
          ],
        ),
      ),
    );
  }
}