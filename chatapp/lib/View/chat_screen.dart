import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {

const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() {
    return ChatScreenState();
  }
}

class ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat screen'),
      actions: [IconButton(onPressed: (){
        FirebaseAuth.instance.signOut();
      }, 
      icon: Icon(Icons.logout,
      color: Theme.of(context).colorScheme.primary),
      ),
      ],
      ),
      body: Text('Logged in'),
      );
  }
}