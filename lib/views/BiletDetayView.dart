import 'package:flutter/material.dart';
import 'package:footballapp_2/Provider/BiletProvider.dart';
import 'package:provider/provider.dart';
import '../models/BiletModel.dart';

class BiletDetayView extends StatefulWidget {
  final BiletModel bilet;

  const BiletDetayView({required this.bilet});

  @override
  _BiletDetayViewState createState() => _BiletDetayViewState();
}

class _BiletDetayViewState extends State<BiletDetayView> {
  final _adController = TextEditingController();
  final _soyadController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _adController.dispose();
    _soyadController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // ignore: unnecessary_null_comparison
    if (widget.bilet == null) {
      _adController.text = '';
      _soyadController.text = '';
      _emailController.text = '';

      Future.delayed(Duration.zero, () {
        final Biletprovider =
            Provider.of<BiletProvider>(context, listen: false);
        Biletprovider.LoadValues(BiletModel());
      });
    } else {
      _adController.text = widget.bilet.ad!;
      _soyadController.text = widget.bilet.soyad!;
      _emailController.text = widget.bilet.email!;

      Future.delayed(Duration.zero, () {
        final Biletprovider =
            Provider.of<BiletProvider>(context, listen: false);
        Biletprovider.LoadValues(widget.bilet);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Biletprovider = Provider.of<BiletProvider>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 58, 1, 133),
      appBar: AppBar(
        title: const Text('Bilet Detay'),
        backgroundColor: const Color.fromARGB(255, 55, 19, 103),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Maç: ${widget.bilet.match} - Stad: ${widget.bilet.stad} - Tarih: ${widget.bilet.tarih}',
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              controller: _adController,
              onChanged: (value) {
                Biletprovider.changeAd(value);
              },
              decoration: const InputDecoration(
                  labelText: 'Yeni Adiniz',
                  labelStyle: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 5),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              controller: _soyadController,
              onChanged: (value) {
                Biletprovider.changeSoyad(value);
              },
              decoration: const InputDecoration(
                  labelText: 'Yeni Soyadiniz',
                  labelStyle: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 5),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              controller: _emailController,
              onChanged: (value) {
                Biletprovider.changeEmail(value);
              },
              decoration: const InputDecoration(
                  labelText: 'Yeni E-posta Adresiniz',
                  labelStyle: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 5),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 126, 0, 252),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 20.0),
                  shape: const StadiumBorder(),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Bilet Sil'),
                        content: const Text(
                            'Bu biletinizi silmek istediğinizden emin misiniz?'),
                        actions: [
                          TextButton(
                            child: const Text('İptal'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          const SizedBox(height: 5),
                          TextButton(
                            child: const Text('Sil'),
                            onPressed: () {
                              Biletprovider.removeBilet(widget.bilet.id!);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Bilet Sil'),
              ),
            ),
            const SizedBox(
              height: 5,
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
                  Biletprovider.saveBiletmodel();
                  Navigator.of(context).pop();
                },
                child: const Text('Bilet Güncelle'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
