import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatMessage {
  final String content;
  final DateTime timestamp;

  ChatMessage(this.content, this.timestamp);
}

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [];
  late ChatMessage _lastMessage; // Variable to store the last message
  OverlayEntry? overlayEntry; // Field to store the overlay entry

  @override
  void initState() {
    super.initState();
    if (_messages.isNotEmpty) {
      _lastMessage = _messages.last;
    }
  }

  void _sendMessage(String message) {
    setState(() {
      final currentTime = DateTime.now();
      final chatMessage = ChatMessage(message, currentTime);
      _messages.add(chatMessage);
      _lastMessage = chatMessage;
    });
  }

  void _handleMessageInput(String message) {
    if (message.isNotEmpty) {
      _sendMessage(message);
      _messageController.clear();
    }
  }

  void showCustomMenu(BuildContext context, Offset offset) {
    OverlayState overlayState = Overlay.of(context);

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx +430, // Adjust this value to position the popup on the right
        top: offset.dy +70, // Adjust this value to position the popup below the chat item
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.reply, color: Colors.amber),
                  onPressed: () {
                    overlayEntry?.remove();
                    overlayEntry = null;
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.amber),
                  onPressed: () {
                    overlayEntry?.remove();
                    overlayEntry = null;
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.emoji_emotions, color: Colors.amber),
                  onPressed: () {
                    overlayEntry?.remove();
                    overlayEntry = null;
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.amber),
                  onPressed: () {
                    overlayEntry?.remove();
                    overlayEntry = null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );

    overlayState.insert(overlayEntry!); // Use non-null assertion since we just assigned it
  }

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
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/avatar.png'), // Replace with your avatar image
            ),
            SizedBox(width: 10),
            Text('ex chat'),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.videocam),
            //icon: Image.asset('assets/binoculars.png', width: 24, height: 24), 
            onPressed: () {
              // Handle video call action
            },
          ),
          IconButton(
            icon: Icon(Icons.call),
            //icon: Image.asset('assets/cup.and.saucer.png', width: 24, height: 24), 
            onPressed: () {
              // Handle audio call action
            },
          ),
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
      body: GestureDetector(
        onTap: () {
          if (overlayEntry != null) {
            overlayEntry?.remove();
            overlayEntry = null;
          }
        },
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (BuildContext context, int index) {
                  final message = _messages[index];
                  return buildChatItem(context, message);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: const InputDecoration(
                        hintText: "Enter your message...",
                      ),
                      onSubmitted: _handleMessageInput,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send_rounded),
                    onPressed: () {
                      _handleMessageInput(_messageController.text);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildChatItem(BuildContext context, ChatMessage message) {
    return Builder(
      builder: (BuildContext context) {
        return GestureDetector(
          onLongPress: () {
            RenderBox renderBox = context.findRenderObject() as RenderBox;
            final Offset offset = renderBox.localToGlobal(Offset.zero);
            showCustomMenu(context, offset);
          },
          child: ListTile(
            title: Align(
              alignment:
                  Alignment.centerRight, // Align the chat bubble to the right
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(0.0),
                  ),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(message.content,
                        style: const TextStyle(color: Colors.white)),
                    const SizedBox(height: 4.0),
                    Text(
                      DateFormat('HH:mm').format(message.timestamp),
                      style:
                          const TextStyle(fontSize: 12.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void handleMenuItemClick(String value) {
    switch (value) {
      case 'reply':
        // Handle reply action
        break;
      case 'edit':
        // Handle edit action
        break;
      case 'react':
        // Handle react action
        break;
      case 'delete':
        // Handle delete action
        break;
      default:
        print('No action selected');
    }
  }
}
