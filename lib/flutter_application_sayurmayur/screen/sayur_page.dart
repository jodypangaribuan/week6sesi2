import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week6sesi2/flutter_application_sayurmayur/screen/sayur_detail.dart';

class Sayur {
  final String name;
  final String imageUrl;
  final int price;
  final bool isFavorite;

  Sayur({
    required this.name,
    required this.imageUrl,
    required this.price,
    this.isFavorite = false,
  });
}

class SayurPage extends StatelessWidget {
  const SayurPage({super.key});

  List<Sayur> get listSayurs => [
        Sayur(name: 'Bayam', imageUrl: 'assets/box1.jpg', price: 5000),
        Sayur(name: 'Cabai', imageUrl: 'assets/box2.jpg', price: 6000),
        Sayur(name: 'Kentang', imageUrl: 'assets/box3.jpeg', price: 12000),
        Sayur(name: 'Sawi', imageUrl: 'assets/box4.jpg', price: 3000),
        Sayur(name: 'Terong', imageUrl: 'assets/box5.jpg', price: 3000),
        Sayur(name: 'Tomat', imageUrl: 'assets/box6.jpg', price: 3000),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFAF8),
      body: Padding(
        padding: EdgeInsets.only(
          bottom: 80.sp,
        ),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.sp,
            mainAxisSpacing: 8.sp,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            return _buildCard(listSayurs[index], context);
          },
          itemCount: listSayurs.length,
        ),
      ),
    );
  }

  Widget _buildCard(
    Sayur sayur,
    BuildContext context,
  ) {
    return Padding(
      padding: EdgeInsets.all(4.sp),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return SayurDetail(
              assetPath: sayur.imageUrl,
              sayurprice: sayur.price.toString(),
              sayurname: sayur.name,
            );
          }));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              )
            ],
            color: Colors.white,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  right: 8.sp,
                  top: 8.sp,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      sayur.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: const Color(0xFFEF7532),
                    )
                  ],
                ),
              ),
              Container(
                height: 92.h,
                width: 92.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  image: DecorationImage(
                    image: AssetImage(sayur.imageUrl),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Rp ${sayur.price}',
                style: TextStyle(
                  color: const Color(0xFFCC8053),
                  fontFamily: 'Varela',
                  fontSize: 16.sp,
                ),
              ),
              Text(
                sayur.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: const Color(0xFF575E67),
                  fontFamily: 'Varela',
                  fontSize: 14.sp,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0.sp),
                child: Container(
                  color: const Color(0xFFEBEBEB),
                  height: 1.0.sp,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.chat,
                          color: const Color(0xFFD17E50),
                          size: 16.sp,
                        ),
                        SizedBox(
                          width: 8.sp,
                        ),
                        Text(
                          'Chat',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            color: const Color(0xFFD17E50),
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.remove_circle_outline,
                          color: const Color(0xFFD17E50),
                          size: 16.sp,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          '3',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            color: const Color(0xFFD17E50),
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Icon(
                          Icons.add_circle_outline,
                          color: const Color(0xFFD17E50),
                          size: 16.sp,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
