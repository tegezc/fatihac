import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payuung UI',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat Pagi',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
            Text(
              'suparman',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
        actions: [
          Icon(Icons.notifications, color: Colors.white),
          SizedBox(width: 16),
          CircleAvatar(
            backgroundColor: Colors.grey[400],
            child: Text('S', style: TextStyle(color: Colors.white)),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.yellow[700],
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Center(
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text('Payuung Pribadi'),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text('Payuung Karyawan'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Produk Keuangan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 16),
                      GridView.count(
                        crossAxisCount: 4,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          _buildCategoryItem('Urun', Icons.pets, Colors.brown),
                          _buildCategoryItem('Pembiayaan Porsi Haji', Icons.person, Colors.green),
                          _buildCategoryItem('Financial Check Up', Icons.receipt, Colors.orange),
                          _buildCategoryItem('Asuransi Mobil', Icons.directions_car, Colors.blue),
                          _buildCategoryItem('Asuransi Properti', Icons.home, Colors.red),
                        ],
                      ),
                      SizedBox(height: 16),
                      Text('Kategori Pilihan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 16),
                      GridView.count(
                        crossAxisCount: 4,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          _buildCategoryItem('Hobi', Icons.beach_access, Colors.blue),
                          _buildCategoryItem('Merchandise', Icons.shop, Colors.blueAccent),
                          _buildCategoryItem('Gaya Hidup Sehat', Icons.favorite, Colors.red),
                          _buildCategoryItem('Konseling & Rohani', Icons.book, Colors.lightBlue),
                          _buildCategoryItem('Self Development', Icons.person_outline, Colors.purple),
                          _buildCategoryItem('Perencanaan Keuangan', Icons.account_balance_wallet, Colors.green),
                          _buildCategoryItem('Konsultasi Medis', Icons.local_hospital, Colors.teal),
                          _buildCategoryItem('Lihat Semua', Icons.grid_view, Colors.black),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.1, // Ukuran saat ditampilkan pertama kali
            minChildSize: 0.1, // Ukuran terkecil (ketika sheet disembunyikan)
            maxChildSize: 0.5, // Ukuran maksimum saat di-*drag* penuh
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: ListView(
                  controller: scrollController,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Icon(Icons.drag_handle, color: Colors.grey[400]),
                          ),
                          SizedBox(height: 8),
                          GridView.count(
                            crossAxisCount: 4,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              _buildBottomNavigationItem('Beranda', Icons.home, Colors.yellow),
                              _buildBottomNavigationItem('Cari', Icons.search, Colors.black),
                              _buildBottomNavigationItem('Keranjang', Icons.shopping_cart, Colors.black),
                              _buildBottomNavigationItem('Daftar Transaksi', Icons.receipt_long, Colors.red),
                              _buildBottomNavigationItem('Voucher Saya', Icons.card_giftcard, Colors.black),
                              _buildBottomNavigationItem('Alamat Pengiriman', Icons.location_on, Colors.black),
                              _buildBottomNavigationItem('Daftar Teman', Icons.people, Colors.black),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Cari'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Keranjang'),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String title, IconData icon, Color color) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationItem(String title, IconData icon, Color color) {
    return Column(
      children: [
        Icon(icon, color: color),
        SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color: Colors.black),
        ),
      ],
    );
  }
}
