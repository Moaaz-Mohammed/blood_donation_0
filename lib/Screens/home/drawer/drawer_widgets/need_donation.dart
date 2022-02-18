import 'package:blood_donation/Screens/home/drawer/drawer_widgets/patient_page.dart';
import 'package:blood_donation/shared/Functions.dart';
import 'package:blood_donation/translations/locale_keys.g.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../shared/Strings.dart';

class NeedDonation extends StatefulWidget {
  const NeedDonation({Key? key}) : super(key: key);

  @override
  _NeedDonationState createState() => _NeedDonationState();
}

class _NeedDonationState extends State<NeedDonation> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection(Strings.patientsCollection)
      .snapshots();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.need_donation.tr()),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: height * 0.9,
            child: StreamBuilder<QuerySnapshot>(
              stream: _usersStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView(
                    children: snapshot.data!.docs.map(
                  (DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
                        child: ListTile(
                          title: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Name
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.person,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(data[Strings.patientName],
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2),
                                  ],
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                //Address
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(data[Strings.patientAddress]),
                                  ],
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                //Blood Type
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.bloodtype,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(data[Strings.patientBloodType]),
                                  ],
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                //Contact
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.phone,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(data[Strings.patientPhone]),
                                  ],
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                //Patient Age
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.person,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(data[Strings.patientAge]),
                                  ],
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                // Status of the patient
                                Column(
                                  children: [
                                    Text(LocaleKeys.status.tr(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 350,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child:
                                            Text(data[Strings.patientStatus]),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ).toList());
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Functions.navigatorPush(
            context: context,
            screen: const Patient(),
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}