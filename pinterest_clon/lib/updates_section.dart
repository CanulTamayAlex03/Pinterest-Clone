import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'data.dart';  // Asegúrate de importar el archivo de datos

class UpdatesSection extends StatelessWidget {
  const UpdatesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: updatesData.length,
      itemBuilder: (context, index) {
        final UpdateSection section = updatesData[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${section.title} · ${section.time}",
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0), // Ajusta el valor para el borde redondeado
                child: Container(
                  width: double.infinity, // Hace que el contenedor abarque todo el ancho
                  height: 170, // Altura del contenedor de imágenes
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: section.images.length,
                    itemBuilder: (context, imgIndex) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 1.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0), 
                          child: CachedNetworkImage(
                            imageUrl: section.images[imgIndex],
                            
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width / 3,
                            height: 170,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              
            ],
          ),
        );
      },
    );
  }
}
