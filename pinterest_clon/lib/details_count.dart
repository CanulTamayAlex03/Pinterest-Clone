import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'profile_page.dart';
import 'login_page.dart';

class DetailsCount extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tu cuenta', style: TextStyle(fontSize: 16)),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                'https://picsum.photos/100',
              ),
            ),
            title: const Text('Alx', style: TextStyle(color: Color.fromARGB(255, 26, 26, 26))),
            subtitle: const Text('Ver perfil', style: TextStyle(color: Color.fromARGB(179, 0, 0, 0))),
            trailing: const Icon(Icons.arrow_forward_ios, color: Color.fromARGB(255, 0, 0, 0)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
          const Divider(color: Color.fromARGB(136, 255, 255, 255)),
          buildListTile(context, 'Administración de la cuenta'),
          buildListTile(context, 'Visibilidad del perfil'),
          buildListTile(context, 'Cuentas conectadas'),
          buildListTile(context, 'Permisos sociales'),
          buildListTile(context, 'Notificaciones'),
          buildListTile(context, 'Privacidad y datos'),
          buildListTile(context, 'Centro para denuncias e infracciones'),
          ListTile(
            title: const Text('Iniciar sesión', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
            onTap: () {},
          ),
          buildListTile(context, 'Agregar cuenta'),
          buildListTile(context, 'Seguridad'),
          ListTile(
            title: const Text('Cerrar sesión', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
            onTap: () => _signOut(context),
          ),
          const Divider(color: Color.fromARGB(136, 255, 255, 255)),
          buildListTile(context, 'Centro de asistencia'),
          buildListTile(context, 'Condiciones de servicio'),
          buildListTile(context, 'Política de privacidad'),
          buildListTile(context, 'Información'),
        ],
      ),
    );
  }

  Widget buildListTile(BuildContext context, String title) {
    return ListTile(
      title: Text(title, style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
      trailing: const Icon(Icons.arrow_forward_ios, color: Color.fromARGB(255, 0, 0, 0)),
      onTap: () {},
    );
  }
}