import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:groom_admin/mobile/complaint_mobile_screen.dart';
import 'package:groom_admin/mobile/mobile_auh/mobile_sign_in.dart';
import 'package:groom_admin/mobile/mobile_screens/customer_mobile_screen.dart';
import 'package:groom_admin/mobile/mobile_screens/payment_mobile_screen.dart';
import 'package:groom_admin/mobile/mobile_screens/provider_mobile_screen.dart';
import 'package:groom_admin/mobile/mobile_screens/service_mobile_screen.dart';
import 'package:groom_admin/utils/colors.dart';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({super.key});

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo.png",
              height: 200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => CustomerMobileScreen()));
                  },
                  child: SizedBox(
                      height: 160,
                      width: 160,
                      child: Card(
                        color: Colors.blue,
                        child: Column(
                          children: [
                            Icon(
                              Icons.person,
                              color: colorwhite,
                              size: 100,
                            ),
                            Text(
                              "Customers",
                              style: TextStyle(
                                color: colorwhite,
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => ProviderMobileScreen()));
                  },
                  child: SizedBox(
                      height: 160,
                      width: 160,
                      child: Card(
                        color: Colors.blue,
                        child: Column(
                          children: [
                            Icon(
                              Icons.task,
                              color: colorwhite,
                              size: 100,
                            ),
                            Text(
                              "Providers",
                              style: TextStyle(
                                color: colorwhite,
                              ),
                            ),
                          ],
                        ),
                      )),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => ServiceMobileScreen()));
                  },
                  child: SizedBox(
                      height: 160,
                      width: 160,
                      child: Card(
                        color: Colors.blue,
                        child: Column(
                          children: [
                            Icon(
                              Icons.report,
                              color: colorwhite,
                              size: 100,
                            ),
                            Text(
                              "Services",
                              style: TextStyle(
                                color: colorwhite,
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => ComplaintsMobileScreen()));
                  },
                  child: SizedBox(
                      height: 160,
                      width: 160,
                      child: Card(
                        color: Colors.blue,
                        child: Column(
                          children: [
                            Icon(
                              Icons.comment,
                              color: colorwhite,
                              size: 100,
                            ),
                            Text(
                              "Complaints",
                              style: TextStyle(
                                color: colorwhite,
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => PaymentMobileScreen()));
                  },
                  child: SizedBox(
                      height: 160,
                      width: 160,
                      child: Card(
                        color: Colors.blue,
                        child: Column(
                          children: [
                            Icon(
                              Icons.payment,
                              color: colorwhite,
                              size: 100,
                            ),
                            Text(
                              "Payment",
                              style: TextStyle(
                                color: colorwhite,
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () async {
                    print("clock");
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Logout Alert'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: const <Widget>[
                                Text('Do you want to logout?'),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text(
                                'Yes',
                                style: TextStyle(color: Colors.red),
                              ),
                              onPressed: () async {
                                await FirebaseAuth.instance
                                    .signOut()
                                    .then((value) => {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (builder) =>
                                                      MobileSignIn()))
                                        });
                              },
                            ),
                            TextButton(
                              child: Text(
                                'No',
                                style: TextStyle(color: Colors.green),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: SizedBox(
                      height: 160,
                      width: 160,
                      child: Card(
                        color: Colors.blue,
                        child: Column(
                          children: [
                            Icon(
                              Icons.logout,
                              color: colorwhite,
                              size: 100,
                            ),
                            Text(
                              "Log Out",
                              style: TextStyle(
                                color: colorwhite,
                              ),
                            ),
                          ],
                        ),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
