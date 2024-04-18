import 'package:flutter/material.dart';
import 'package:groom_admin/utils/colors.dart';

class ComplaintsMobileScreen extends StatefulWidget {
  const ComplaintsMobileScreen({super.key});

  @override
  State<ComplaintsMobileScreen> createState() => _ComplaintsMobileScreenState();
}

class _ComplaintsMobileScreenState extends State<ComplaintsMobileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: mainBtnColor,
        title: Text(
          "Compliant",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: Text("Complaint Section Comming Soon"))],
      ),
    );
  }
}
