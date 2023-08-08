// ignore_for_file: file_names

import 'package:flutter/material.dart';

Widget buildleaguecard(var img) {
  return Card( 
    color: const Color.fromARGB(255, 255, 255, 255),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Image(
            image: AssetImage(img),
            fit: BoxFit.cover,
        )
        )

      ],
      
    ),
  );
}
