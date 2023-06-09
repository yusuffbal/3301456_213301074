import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';

class FileUtils {

static Future<String> get getFilePath async {
final directory = await getApplicationDocumentsDirectory();
return directory.path;
}

static Future<File> get getFile async {
final path = await getFilePath;
return File('$path/myfile.txt');
}

static Future<File> saveToFile(List<String> data) async {
  final file = await getFile;
  final content = data.join('\n'); 

  return file.writeAsString(content);
}

static Future<String?> readFromFile() async {
try {
final file = await getFile;
String fileContents = await file.readAsString();
return fileContents;
} catch (e) {
return "Dosya okunamadi! $e";
}
}
}