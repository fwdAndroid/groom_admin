import 'package:flutter/material.dart';
import 'package:groom_admin/utils/colors.dart';

class ServiceMobileScreen extends StatefulWidget {
  const ServiceMobileScreen({super.key});

  @override
  State<ServiceMobileScreen> createState() => _ServiceMobileScreenState();
}

class _ServiceMobileScreenState extends State<ServiceMobileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: mainBtnColor,
        title: Text(
          "Services",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: Text("Services Section Comming Soon"))],
      ),
    );
  }
}
