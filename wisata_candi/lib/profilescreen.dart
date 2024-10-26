import 'package:flutter/material.dart';
import 'package:wisata_candi/widgets/profile_info_item.dart';

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

  // TODO 5 : Implementasi fungsi SignIn
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
                          child: const CircleAvatar(
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
                // Row ke 1
                const SizedBox(height: 20,),
                Divider(color: Colors.deepPurple[100],),
                const SizedBox(height: 4,),
                ProfileInfoItem(icon: Icons.lock, label: 'Pengguna', value: userName, iconColor: Colors.amber),

                // Row ke 2
                const SizedBox(
                  height: 4,
                ),
                Divider(color: Colors.deepPurple[100],),
                const SizedBox(
                  height: 4,
                ),
                ProfileInfoItem(
                  icon: Icons.person,
                  label: 'Nama',
                  value: fullName,
                  iconColor: Colors.deepPurple,
                  showEditIcon: isSignedIn,
                  onEditPressed: () {
                      debugPrint('Icon Edit Saat Ditekan...');
                  },

                ),

                // Row ke 3
                const SizedBox(
                  height: 4,
                ),
                Divider(color: Colors.deepPurple[100],),
                const SizedBox(
                  height: 4,
                ),
                ProfileInfoItem(
                    icon: Icons.favorite,
                    label: 'Favorit',
                    value: favouriteCandiCount > 0 ? '$favouriteCandiCount' : '0',
                    iconColor: Colors.pinkAccent
                ),

                // TODO 4: Buat bagian profile action
                const SizedBox(
                  height: 4,
                ),

                Divider(color: Colors.deepPurple[100],),

                const SizedBox(
                  height: 20,
                ),

                isSignedIn ? TextButton(onPressed: signOut, child: const Text('Sign Out', style: TextStyle(
                        fontFamily: 'Cascadia'
                      ))) : TextButton(onPressed: signIn, child: const Text('Sign In', style: TextStyle(
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