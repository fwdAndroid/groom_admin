import 'package:flutter/material.dart';
import 'package:groom_admin/utils/colors.dart';

class PaymentMobileScreen extends StatefulWidget {
  const PaymentMobileScreen({super.key});

  @override
  State<PaymentMobileScreen> createState() => _PaymentMobileScreenState();
}

class _PaymentMobileScreenState extends State<PaymentMobileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: mainBtnColor,
        title: Text(
          "Payment",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: Text("Payment Section Comming Soon"))],
      ),
    );
  }
}
