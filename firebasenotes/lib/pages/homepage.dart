import 'package:firebasenotes/services/firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // firestore
  final FirestoreService firestoreService = FirestoreService();

  // text controller
  final TextEditingController textController = TextEditingController();

  // open dialog box to add note
  void openNoteBox() {
    showDialog(context: context, builder: (context) => AlertDialog(
      content: TextField(
        controller: textController,
        ),
        actions: [
          // button to save
          ElevatedButton(
            onPressed: () {
              // add new note
              firestoreService.addNote(textController.text);

              // clear text field
              textController.clear();

              // close dialog boc
              Navigator.pop(context);
            }, 
            child: const Text('Add')
      )
        ]
        ),
      );
    }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notes')),
      floatingActionButton: FloatingActionButton(
        onPressed: openNoteBox,
        child: const Icon(Icons.add),
        ),
    );
  }
  }

  
