import 'package:flutter/material.dart';
import 'package:wisata_candi/detail_screen.dart';
import 'package:wisata_candi/models/candi.dart';

class ItemCard extends StatelessWidget {
  // 1. Deklarasikan Variabel yang dibutuhklan dan pasang state konstruktor
  final Candi candi;


  const ItemCard({super.key, required this.candi});

  @override
  Widget build(BuildContext context) {
    // 6. Implementasi Routing ke DetailScreen

    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(candi: candi)));
      },
      child: Card(
        // 2. Tetapkan parameter shape, margin, dan elevation dari Card
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(4),
        elevation: 1,
        child: Column(
          children: [
            // 3. Buat image sebagai anak dari Column
            Expanded(
              // 7. Implementasi Hero animation
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(candi.imageAsset, width: double.infinity, fit: BoxFit.cover,),
            )),
            
            // 4. Buat text sebagai anak dari Column
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Text(candi.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
            ),
      
            // 5. Buat text sebagai anak dari Column
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 8),
              child: Text(candi.type, style: TextStyle(fontSize: 12),),
            ),
          ],
        ),
      ),
    );
  }
}