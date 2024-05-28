import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ServiceDetails extends StatefulWidget {
  final uid,
      serviceDiscount,
      description,
      providerName,
      serviceLocation,
      serviceCategory,
      serviceName,
      servicePrice,
      serviceImage;
  ServiceDetails(
      {super.key,
      required this.serviceCategory,
      required this.serviceImage,
      required this.serviceDiscount,
      required this.description,
      required this.servicePrice,
      required this.serviceName,
      required this.serviceLocation,
      required this.providerName,
      required this.uid});

  @override
  State<ServiceDetails> createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                FormSection(
                  serviceImage: widget.serviceImage,
                  serviceLocation: widget.serviceLocation,
                  serviceCategory: widget.serviceCategory,
                  serviceDiscount: widget.serviceDiscount,
                  description: widget.description,
                  providerName: widget.providerName,
                  serviceName: widget.serviceName,
                  servicePrice: widget.servicePrice,
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
  final serviceCategory;
  final serviceDiscount;
  final uid;
  final description;
  final providerName;
  final serviceImage;
  final serviceLocation;
  final servicePrice;
  final serviceName;

  const FormSection({
    Key? key,
    required this.providerName,
    required this.serviceImage,
    required this.serviceDiscount,
    required this.serviceLocation,
    required this.serviceName,
    required this.servicePrice,
    required this.description,
    required this.serviceCategory,
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
          width: 600,
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.serviceImage),
                  radius: 60,
                ),
                SizedBox(height: 9),
                Row(children: [
                  Text(
                    "Service Name:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(widget.serviceName)
                ]),
                SizedBox(height: 9),
                Row(children: [
                  Text(
                    "Service Category:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(widget.serviceCategory)
                ]),
                SizedBox(height: 9),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    "Description:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.description.toString(),
                  )
                ]),
                SizedBox(height: 9),
                Row(children: [
                  Text(
                    "Provider Name:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(widget.providerName),
                ]),
                SizedBox(height: 9),
                Row(children: [
                  Text(
                    "Service Cost:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.servicePrice.toString(),
                  )
                ]),
                SizedBox(height: 9),
                Row(children: [
                  Text(
                    "Service Discount:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.serviceDiscount.toString(),
                  )
                ]),
                SizedBox(height: 9),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    "Service Location:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.serviceLocation.toString(),
                  )
                ]),
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
