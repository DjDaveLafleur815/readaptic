import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  List<dynamic> sensor = [];

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'READAPTIC',
            style: TextStyle(
              fontSize: 40, // Utiliser des valeurs non constantes pour la taille de police
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0.w),
          child: Column(
            children: [
              SizedBox(height: 15.h),
              Image.asset(
                'assets/icon/playstore.png',
                width: 100.w,
                height: 100.h,
              ),
              Container(
                margin: EdgeInsets.only(top: 5.h),
                child: Text(
                  'Welcome to Readaptic. This is a research project in home automation using an IoT system (Internet of Things) to connect MultiSensors via the Z-Wave protocol to a Home Assistant server',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w300,

                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5.h),
                child: Text(
                  'Made by ciad',
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
