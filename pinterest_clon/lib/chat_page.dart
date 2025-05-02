import 'package:flutter/material.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';


class ChatPage extends StatefulWidget {
  final String username;
  final String avatarUrl;

  const ChatPage({
    Key? key,
    required this.username,
    required this.avatarUrl,
  }) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  bool _isEmojiVisible = false;

  void _toggleEmojiKeyboard() {
    setState(() {
      _isEmojiVisible = !_isEmojiVisible;
    });
  }

  void _onEmojiSelected(Emoji emoji) {
    _controller
      ..text += emoji.emoji
      ..selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.avatarUrl),
            ),
            const SizedBox(width: 10),
            Text(widget.username),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 249, 249, 249),
              child: Center(
                child: Text(
                  'Esto podría ser el comienzo de algo bueno',
                  style: TextStyle(color: const Color.fromARGB(255, 24, 24, 24)),
                ),
              ),
            ),
          ),
          if (_isEmojiVisible)
            SizedBox(
              height: 250, 
              child: EmojiPicker(
                onEmojiSelected: (category, emoji) {
                  _onEmojiSelected(emoji);
                },
                config: Config(
                  columns: 7,
                  emojiSizeMax: 32,
                  verticalSpacing: 0,
                  horizontalSpacing: 0,
                  initCategory: Category.RECENT,
                  bgColor: Color.fromARGB(255, 255, 255, 255),
                  indicatorColor: const Color.fromARGB(255, 0, 0, 0),
                  iconColor: Colors.grey,
                  iconColorSelected: const Color.fromARGB(255, 0, 0, 0),
                  backspaceColor: Color.fromARGB(255, 255, 255, 255),
                  skinToneDialogBgColor: const Color.fromARGB(255, 255, 255, 255),
                  skinToneIndicatorColor: Colors.grey,
                  enableSkinTones: true,
                  
                  recentsLimit: 28,
                  noRecents: const Text(
                    'No Recents',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  tabIndicatorAnimDuration: kTabScrollDuration,
                  categoryIcons: const CategoryIcons(),
                  buttonMode: ButtonMode.MATERIAL,
                ),
              ),
            ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      color: Color.fromARGB(255, 255, 255, 255),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.emoji_emotions, color: Color.fromARGB(255, 0, 0, 0)),
            onPressed: _toggleEmojiKeyboard,
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
              decoration: InputDecoration(
                hintText: 'Escribe un mensaje',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Color.fromARGB(255, 0, 0, 0)),
            onPressed: () {
            },
          ),
        ],
      ),
    );
  }
}
