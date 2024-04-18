import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:groom_admin/mobile/mobile_detail/provider_mobile_detail.dart';

class ProviderMobileScreen extends StatefulWidget {
  const ProviderMobileScreen({super.key});

  @override
  State<ProviderMobileScreen> createState() => _ProviderMobileScreenState();
}

class _ProviderMobileScreenState extends State<ProviderMobileScreen> {
  TextEditingController controller = TextEditingController();
  bool isShowUser = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Image.asset("assets/logo.png"),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    isShowUser = true;
                  });
                },
                icon: Icon(Icons.search))
          ],
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: TextFormField(
            controller: controller,
            decoration: InputDecoration(label: Text('Search By Name')),
            onFieldSubmitted: (_) {
              setState(() {
                isShowUser = true;
              });
            },
          )),
      body: isShowUser
          ? StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("provider")
                  .where("fullName", isGreaterThanOrEqualTo: controller.text)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text('Loading...');
                }

                List<DocumentSnapshot> documents = snapshot.data!.docs;
                return Container(
                  height: 400,
                  child: ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (BuildContext context, int index) {
                      var documentData =
                          documents[index].data() as Map<String, dynamic>;
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => MobileProviderDetail(
                                        contactNumber:
                                            documentData['contactNumber'],
                                        password: documentData['password'],
                                        email: documentData['email'],
                                        uid: documentData['uid'],
                                        fullName: documentData['fullName'],
                                        photo: documentData['photoURL'],
                                      )));
                        },
                        title: Text(
                          documents[index]['fullName'],
                          style: TextStyle(color: Colors.black),
                        ),
                        subtitle: Text(
                          documents[index]['email'],
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    },
                  ),
                );
              },
            )
          : StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("provider").snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                var data = snapshot.data!.docs;
                if (data.isEmpty) {
                  // No records found
                  return Center(
                    child: Text('No Records Found'),
                  );
                }
                return LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    // Calculate the number of columns based on available width

                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        var documentData =
                            data[index].data() as Map<String, dynamic>;
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(documentData['photoURL']),
                                ),
                                trailing: TextButton(
                                  child: const Text('View'),
                                  onPressed: () async {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (builder) =>
                                                MobileProviderDetail(
                                                  contactNumber: documentData[
                                                      'contactNumber'],
                                                  password:
                                                      documentData['password'],
                                                  email: documentData['email'],
                                                  uid: documentData['uid'],
                                                  fullName:
                                                      documentData['fullName'],
                                                  photo:
                                                      documentData['photoURL'],
                                                )));
                                  },
                                ),
                                title: Text("Email: " + documentData['email']),
                                subtitle:
                                    Text("Name: " + documentData['fullName']),
                              )),
                        );
                      },
                    );
                  },
                );
              }),
    );
  }
}
