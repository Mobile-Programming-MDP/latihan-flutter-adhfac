import 'package:flutter/material.dart';

class LatihanScreen extends StatelessWidget {
  const LatihanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan UTS'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        
        child: Column(
          
          children: [

            const Center(child: Text('INFORMATIKA', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),)),

            const SizedBox(height: 8,),

            Image.asset(
              'images/latihan.jpg',
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 19,),

            const Text('Universitas Multi Data Palembang', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21)),

            const Text('Kota Palembang, Prov.Sumatera Selatan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21)),

            const SizedBox(height: 19,),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red[900],
              ),
              child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //TODO Baris berisi info
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Status', style: TextStyle(color: Colors.white),),
                                Text('Aktif', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                SizedBox(height: 8,),
                                Text('Akreditas', style: TextStyle(color: Colors.white),),
                                Text('Unggul', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Tanggal Berdiri', style: TextStyle(color: Colors.white),),
                                Text('9 April 2021', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                SizedBox(height: 8,),
                                Text('Jumlah Mahasiswa', style: TextStyle(color: Colors.white),),
                                Text('5000', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        ],
                      ),
                      
                      SizedBox(height: 20,),

                      Row(
                        children: [
                          Expanded(child: Column(
                              children: [
                              Icon(Icons.phone, color: Colors.white,),
                              const SizedBox(width: 18,),
                              Text(
                                '071-0897-021',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),
                              )
                            ],
                          )),

                          Expanded(child: Column(
                              children: [
                              Icon(Icons.mail, color: Colors.white,),
                              const SizedBox(width: 18,),
                              Text(
                                'kuliah@mdp.ac.id',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),
                              )
                            ],
                          )),

                          Expanded(child: Column(
                              children: [
                              Icon(Icons.web, color: Colors.white,),
                              const SizedBox(width: 18,),
                              Text(
                                '@universitasmdp',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),
                              )
                            ],
                          )),

                          Expanded(child: Column(
                              children: [
                              Icon(Icons.perm_media, color: Colors.white,),
                              const SizedBox(width: 18,),
                              Text(
                                'mdp.ac.id',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),
                              )
                            ],
                          )),
                        ],
                      ),

                      SizedBox(height: 10,),
                    ],
                  )
              ),
            ),

            SizedBox(height: 20,),
            
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 121, 121, 121),
              ),

              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    
                  ],
                ),
              ),
            )

            
          ],
        ),
      ),
    );
  }
}