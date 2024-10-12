import 'package:flutter/material.dart';

class GaleriFoto extends StatelessWidget {
  const GaleriFoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galeri Foto', style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'CascadiaMono'
                )),
        backgroundColor: Colors.blue,
      ),

      body: Column(
        children: [

          Image.network(
            "https://picsum.photos/id/22/500/300",
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          const SizedBox(
            height: 16,
          ),

          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Jalan di Barcelona', style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'CascadiaMono',
                  fontWeight: FontWeight.bold
              ))
            ],
          ),

          const Divider( 
            color: Colors.grey, 
            thickness: 2, 
            indent: 20, 
            endIndent: 20, 
          ),
          

          const SizedBox(
            height: 16,
          ),

          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  children: const [
                    Icon(
                      Icons.location_pin, 
                      color: Colors.red,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Lokasi: Barcelona, Spanyol',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'CascadiaMono',
                      ),
                    ),
                    
                  ],
                ),
              )
            ],
          ),

          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  children: const [
                    Icon(
                      Icons.date_range, 
                      color: Colors.red,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Publikasi: 13 Agustus 2013',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'CascadiaMono',
                      ),
                    ),
                    
                  ],
                ),
              )
            ],
          ),

          const SizedBox(
            height: 16,
          ),

          const Divider( 
            color: Colors.grey, 
            thickness: 2, 
            indent: 20, 
            endIndent: 20, 
          ),

          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  children: const [
                    SizedBox(width: 8),
                    Text(
                      'Deskripsi',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'CascadiaMono',
                      ),
                    ),
                    
                  ],
                ),
              )
            ],
          ),

          const SizedBox(
            height: 16,
          ),
          
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded( 
                  child: Text(
                    'Sebuah persimpangan jalan di Barcelona, Spanyol. Foto ini menampilkan berbagai kendaraan yang bergerak dalam arah yang berbeda, menciptakan pemandangan yang sibuk dan energik',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'CascadiaMono',
                    ),
                    softWrap: true, 
                  ),
                ),
              ],
            ),
          )




        ],
      ),
    );
  }
}