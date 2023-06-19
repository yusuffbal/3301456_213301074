import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/FlutterFireAuthService.dart';
import 'SignUpScreen.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 55, 19, 103),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * .25,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/topImage.png'),
                      fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Hosgeldin!",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _emailController,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255)),
                      decoration: const InputDecoration(
                        hintText: "E-Mail",
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255)),
                      decoration: const InputDecoration(
                        hintText: "Sifre",
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 126, 0, 252),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50.0, vertical: 20.0),
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () {
                            String email = _emailController.text.trim();
                            String password = _passwordController.text.trim();
                            context
                                .read<FlutterFireAuthService>()
                                .logIn(email, password, context);
                          },
                          child: const Text(
                            "Giriş Yap",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 126, 0, 252),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50.0, vertical: 20.0),
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()));
                          },
                          child: const Text(
                            "Kayıt Ol",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
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
