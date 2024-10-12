import 'package:flutter/material.dart';

class WidgetDemo extends StatelessWidget {
  const WidgetDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Demo'),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            color: const Color.fromARGB(255, 5, 127, 226),
            child: const Center(
              child: Text(
                'Dhafa Adjie',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'CascadiaMono'
                ),
                textAlign: TextAlign.center,
              ),
            ),
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            width: double.infinity,
          ),
          
          ElevatedButton(onPressed: () {},
            style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 5, 127, 226), // Mengubah background jadi biru
            padding: const EdgeInsets.all(16), // Menambahkan padding di sini juga
          ),
            child: const Padding(padding: EdgeInsets.all(16), 
            child: Text(
              'Ini adalah Tombol Elevated',
              style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                  fontFamily: 'CascadiaMono'
              )
            ),
            )
          ),

          const SizedBox(
            height: 16,
          ),

          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Colors.yellow,),
              Text('Rating : 4.5', style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'CascadiaMono'
              ))
            ],
          ),

          Image.network(
            "https://picsum.photos/id/57/500/300",
            width: double.infinity,
            height: 200,
            fit: BoxFit.contain,
          )
        ],
      ),
    );
  }
}