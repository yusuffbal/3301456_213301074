import 'package:flutter/material.dart';
import 'package:footballapp_2/views/BiletDetayView.dart';
import 'package:provider/provider.dart';
import 'package:footballapp_2/constants/constant.dart';
import '../models/BiletModel.dart';
import '../services/BiletService.dart';

class BiletlerimSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final biletService = Provider.of<BiletService>(context);
    return Scaffold(
      backgroundColor: constant.mavi1,
      appBar: AppBar(
        title: Text('Biletlerim'),
        backgroundColor: constant.mavi3
      ),
      body: StreamBuilder<List<BiletModel>>(
        stream: biletService.getBiletler(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final biletler = snapshot.data!;
            return ListView.builder(
              itemCount: biletler.length,
              itemBuilder: (context, index) {
                final bilet = biletler[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BiletDetayView(bilet: bilet)));
                  },
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Bilet Sil'),
                          content: Text('Bu biletinizi silmek istediğinizden emin misiniz?'),
                          actions: [
                            TextButton(
                              child: Text('İptal'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text('Sil'),
                              onPressed: () {
                                if (bilet.id != null) {
                                  biletService.removeBilet(bilet.id!);
                                }
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Card(
              shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(35.0),
              ),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              elevation: 2.0,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${bilet.match}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text('Ad: ${bilet.ad}'),
                    Text('Soyad: ${bilet.soyad}'),
                    Text('Mekan: ${bilet.stad}'),
                    Text('Tarih: ${bilet.tarih}'),
                    Text('E-posta: ${bilet.email}'),
                  ],
                ),
              ),
                  )
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Biletler yüklenirken bir hata oluştu.');
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}