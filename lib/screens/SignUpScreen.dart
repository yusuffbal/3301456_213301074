// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:footballapp_2/services/FlutterFireAuthService.dart';
import 'package:footballapp_2/screens/LoginScreen.dart';
import 'package:provider/provider.dart';
import 'package:footballapp_2/constants/constant.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: constant.mavi5,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.width * 1.2,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: constant.mavi3,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.09,
                      backgroundColor: constant.mavi1,
                      child: const Icon(
                        Icons.sports_soccer,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255)),
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: constant.mavi1),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: constant.mavi1,
                          ),
                        ),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        filled: true,
                        fillColor: constant.mavi1,
                        labelText: "İsim",
                        labelStyle: const TextStyle(color: Colors.white),
                      ),
                      controller: _nameController,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255)),
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: constant.mavi1),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: constant.mavi1,
                          ),
                        ),
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        filled: true,
                        fillColor: constant.mavi1,
                        labelText: "E-Posta",
                        labelStyle: const TextStyle(color: Colors.white),
                      ),
                      controller: _emailController,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: _passwordController,
                       style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255)),
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: constant.mavi1),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: constant.mavi1,
                          ),
                        ),
                        prefixIcon: const Icon(
                          Icons.key,
                          color: Colors.white,
                        ),
                        filled: true,
                        fillColor: constant.mavi1,
                        labelText: "Şifre",
                        labelStyle: const TextStyle(color: Colors.white),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              constant.mavi1,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50.0, vertical: 20.0),
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () async {
                          String email = _emailController.text.trim();
                          String password = _passwordController.text.trim();
                          String name = _nameController.text.trim();
                          context
                              .read<FlutterFireAuthService>()
                              .createAccount(name, email, password);
                        },
                       child: const Text(
                          "Kayıt Ol",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              constant.mavi1,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50.0, vertical: 20.0),
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: const Text(
                          "Giriş Yap",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
