import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ServicePriceDetail extends StatefulWidget {
  final uid,
      servicePostDescription,
      serviceName,
      customerName,
      location,
      providerName;
  ServicePriceDetail(
      {super.key,
      required this.location,
      required this.servicePostDescription,
      required this.serviceName,
      required this.customerName,
      required this.providerName,
      required this.uid});

  @override
  State<ServicePriceDetail> createState() => _ServicePriceDetailState();
}

class _ServicePriceDetailState extends State<ServicePriceDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                FormSection(
                  providerName: widget.providerName,
                  location: widget.location,
                  servicePostDescription: widget.servicePostDescription,
                  serviceName: widget.serviceName,
                  customerName: widget.customerName,
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
  final location;
  final servicePostDescription;
  final uid;
  final serviceName;
  final customerName;
  final providerName;

  FormSection({
    Key? key,
    required this.customerName,
    required this.providerName,
    required this.servicePostDescription,
    required this.serviceName,
    required this.location,
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
              Text(widget.serviceName)
            ]),
            SizedBox(height: 9),
            Row(children: [
              Text(
                "servicePostDescription:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.servicePostDescription,
              )
            ]),
            SizedBox(height: 9),
            Row(children: [
              Text(
                "customerName:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(widget.customerName),
            ]),
            SizedBox(height: 9),
            Row(children: [
              Text(
                "Location:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.location,
              )
            ]),
            SizedBox(height: 10),
            SizedBox(height: 9),
            Row(children: [
              Text(
                "Provider Name:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.providerName,
              )
            ]),
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
