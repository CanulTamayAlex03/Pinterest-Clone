import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
            },
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: const CachedNetworkImageProvider(
                  'https://picsum.photos/100'),
            ),
            const SizedBox(height: 10),
            const Text(
              'Alx TMY',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0)),
            ),
            const SizedBox(height: 5),
            const Text(
              '@AlexCnlTmy',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 5),
            const Text(
              '0 seguidores · 2 seguidos',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Acción para editar el perfil
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 39, 39, 39), // Corregido: primary -> backgroundColor
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text('Editar perfil', style: TextStyle(color: Colors.white),),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Creados',
                  style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
                ),
                SizedBox(width: 20),
                Text(
                  'Guardado',
                  style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Divider(
              color: const Color.fromARGB(255, 0, 0, 0),
              thickness: 1,
              indent: 40,
              endIndent: 40,
            ),
            const SizedBox(height: 20),
            const Text(
              'Inspira con un Pin',
              style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Acción para crear un pin
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              ),
              child: const Text('Crear', style: TextStyle(color: Colors.black),),
            ),
          ],
        ),
      ),
    );
  }
}
