// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:groom_admin/mobile/mobile_home_page.dart';

// class ServiceMobileDetail extends StatefulWidget {
//   final uid,
//       serviceDiscount,
//       description,
//       providerName,
//       serviceLocation,
//       serviceCategory,
//       serviceName,
//       servicePrice,
//       serviceImage;
//   const ServiceMobileDetail(
//       {super.key,
//       required this.serviceCategory,
//       required this.serviceImage,
//       required this.serviceDiscount,
//       required this.description,
//       required this.servicePrice,
//       required this.serviceName,
//       required this.serviceLocation,
//       required this.providerName,
//       required this.uid});

//   @override
//   State<ServiceMobileDetail> createState() => _ServiceMobileDetailState();
// }

// class _ServiceMobileDetailState extends State<ServiceMobileDetail> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Provider Detail",
//           style: TextStyle(color: Colors.white),
//         ),
//         iconTheme: IconThemeData(color: Colors.white),
//         backgroundColor: Colors.blue,
//       ),
//       body: SingleChildScrollView(
//           child: Center(
//         child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Column(children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: CircleAvatar(
//                     radius: 50,
//                     backgroundImage: NetworkImage(widget.photo),
//                   ),
//                 ),
//                 Text(
//                   "Name:",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Text(widget.fullName)
//               ]),
//               SizedBox(height: 9),
//               Column(children: [
//                 Text(
//                   "Email:",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Text(widget.email),
//               ]),
//               SizedBox(height: 9),
//               Column(children: [
//                 Text(
//                   "Contact Number:",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Text(
//                   widget.contactNumber,
//                 )
//               ]),
//               SizedBox(height: 9),
//               Column(children: [
//                 Text(
//                   "Password:",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Text(
//                   widget.password,
//                 )
//               ]),
//               SizedBox(height: 20),
//               TextButton(
//                   onPressed: () async {
//                     showDialog<void>(
//                       context: context,
//                       barrierDismissible: false, // user must tap button!
//                       builder: (BuildContext context) {
//                         return AlertDialog(
//                           title: const Text('Customer Detail'),
//                           content: SingleChildScrollView(
//                             child: ListBody(
//                               children: <Widget>[
//                                 Text("Email :" + widget.email),
//                                 Text("Name :" + widget.fullName),
//                                 Text(
//                                   "Do you want To remove?",
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                 )
//                               ],
//                             ),
//                           ),
//                           actions: <Widget>[
//                             TextButton(
//                               child: const Text('Yes'),
//                               onPressed: () async {
//                                 await FirebaseFirestore.instance
//                                     .collection("provider")
//                                     .doc(widget.uid)
//                                     .delete();

//                                 Navigator.pushReplacement(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (builder) =>
//                                             MobileHomePage()));
//                               },
//                             ),
//                             TextButton(
//                               child: const Text('No'),
//                               onPressed: () {
//                                 Navigator.of(context).pop();
//                               },
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                   },
//                   child: Text("Delete Account")),
//               SizedBox(height: 10),
//             ]),
//       )),
//     );
//   }
// }
