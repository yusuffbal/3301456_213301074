import 'package:flutter/material.dart';
import 'package:footballapp_2/services/FlutterFireAuthService.dart';
import 'package:footballapp_2/screens/LoginScreen.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 55, 19, 103),
      body: SingleChildScrollView(
        child: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    "Hosgeldin! Kayıt Ol!",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255)),
                    decoration: const InputDecoration(
                      hintText: "Isim",
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
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
                    controller: _nameController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255)),
                    decoration: const InputDecoration(
                      hintText: "E-Mail",
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
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
                    controller: _emailController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255)),
                    decoration: const InputDecoration(
                      hintText: "Şifre",
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
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
                        backgroundColor: const Color.fromARGB(255, 126, 0, 252),
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
                      child: Text('Kayıt Ol'),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 126, 0, 252),
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
                      child: Text('Giriş Yap'),
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
