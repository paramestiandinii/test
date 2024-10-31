import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu Makanan Seafood',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Menu Makanan Seafood'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 151, 106, 68), // Warna latar belakang AppBar
          leading: IconButton(
            icon: Icon(Icons.menu), // Ikon hamburger
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Membuka drawer saat ikon ditekan
            },
          ),
        ),
        drawer: Drawer(
          // Drawer widget
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 151, 106, 68),
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Tambahkan logika untuk item menu
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Tambahkan logika untuk item menu
                },
              ),
              // Tambahkan lebih banyak item jika perlu
            ],
          ),
        ),
        body: SafeArea(child: MenuGrid()),
      ),
    );
  }
}

class MenuGrid extends StatelessWidget {
  final List<Map<String, dynamic>> menus = [
    {
      'title': 'Udang Saus Tiram',
      'rating': 4.8,
      'time': '20 mnt',
      'price': '40 rb',
      'sellerName': 'Yummy',
      'sellerImage':
          'https://1.bp.blogspot.com/-wPknFiiI_hs/VdyWah6u4JI/AAAAAAAAQxY/H1OGYS6teYg/s1600/bon-appetite-smiley.png',
      'image':
          'https://2.bp.blogspot.com/-LeSqrawqU0I/V6z7O7lEXuI/AAAAAAAAROk/N32hrtaf6cI0eBMhDHtt2gGAr4KK9psNACLcB/s1600/Cara-Memasak-Udang-Saus-Tiram-Enak-Lezat.jpg',
    },
    {
      'title': 'Kepiting Saus Padang',
      'rating': 4.8,
      'time': '30 mnt',
      'price': '100 rb',
      'sellerName': 'Yummy',
      'sellerImage':
          'https://1.bp.blogspot.com/-wPknFiiI_hs/VdyWah6u4JI/AAAAAAAAQxY/H1OGYS6teYg/s1600/bon-appetite-smiley.png',
      'image':
          'https://4.bp.blogspot.com/-VckSnuQIa84/WFKOeNdk3kI/AAAAAAAAAjY/4_NzbRCrB6I0Q9WeMWTIJJuIbeMfG0ykQCLcB/s1600/kepiting%2Bsaus%2Bpadang.jpg',
    },
    {
      'title': 'Cumi Saus Tiram',
      'rating': 4.8,
      'time': '25 mnt',
      'price': '75 rb',
      'sellerName': 'Yummy',
      'sellerImage':
          'https://1.bp.blogspot.com/-wPknFiiI_hs/VdyWah6u4JI/AAAAAAAAQxY/H1OGYS6teYg/s1600/bon-appetite-smiley.png',
      'image':
          'https://1.bp.blogspot.com/-SZB1vB67p3o/VoFmVhdpMUI/AAAAAAAAF0w/V8f9nICns_Y/s1600/CUMI-CUMI2.JPG',
    },
    {
      'title': 'Lobster Pedas',
      'rating': 4.8,
      'time': '20 mnt',
      'price': '80 rb',
      'sellerName': 'Yummy',
      'sellerImage':
          'https://1.bp.blogspot.com/-wPknFiiI_hs/VdyWah6u4JI/AAAAAAAAQxY/H1OGYS6teYg/s1600/bon-appetite-smiley.png',
      'image':
          'http://1.bp.blogspot.com/-k-Zi6G1Lil4/VoAVvjRpigI/AAAAAAAAAtw/JJ6RECjwIxk/s1600/masakan-udang-lobster-asam-manis-pedas.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.6, // Perubahan rasio aspek untuk mempertinggi kartu
      ),
      itemCount: menus.length,
      itemBuilder: (context, index) {
        final menu = menus[index];
        return MenuCard(
          title: menu['title'],
          rating: menu['rating'],
          time: menu['time'],
          price: menu['price'],
          sellerName: menu['sellerName'],
          sellerImage: menu['sellerImage'],
          image: menu['image'],
        );
      },
    );
  }
}

class MenuCard extends StatelessWidget {
  final String title;
  final double rating;
  final String time;
  final String price;
  final String sellerName;
  final String sellerImage;
  final String image;

  const MenuCard({
    required this.title,
    required this.rating,
    required this.time,
    required this.price,
    required this.sellerName,
    required this.sellerImage,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Menampilkan gambar penjual dan nama penjual di atas gambar menu
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(sellerImage),
                  radius: 10, // Ukuran avatar
                ),
                SizedBox(width: 4),
                Text(
                  sellerName, // Nama penjual
                  style: TextStyle(fontSize: 12),
                  // Ukuran font
                ),
              ],
            ),
          ),
          // Gambar menu
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(
              image,
              height: 100, // Perbesar tinggi gambar
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Icon(Icons.star, color: Colors.orange, size: 20),
                SizedBox(width: 4),
                Text(rating.toString()),
                Spacer(),
                Icon(Icons.access_time, size: 20),
                SizedBox(width: 4),
                Text(time),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.monetization_on, size: 20), // Ikon uang
                SizedBox(width: 4), // Jarak antara ikon dan teks
                Text(
                  '$price', // Menampilkan harga
                  style: TextStyle(
                    fontSize: 15, // Ukuran font kecil
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
     color: Color.fromARGB(207, 158, 79, 48) // Warna latar belakang kartu
    );
  }
}
