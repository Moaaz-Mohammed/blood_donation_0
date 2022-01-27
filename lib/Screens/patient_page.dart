import 'package:blood_donation/Screens/home/home_screen.dart';
import 'package:blood_donation/shared/Controllers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:blood_donation/shared/components.dart';
import 'package:flutter/material.dart';
import '../Styles/CustomColors.dart';

class Patient extends StatefulWidget {
  const Patient({Key? key}) : super(key: key);

  @override
  _PatientState createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  var BloodType;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleText(text: 'تسجيل بيانات مريض'),
        centerTitle: true,
        leading: const Text(''),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        //Name
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'برجاء إدخال إسم المريض';
                            }
                            return null;
                          },
                          cursorColor: CustomColors.primaryRedColor,
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: CustomColors.primaryRedColor),
                          decoration: InputDecoration(
                            hintTextDirection: TextDirection.rtl,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            labelText: 'اســم المريــض',
                            labelStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(
                              Icons.person,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        // Status
                        TextFormField(
                          cursorColor: CustomColors.primaryRedColor,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'برجاء وصف حالة المريض';
                            }
                            return null;
                          },
                          controller: statusController,
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: CustomColors.primaryRedColor),
                          decoration: InputDecoration(
                            hintTextDirection: TextDirection.rtl,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            labelText: 'حــالـه المريـض',
                            labelStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(
                              Icons.info,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //Phone number
                        TextFormField(
                          cursorColor: CustomColors.primaryRedColor,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'برجاء إدخال رقم هاتف لسهولة التواصل معك';
                            }
                            return null;
                          },
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          style: TextStyle(color: CustomColors.primaryRedColor),
                          decoration: InputDecoration(
                            hintTextDirection: TextDirection.rtl,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            labelText: 'رقم الهاتف',
                            labelStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(
                              Icons.phone,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //another phone number
                        TextFormField(
                          cursorColor: CustomColors.primaryRedColor,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'برجاء إدخال رقم هاتف آخر للإحتياط';
                            }
                            return null;
                          },
                          controller: anotherphoneController,
                          keyboardType: TextInputType.phone,
                          style: TextStyle(color: CustomColors.primaryRedColor),
                          decoration: InputDecoration(
                            hintTextDirection: TextDirection.rtl,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            labelText: 'رقم هاتف أخر',
                            labelStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(
                              Icons.phone,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //Blood type
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: Row(
                            children: [
                              Icon(Icons.bloodtype,
                                  color: CustomColors.primaryRedColor),
                              SizedBox(width: 10),
                              DropdownButton(
                                dropdownColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                alignment: Alignment.center,
                                iconSize: 30,
                                iconEnabledColor: CustomColors.primaryRedColor,
                                value: BloodType,
                                hint: Text(
                                  'أختر فصيلة الدم',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                items: [
                                  DropdownMenuItem(
                                    child:
                                        Center(child: defaultText(text: 'O+')),
                                    value: 'O+',
                                  ),
                                  DropdownMenuItem(
                                    child:
                                        Center(child: defaultText(text: 'O-')),
                                    value: 'O-',
                                  ),
                                  DropdownMenuItem(
                                    child:
                                        Center(child: defaultText(text: 'A+')),
                                    value: 'A+',
                                  ),
                                  DropdownMenuItem(
                                    child:
                                        Center(child: defaultText(text: 'A-')),
                                    value: 'A-',
                                  ),
                                  DropdownMenuItem(
                                    child:
                                        Center(child: defaultText(text: 'B+')),
                                    value: 'B+',
                                  ),
                                  DropdownMenuItem(
                                    child:
                                        Center(child: defaultText(text: 'B-')),
                                    value: 'B-',
                                  ),
                                  DropdownMenuItem(
                                    child:
                                        Center(child: defaultText(text: 'AB+')),
                                    value: 'AB+',
                                  ),
                                  DropdownMenuItem(
                                    child:
                                        Center(child: defaultText(text: 'AB-')),
                                    value: 'AB-',
                                  ),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    BloodType = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 5,
                          color: Colors.black,
                          thickness: 1,
                        ),
                        // Age
                        TextFormField(
                          cursorColor: CustomColors.primaryRedColor,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'برجاء إدخال سن المريض';
                            }
                            return null;
                          },
                          controller: ageController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: CustomColors.primaryRedColor),
                          decoration: InputDecoration(
                            hintTextDirection: TextDirection.rtl,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            labelText: 'سـن المريـض',
                            labelStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(
                              Icons.person,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //hospital address
                        TextFormField(
                          cursorColor: CustomColors.primaryRedColor,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'برجاء إدخال المستشفى أو المكان الذي سيتم فيه التبرع';
                            }
                            return null;
                          },
                          controller: hospitalController,
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: CustomColors.primaryRedColor),
                          decoration: InputDecoration(
                            hintTextDirection: TextDirection.rtl,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            labelText: 'اسم المستشفى وعنوانها',
                            labelStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(
                              Icons.location_on,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //blood amount needed
                        TextFormField(
                          cursorColor: CustomColors.primaryRedColor,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'برجاء إدخال عدد أكياس الدم المطلوبة';
                            }
                            return null;
                          },
                          controller: bloodamountController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: CustomColors.primaryRedColor),
                          decoration: InputDecoration(
                            hintTextDirection: TextDirection.rtl,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            labelText: 'عدد أكياس الدم المطلوبه',
                            labelStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(
                              Icons.person,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 40,
                ),
                //Submit Button
                Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        final firestoreInstance = FirebaseFirestore.instance;
                        firestoreInstance.collection("Patient").add({
                          "name": nameController.text,
                          "status": statusController.text,
                          "phone": phoneController.text,
                          "another_phone": anotherphoneController.text,
                          "blood_type": BloodType.toString(),
                          "age": ageController.text,
                          "hospital": hospitalController.text,
                          "blood_needed": bloodamountController.text,
                          "registered_time": DateTime.now().toLocal(),
                        }).then(
                          (value) => showDialog(
                              context: context,
                              builder: (context) => CustomDialog(
                                    image: Image.network(
                                        'https://media.tenor.com/images/2525ba72ea472c55bf8b2153e9ea9f11/tenor.gif'),
                                    title: 'تم إرسال البيانات بنجاح',
                                    description1:
                                        'تم إرسال البيانات وسيتم التواصل معك في أقرب فرصة',
                                    description2: '',
                                  )).then(
                              (value) => navigateTo(context, HomeScreen())),
                        );
                      }
                      ;
                    },
                    child: Text(
                      'إرسـال البيـانـات',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
