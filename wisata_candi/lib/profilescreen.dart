import 'package:flutter/material.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  // TODO 1: Deklarasikan variabel yang dibutuhkan
  bool isSignedIn = true;
  String fullName = 'M. Dhafa Adjie Saputra';
  String userName = 'adhfac';
  int favouriteCandiCount= 0;

  // TODO 5 : Implementasu fungsi SignIn
  void signIn (){
    setState(() {
      isSignedIn = !isSignedIn;
    });
  }
  // TODO 6 : Implementasi fungsi SighnOut
  void signOut (){
    setState(() {
      isSignedIn = !isSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.deepPurple,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [

                // TODO 2: Buat bagian ProfileHeader berisi gambar
                Align(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 200-50),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepPurple, width: 2),
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('images/placeholder_image.png'),
                          ),
                        ),
                        if(isSignedIn)
                          IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.camera_alt, color: Colors.deepPurple[50],),
                          )
                      ],
                    ),
                  ),
                ),

              // TODO 3: Buat bagian Profile Info
                const SizedBox(
                  height: 20,
                ),

                Divider(color: Colors.deepPurple[100],),

                const SizedBox(
                  height: 4,
                ),

                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width/3,
                      child: Row(
                        children: [
                          Icon(Icons.lock, color: Colors.amber,),
                          SizedBox(width: 8,),
                          Text(
                            'Pengguna', style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Cascadia'
                            ),
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: Text(': $userName', style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Cascadia'
                      ),),
                    ),
                  ],
                ),

                // Row ke 2
                
                const SizedBox(
                  height: 4,
                ),

                Divider(color: Colors.deepPurple[100],),

                const SizedBox(
                  height: 4,
                ),

                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width/3,
                      child: Row(
                        children: [
                          Icon(Icons.person, color: Colors.blue,),
                          SizedBox(width: 8,),
                          Text(
                            'Nama', style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Cascadia'
                            ),
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: Text(': $fullName', style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Cascadia'
                      ),),
                    ),
                    
                    if(isSignedIn) Icon(Icons.edit),
                  ],
                ),
                
                const SizedBox(
                  height: 4,
                ),

                Divider(color: Colors.deepPurple[100],),

                const SizedBox(
                  height: 4,
                ),

                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width/3,
                      child: Row(
                        children: [
                          Icon(Icons.favorite, color: Colors.red,),
                          SizedBox(width: 8,),
                          Text(
                            'Favorit', style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Cascadia'
                            ),
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: Text(': $favouriteCandiCount', style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Cascadia'
                      ),),
                    ),
                  ],
                ),

                // TODO 4: Buat bagian profile action
                const SizedBox(
                  height: 4,
                ),

                Divider(color: Colors.deepPurple[100],),

                const SizedBox(
                  height: 20,
                ),

                isSignedIn ? TextButton(onPressed: signOut, child: Text('Sign Out', style: TextStyle(
                        fontFamily: 'Cascadia'
                      ))) : TextButton(onPressed: signIn, child: Text('Sign In', style: TextStyle(
                        fontFamily: 'Cascadia'
                      ))),
              ],
            ),
          )
        ],
      ),
    );
  }
}