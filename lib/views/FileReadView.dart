import 'package:flutter/material.dart';
import 'dart:async';

import '../services/FileUtils.dart';

class FileReadView extends StatefulWidget {
  const FileReadView({super.key});

  

  @override
  State<FileReadView> createState() => _FileReadViewState();
}

class _FileReadViewState extends State<FileReadView> {
  String? kaydedilenveri;

  @override
  void initState() {
    super.initState();
    readDataFromFile();
  }

  Future<void> readDataFromFile() async {
    try {
      String? fileContents = await FileUtils.readFromFile();
      setState(() {
        kaydedilenveri = fileContents;
      });
    } catch (e) {
      setState(() {
        kaydedilenveri = "Dosya okunamadı! $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dosya Okuma'),
      ),
      body: Center(
        child: Text(
          kaydedilenveri ?? 'Dosya içeriği yükleniyor...',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
