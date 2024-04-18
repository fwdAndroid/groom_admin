import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:groom_admin/mobile/mobile_home_page.dart';

class MobileCustomerDetail extends StatefulWidget {
  final uid, email, fullName, password, contactNumber;
  const MobileCustomerDetail(
      {super.key,
      required this.contactNumber,
      required this.email,
      required this.fullName,
      required this.password,
      required this.uid});

  @override
  State<MobileCustomerDetail> createState() => _MobileCustomerDetailState();
}

class _MobileCustomerDetailState extends State<MobileCustomerDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Customer Detail",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset("assets/logo.png"),
        SizedBox(height: 9),
        Column(children: [
          Text(
            "Name:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(widget.fullName)
        ]),
        SizedBox(height: 9),
        Column(children: [
          Text(
            "Email:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(widget.email),
        ]),
        SizedBox(height: 9),
        Column(children: [
          Text(
            "Contact Number:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            widget.contactNumber,
          )
        ]),
        SizedBox(height: 9),
        Column(children: [
          Text(
            "Password:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            widget.password,
          )
        ]),
        SizedBox(height: 20),
        SizedBox(height: 10),
        TextButton(
            onPressed: () async {
              showDialog<void>(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Customer Detail'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text("Email :" + widget.email),
                          Text("Name :" + widget.fullName),
                          Text(
                            "Do you want To remove?",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Yes'),
                        onPressed: () async {
                          await FirebaseFirestore.instance
                              .collection("customer")
                              .doc(widget.uid)
                              .delete();

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => MobileHomePage()));
                        },
                      ),
                      TextButton(
                        child: const Text('No'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Text("Delete Account")),
        SizedBox(height: 10),
      ])),
    );
  }
}
