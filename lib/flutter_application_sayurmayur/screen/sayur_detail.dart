import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_launch/flutter_launch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:week6sesi2/flutter_application_sayurmayur/widget/navbar_widget.dart';

class SayurDetail extends StatelessWidget {
  final String assetPath;
  final String sayurprice;
  final String sayurname;

  const SayurDetail({
    super.key,
    required this.assetPath,
    required this.sayurprice,
    required this.sayurname,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF545D68),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Pesan',
          style: TextStyle(
            fontFamily: 'Varela',
            fontSize: 24.0.sp, // Error
            color: const Color(0xFF545D68),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: Color(0xFF545D68),
            ),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 16.0.h), // Error
          Padding(
            padding: EdgeInsets.only(left: 16.0.sp), // Error
            child: Text(
              'Sayur Mayur',
              style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 40.0.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFF17532),
              ),
            ),
          ),
          SizedBox(height: 16.0.h), // Error
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.sp,
            ),
            child: Hero(
                tag: assetPath,
                child: Container(
                  height: 200.h,
                  width: 200.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32.sp),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(assetPath),
                      )),
                )),
          ),
          SizedBox(height: 16.0.h),
          Center(
            child: Text(
              'Rp $sayurprice',
              style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFF17532),
              ),
            ),
          ),
          SizedBox(height: 16.0.sp),
          Center(
            child: Text(
              sayurname,
              style: TextStyle(
                color: const Color(0xFF575E67),
                fontFamily: 'Varela',
                fontSize: 24.0.sp,
              ),
            ),
          ),
          SizedBox(height: 16.0.sp),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 52,
              child: Text(
                'Sayur mayur yang diambil dari pertanian terbaik di Indonesia akan menjadi bahan dasar terbaik untuk membuat cita rasa masakan nusantara',
                maxLines: 4,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 16.0.sp,
                  color: const Color(0xFFB4B8B9),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0.sp),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 100.0.w,
              height: 52.0.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0.sp),
                color: const Color(0xFFF17532),
              ),
              child: Center(
                child: InkWell(
                  onTap: () async {
                    await FlutterLaunch.launchWhatsapp(
                      phone: '628123456789',
                      message:
                          'Hi Tegar Sayur, Saya mau order $sayurname untuk hari ini, apa bisa diantar kerumah',
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.whatsapp,
                        size: 32.sp,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        'Pesan via Whatsapp',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 28.0.h),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFFF17532),
        child: const Icon(Icons.fastfood),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const NavbarWidget(),
    );
  }
}
