import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:groom_admin/screens/home_page.dart';
import 'package:groom_admin/utils/buttons.dart';

class ProviderDetails extends StatefulWidget {
  final uid, email, fullName, password, contactNumber;
  ProviderDetails(
      {super.key,
      required this.contactNumber,
      required this.email,
      required this.fullName,
      required this.password,
      required this.uid});

  @override
  State<ProviderDetails> createState() => _ProviderDetailsState();
}

class _ProviderDetailsState extends State<ProviderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                FormSection(
                  contactNumber: widget.contactNumber,
                  email: widget.email,
                  fullName: widget.fullName,
                  password: widget.password,
                  uid: widget.uid,
                ),
                _ImageSection(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FormSection extends StatefulWidget {
  final contactNumber;
  final email;
  final uid;
  final fullName;
  final password;

  const FormSection({
    Key? key,
    required this.password,
    required this.email,
    required this.fullName,
    required this.contactNumber,
    required this.uid,
  }) : super(key: key);

  @override
  State<FormSection> createState() => FormSectionState();
}

class FormSectionState extends State<FormSection> {
  //Program
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          width: 448,
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset("assets/logo.png"),
            SizedBox(height: 9),
            Row(children: [
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
            Row(children: [
              Text(
                "Email:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.email,
              )
            ]),
            SizedBox(height: 9),
            Row(children: [
              Text(
                "Password:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(widget.password),
            ]),
            SizedBox(height: 9),
            Row(children: [
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
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SaveButton(
                    onTap: () async {
                      showDialog<void>(
                        context: context,
                        barrierDismissible: false, // user must tap button!
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Provider Detail'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Text("Email :" + widget.email),
                                  Text("Name :" + widget.fullName),
                                  Text(
                                    "Do you want to remove user account permantely",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Yes'),
                                onPressed: () async {
                                  await FirebaseFirestore.instance
                                      .collection("provider")
                                      .doc(widget.uid)
                                      .delete();

                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) => HomePage()));
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
                    title: "Delete Account"),
              ),
            ),
            SizedBox(height: 10),
          ])),
    );
  }
}

class _ImageSection extends StatelessWidget {
  const _ImageSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            "assets/logo.png",
            height: 300,
          ))
        ],
      ),
    );
  }
}
