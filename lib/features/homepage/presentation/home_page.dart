import 'package:fatihac/features/homepage/presentation/blocs/homepage_bloc.dart';
import 'package:fatihac/features/homepage/presentation/blocs/homepage_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/injection/injector.dart';
import 'blocs/homepage_event.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late HomepageBloc _homepageBloc;

  final double maxScrollHeight = 0.4;
  final double minScrollHeight = 0.15;

  // Declare an animation controller
  late final AnimationController _animController;

// This variable will be responsible for rotation the arrow icon
  late final Animation<double> _rotationAnim;

// Initialize the DraggableScrollableController.
// This will be used to get and control the state of the sheet
  final dragController = DraggableScrollableController();

  @override
  void initState() {
    super.initState();
    _homepageBloc = getIt<HomepageBloc>();
    // Initialize the animation controller
    _animController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _rotationAnim =
        Tween<double>(begin: 0.0, end: 0.5).animate(_animController);

    dragController.addListener(() {
      final newSize = dragController.size;

      final scrollPosition =
      ((newSize - minScrollHeight) / (maxScrollHeight - minScrollHeight))
          .clamp(0.0, 1.0);

      // Drive the animation based on scroll position
      _animController.animateTo(scrollPosition, duration: Duration.zero);
    });
  }

  @override
  void dispose() {
    _animController.dispose();
    dragController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            lazy: false,
            create: (context) {
              return _homepageBloc
                ..add(GetAllVoucherEvent());

            }),
      ],
      child:  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat Malam',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
            Text(
              'suparman',
              style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
        actions: [
          const Icon(Icons.notifications, color: Colors.white),
          const SizedBox(width: 16),
          CircleAvatar(
            backgroundColor: Colors.grey[400],
            child: const Text('S', style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 16),
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
                                    child: const Text('Payuung Pribadi'),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: TextButton(
                                    onPressed: () {},
                                    child: const Text('Payuung Karyawan'),
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
                      const Text('Produk Keuangan',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      GridView.count(
                        crossAxisCount: 4,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          _buildCategoryItem('Urun', Icons.group, Colors.brown),
                          _buildCategoryItem('Pembiayaan Porsi Haji',
                              Icons.person_3_sharp, Colors.green),
                          _buildCategoryItem('Financial Check Up',
                              Icons.receipt, Colors.orange),
                          _buildCategoryItem('Asuransi Mobil',
                              Icons.directions_car, Colors.blue),
                          _buildCategoryItem(
                              'Asuransi Properti', Icons.home, Colors.red),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text('Kategori Pilihan',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      GridView.count(
                        crossAxisCount: 4,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          _buildCategoryItem(
                              'Hobi', Icons.beach_access, Colors.blue),
                          _buildCategoryItem(
                              'Merchandise', Icons.shop, Colors.blueAccent),
                          _buildCategoryItem(
                              'Gaya Hidup Sehat', Icons.favorite, Colors.red),
                          _buildCategoryItem('Konseling & Rohani', Icons.book,
                              Colors.lightBlue),
                          _buildCategoryItem('Self Development',
                              Icons.person_outline, Colors.purple),
                          _buildCategoryItem('Perencanaan Keuangan',
                              Icons.account_balance_wallet, Colors.green),
                          _buildCategoryItem('Konsultasi Medis',
                              Icons.local_hospital, Colors.teal),
                          _buildCategoryItem(
                              'Lihat Semua', Icons.grid_view, Colors.black),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Explore Wellness',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Row(
                              children: [
                                Text('Terpopuler',
                                    style: TextStyle(fontSize: 14)),
                                Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      BlocBuilder<HomepageBloc,HomepageState>(
                          builder: (context,state) {
                            if(state.getAllVoucherForHomepage().isNotEmpty){
                              return Column(
                                children: state.getAllVoucherForHomepage().map((voucher) {
                                  return Row(
                                    children: [
                                      if(voucher.isNotEmpty)
                                        Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Image.asset(
                                                  voucher[0].imagePath??"assets/noimage.png",
                                                  height: 60,
                                                  width: 60,
                                                  fit: BoxFit.contain,
                                                  errorBuilder: (BuildContext context,
                                                      Object exception,
                                                      StackTrace? stackTrace) {
                                                    return Image.asset(
                                                        width: 60,
                                                        height: 60,
                                                        "assets/noimage.png");
                                                  },
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  voucher[0].title??'',
                                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                                  maxLines: 3,
                                                ),
                                                if (voucher[0].basePrice != null) ...[
                                                  const SizedBox(height: 4),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        voucher[0].basePrice??"",
                                                        style: const TextStyle(
                                                          decoration: TextDecoration.lineThrough,
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                      const SizedBox(width: 4),
                                                      Text(
                                                        voucher[0].discountPercentage??"",
                                                        style: const TextStyle(color: Colors.red),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                                Text(voucher[0].afterDiscPrice??""),
                                              ],
                                            ),
                                          ),
                                        ),

                                      if(voucher.length>1)
                                        Expanded(
                                          flex:1,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Image.asset(
                                                  voucher[1].imagePath ?? '',
                                                  height: 60,
                                                  width: 60,
                                                  fit: BoxFit.contain,
                                                  errorBuilder: (BuildContext context,
                                                      Object exception,
                                                      StackTrace? stackTrace) {
                                                    return Image.asset(
                                                        width: 60,
                                                        height: 60,
                                                        "assets/noimage.png");
                                                  },
                                                ),
                                                const SizedBox(width: 16),

                                                Text(
                                                  voucher[1].title ?? '',
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.bold),
                                                  maxLines: 3,
                                                ),
                                                if (voucher[1].basePrice != null) ...[
                                                  const SizedBox(height: 4),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        voucher[1].basePrice ?? '',
                                                        style: const TextStyle(
                                                          decoration: TextDecoration
                                                              .lineThrough,
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                      const SizedBox(width: 4),
                                                      Text(
                                                        voucher[0].discountPercentage ?? '',
                                                        style: const TextStyle(
                                                            color: Colors.red),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                                Text(voucher[0].afterDiscPrice ?? ''),
                                              ],
                                            ),
                                          ),
                                        ),
                                    ],
                                  );
                                }).toList(),
                              );
                            }else{
                              return const SizedBox();
                            }

                          }
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 150,),
              ],
            ),
          ),
          DraggableScrollableSheet(
            controller: dragController,
            initialChildSize: minScrollHeight,
            minChildSize: minScrollHeight,
            maxChildSize: maxScrollHeight,
            snap: true,
            snapAnimationDuration: const Duration(milliseconds: 150),
            builder: (BuildContext context, ScrollController scrollController) {
              dragController.addListener(() {
                final newSize = dragController.size;

                final scrollPosition = ((newSize - minScrollHeight) /
                    (maxScrollHeight - minScrollHeight))
                    .clamp(0.0, 1.0);

                // Drive the animation based on scroll position
                _animController.animateTo(scrollPosition,
                    duration: Duration.zero);
              });

              return Container(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: RotationTransition(
                          turns: _rotationAnim,
                          child: GestureDetector(
                            onTap: () {
                              toggleDragSheet();
                            },
                            child: const Icon(
                              Icons.keyboard_arrow_up_rounded,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                      GridView.count(
                        crossAxisCount: 3,
                        childAspectRatio: 1.6,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          _buildNavItem('Beranda', Icons.home_outlined),
                          _buildNavItem('Cari', Icons.search),
                          _buildNavItem('Keranjang',
                              Icons.shopping_cart_checkout_outlined),
                          _buildNavItem('Daftar Transaksi',
                              Icons.library_add_check_outlined),
                          _buildNavItem(
                              'Voucher Saya', Icons.discount_outlined),
                          _buildNavItem(
                              'Alamat Pengiriman', Icons.location_on_outlined),
                          _buildNavItem('Daftar Teman', Icons.group),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
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
        const SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildNavItem(String title, IconData icon) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Icon(icon, color: Colors.black),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  void animateDragOnTap(double height) {
    // Use dragController to control the sheet positioning.
    dragController.animateTo(
      height,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void toggleDragSheet() {
    // Depending on the position of the sheet we can expand or
    // contract it accordingly.
    if (dragController.size == maxScrollHeight) {
      animateDragOnTap(minScrollHeight);
    } else {
      animateDragOnTap(maxScrollHeight);
    }
  }
}