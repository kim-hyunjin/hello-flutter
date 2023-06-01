import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chat')
            .orderBy('createdAt', descending: false)
            .snapshots(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('No messages found.'),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong...'),
            );
          }

          final loadedMsg = snapshot.data!.docs;

          return ListView.builder(
            itemCount: loadedMsg.length,
            itemBuilder: (ctx, index) => Text(loadedMsg[index].data()['text']),
          );
        });
  }
}
