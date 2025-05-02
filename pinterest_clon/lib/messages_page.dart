// messages_page.dart

import 'package:flutter/material.dart';
import 'updates_section.dart'; // Importa el archivo de actualizaciones
import 'package:cached_network_image/cached_network_image.dart';
import 'chat_page.dart'; // Importa la página de chat

class MessagesPage extends StatefulWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color.fromARGB(255, 0, 0, 0),
          labelColor: Colors.black,
          tabs: const [
            Tab(text: 'Actualizaciones'),
            Tab(text: 'Buzón de entrada'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Sección de Actualizaciones
          const UpdatesSection(),
          // Sección de Buzón de entrada
          ListView(
            children: const [
              _MessageTile(
                avatarUrl: 'https://picsum.photos/107',
                name: 'Teo Lopez',
                message: 'Envía un saludo 👋',
              ),
              _MessageTile(
                avatarUrl: 'https://picsum.photos/111',
                name: 'Chistes Geniales',
                message: 'Envía un saludo 👋',
              ),
              _MessageTile(
                avatarUrl: 'https://picsum.photos/113',
                name: 'Ximagen',
                message: 'Envía un saludo 👋',
              ),
              _MessageTile(
                avatarUrl: 'https://via.placeholder.com/150',
                name: 'Invitar',
                message: 'Conéctense para comenzar a chatear',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MessageTile extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final String message;

  const _MessageTile({
    Key? key,
    required this.avatarUrl,
    required this.name,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(avatarUrl),
        onBackgroundImageError: (error, stackTrace) {
          print('Failed to load image: $error');
        },
      ),
      title: Text(
        name,
        style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      ),
      subtitle: Text(
        message,
        style: const TextStyle(color: Color.fromARGB(179, 0, 0, 0)),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, color: Color.fromARGB(255, 0, 0, 0)),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(
              username: name,
              avatarUrl: avatarUrl,
            ),
          ),
        );
      },
    );
  }
}
