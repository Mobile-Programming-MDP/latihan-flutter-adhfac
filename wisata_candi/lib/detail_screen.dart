import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wisata_candi/models/candi.dart';

class DetailScreen extends StatefulWidget {
  final Candi candi;
  const DetailScreen({super.key, required this.candi});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isFavorite = false;
  bool isSignedIn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }

  void _checkSignInStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool favorite = prefs.getBool('favorite_${widget.candi.name}') ?? false;
    setState(() {
      isFavorite = favorite;
    });
  }

    void _loadFavoriteStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool favorite = prefs.getBool('favorite_${widget.candi.name}') ?? false;
    setState(() {
      isFavorite = favorite;
    });
  }

  Future<void> _toogleFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (!isSignedIn) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, '/signin');
      });
      return;
    }
    bool favoriteStatus = !isFavorite;
    prefs.setBool('favorite_${widget.candi.name}', favoriteStatus);

    setState(() {
      isFavorite = favoriteStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(padding: const EdgeInsets.symmetric(
                  horizontal: 8.0
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(widget.candi.imageAsset,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  ),
                ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 32
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[100]?.withOpacity(0.8),
                      shape: BoxShape.circle
                    ),
                    child: IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: const Icon(
                      Icons.arrow_back
                    )),
                  ),
                ),


              ],
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.candi.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cascadia'
                        ),
                      ),
                      IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border))
                    ],
                  ),

                  SizedBox(height: 16,),

                  Row(
                    children: [
                      Icon(Icons.place, color: Colors.red,),
                      SizedBox(width: 8,),
                      SizedBox(
                        width: 70,
                        child: Text(
                          'Lokasi',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cascadia'
                          ),
                        )
                      ),
                      Text(': ${widget.candi.location}')
                    ],
                  ),

                  Row(
                    children: [
                      Icon(Icons.calendar_month, color: const Color.fromARGB(255, 56, 9, 186),),
                      SizedBox(width: 8,),
                      SizedBox(
                        width: 70,
                        child: Text(
                          'Dibangun',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cascadia'
                          ),
                        )
                      ),
                      Text(': ${widget.candi.built}')
                    ],
                  ),

                  Row(
                    children: [
                      Icon(Icons.house, color: const Color.fromARGB(255, 9, 186, 74),),
                      SizedBox(width: 8,),
                      SizedBox(
                        width: 70,
                        child: Text(
                          'Dibangun',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cascadia'
                          ),
                        )
                      ),
                      Text(': ${widget.candi.type}')
                    ],
                  ),
                  

                  
                  Divider(color: Colors.deepPurple.shade100,),
                  Text('Deskripsi',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cascadia'
                          ),),

                  SizedBox(height: 16,),
                  Text('${widget.candi.description}',
                  style: TextStyle(
                            
                            fontFamily: 'Cascadia'
                          ),),
                  

                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(color: Colors.deepPurple.shade100),
                  const Text(
                    'Galeri',
                    style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Cascadia'
                    ),
                  ),
                  
                  SizedBox(height: 10,),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.candi.imageUrls.length,
                      itemBuilder: (context, index) {
                        return Padding(padding: EdgeInsets.only(left: 8),
                              child: GestureDetector(
                                onTap: (){},
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.deepPurple.shade100,
                                      width: 2
                                    )
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      imageUrl: widget.candi.imageUrls[index],
                                      width: 120,
                                      height: 120,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) => Container(
                                        width: 120,
                                        height: 120,
                                        color: Colors.deepPurple[50],
                                      ),
                                      errorWidget: (context, url, error) => Icon(Icons.error),
                                    ),
                                  )
                                ),
                              ),
                            );
                      },
                    ),
                  ),
                  SizedBox(height: 4,),
                  Text(
                    'Tap untuk memperbesar', style: TextStyle(
                      fontSize: 12, color: Colors.black54,
                    ),
                  ),
                ],
              ),
            )

        ],
      ),
      ),
    );
  }
}