import 'package:flutter/material.dart';
import 'package:chats/screens/personaldetails.dart';

class Profilepage extends StatelessWidget {
  const Profilepage ({super.key});

  void _handlePersonalDetails(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PersonalDetailsScreen(
                  onPersonalDetailsHandled: () {
                    // Handle what needs to be done after personal details are handled
                    Navigator.pop(
                        context); // Typically, you might pop the screen or update the state
                  },
                )));
  }

  void _handleAttendance() {
    // Add your task here for Attendance
  }

  void _handleWhatsHappening() {
    // Add your task here for What's Happening?
  }

  void _handleAccountReach() {
    // Add your task here for Account Reach
  }

  void _handleAppreciations() {
    // Add your task here for Appreciations
  }

  void _handleSettings() {
    // Add your task here for Settings
  }

  void _handleHelpFeedback() {
    // Add your task here for Help & Feedback
  }

  Widget _buildButton(String text, Image icon, VoidCallback onPressed) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        bool isHovering = false;
        return MouseRegion(
          onEnter: (_) => setState(() => isHovering = true),
          onExit: (_) => setState(() => isHovering = false),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return const Color(0xFFE5A411);
                  }
                  return Colors.white; // Default color
                },
              ),
              foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return Colors.white;
                  }
                  return Colors.black; // Default color
                },
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            child: Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min, // Ensure the row size fits its children
                children: [
                  icon,
                  const SizedBox(width: 16),
                  Text(
                    text,
                    style: TextStyle(
                      color: isHovering ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              // Handle back button press
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                // Handle three-dot menu press
              },
            ),
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.orange, Colors.amber],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    height: 100, // Adjust the height as needed
                  ),
                  const Positioned(
                    top: 50, // Adjust the position as needed
                    left: 16,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          NetworkImage('https://via.placeholder.com/150'),
                    ),
                  ),
                  const Positioned(
                    top: 110, // Adjust the position as needed
                    left: 130, // Adjust the position as needed
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'V. JAMES PRABHAKAR',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Student At MREC\nDesigner In CELUME STUDIOS',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const Alignment(
                        0.8, 0.2), // Adjust the alignment as needed
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text('31 Yaaris'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Builder(
                      builder: (BuildContext context) {
                        return _buildButton(
                            'Personal Details',
                            Image.asset("assets/icons/person.text.rectangle (1).png", width: 24, height: 24),
                            () => _handlePersonalDetails(context));
                      },
                    ),
                    _buildButton(
                        'Attendance',
                        Image.asset("assets/icons/verified.png", width: 24, height: 24),
                        () => _handleAttendance()),
                    _buildButton(
                        "What's Happening?",
                        Image.asset("assets/icons/Connection.png", width: 24, height: 24),
                        () => _handleWhatsHappening()),
                    _buildButton(
                        'Account Reach',
                        Image.asset("assets/icons/Diagram.png", width: 24, height: 24),
                        () => _handleAccountReach()),
                    _buildButton(
                        'Appreciations',
                        Image.asset("assets/icons/hands.sparkles.png", width: 24, height: 24),
                        () => _handleAppreciations()),
                    _buildButton(
                        'Settings',
                        Image.asset("assets/icons/gearshape.png", width: 24, height: 24),
                        _handleSettings),
                    _buildButton(
                        'Help & Feedback',
                        Image.asset("assets/icons/Information.png", width: 24, height: 24),
                        _handleHelpFeedback),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
