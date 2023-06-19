import 'package:flutter/material.dart';

Widget buildcard(var txt, var img) {
  return Card(
    color: const Color.fromARGB(255, 255, 255, 255),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ImageIcon(AssetImage(img)),
        Text(txt),
      ],
    ),
  );
}
