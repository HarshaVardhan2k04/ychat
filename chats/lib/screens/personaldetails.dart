// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class PersonalDetailsScreen extends StatefulWidget {
  final VoidCallback onPersonalDetailsHandled;

  const PersonalDetailsScreen({super.key, required this.onPersonalDetailsHandled});

  @override
  _PersonalDetailsScreenState createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  bool isEditing = false;
  TextEditingController nameController = TextEditingController(text: 'V.James Prabhakar');
  TextEditingController studiesController = TextEditingController(text: 'MREC College');
  TextEditingController skillsController = TextEditingController(text: 'UI/UX Designer, Flutter Developer,\nWeb developer');
  TextEditingController workController = TextEditingController(text: 'Designer at Celume Studios');
  TextEditingController hobbiesController = TextEditingController(text: 'Singing');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('PERSONAL DETAILS'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            const SizedBox(height: 20),
            buildDetailRow('Name', nameController),
            buildDetailRow('Studies', studiesController),
            buildDetailRow('Skills', skillsController),
            buildDetailRow('Work', workController),
            buildDetailRow('Hobbies', hobbiesController),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isEditing = !isEditing;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    side: const BorderSide(color: Colors.grey),
                  ),
                  child: Text(isEditing ? 'Cancel' : 'Edit'),
                ),
                ElevatedButton(
                  onPressed: isEditing ? () {
                    setState(() {
                      isEditing = false;
                    });
                  } : () {
                    widget.onPersonalDetailsHandled();  // Call the passed callback function
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                  ),
                  child: const Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDetailRow(String title, TextEditingController controller) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: isEditing
                    ? TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          isDense: true,
                          contentPadding: EdgeInsets.all(8),
                        ),
                      )
                    : Text(controller.text),
              ),
            ],
          ),
        ),
        const Divider(color: Colors.grey),
      ],
    );
  }
}
