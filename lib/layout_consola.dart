import 'package:flutter/material.dart';

class LayoutConsola extends StatelessWidget {
  final dynamic itemData;

// Relacionar els colors amb el text que els defineix
  final Map<String, Color> colorMap = {
    'red': Colors.red,
    'blue': Colors.blue,
    'green': Colors.green,
    'orange': Colors.orange,
    'brown': Colors.brown,
    'grey': Colors.grey,
    'white': Colors.white,
    'purple': Colors.purple,
  };

// Constructor
  LayoutConsola({Key? key, required this.itemData}) : super(key: key);

// Retornar un 'Color' a partir del text, fent servir el mapa de colors anterior
  Color getColorFromString(String colorString) {
    return colorMap[colorString.toLowerCase()] ?? Colors.black;
  }

  // ... aquí la funció ‘build’ definida a la següent diapositiva
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Ocupar la meitat superior de l'espai amb la imatge
          SizedBox(
            width: MediaQuery.of(context).size.width * 100.0,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Image.asset(
              'assets/images/${itemData["imatge"]}',
              fit: BoxFit.contain,
            ),
          ),
          // Ocupar la meitat inferior de l'espai amb els textos
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${itemData['nom']}",
                  style: const TextStyle(
                      fontSize: 45, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      color: getColorFromString(itemData['color']),
                      border: Border.all(
                        width: 1,
                      )),
                ),
                const SizedBox(height: 20),
                Text(
                  "${itemData['data']}".substring(0, 4),
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                ),
                Text(
                  "${itemData['procesador']}",
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${itemData['venudes'].toString()} vendues",
                  style: const TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
