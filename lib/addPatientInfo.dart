import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class addPatientInfo extends StatefulWidget {
  const addPatientInfo({super.key});

  @override
  State<addPatientInfo> createState() => _addPatientInfoState();
}

final TextEditingController _date = TextEditingController();
final TextEditingController _examinationDate = TextEditingController();
final TextEditingController _followupDate = TextEditingController();

class _addPatientInfoState extends State<addPatientInfo> {
  String level = "Yes";
  Uint8List? _image;
  File? selectedImage;

  var nameText = TextEditingController();
  var mrdText = TextEditingController();
  var refText = TextEditingController();
  var hospitalText = TextEditingController();
  var phoneText = TextEditingController();
  var emailText = TextEditingController();
  var addressText = TextEditingController();
  var commentsText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Add Patient Info",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        )),
        toolbarHeight: 50,
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 400,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Basic Details",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: nameText,
                    decoration: InputDecoration(
                      labelText: "Name",
                      labelStyle: TextStyle(),
                      fillColor: Colors.blueGrey.shade50,
                      filled: true,
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: mrdText,
                    decoration: InputDecoration(
                      labelText: "MRD No.",
                      labelStyle: TextStyle(),
                      fillColor: Colors.blueGrey.shade50,
                      filled: true,
                    ),
                  ),
                  SizedBox(height: 18),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "Gender",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(width: 28),
                        Radio(
                            value: "Yes",
                            groupValue: level,
                            onChanged: (value) {
                              setState(() {
                                level = value.toString();
                              });
                            }),
                        Text(
                          "Male",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(width: 22),
                        Radio(
                            value: "No",
                            groupValue: level,
                            onChanged: (value) {
                              setState(() {
                                level = value.toString();
                              });
                            }),
                        Text(
                          "Female",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),

                  //add date picker
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _showDatePicker(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              TextField(
                                controller: _date,
                                readOnly: true,
                                enabled: false,
                                cursorColor: Colors.black,
                                style: TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: -0.42),
                                decoration: InputDecoration(
                                    labelText: "Date of Birth",
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                    floatingLabelStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: Colors.grey.shade300),
                                    suffixIcon: IconButton(
                                      onPressed: null,
                                      icon: Icon(Icons.calendar_today),
                                    )),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),

                  TextField(
                    controller: refText,
                    decoration: InputDecoration(
                        labelText: 'Ref. Physician',
                        labelStyle: TextStyle(),
                        fillColor: Colors.blueGrey.shade50,
                        filled: true,
                        prefixText: "Dr. ",
                        prefixIcon: Icon(Icons.account_circle)),
                  ),

                  SizedBox(height: 20),

                  TextField(
                    controller: hospitalText,
                    decoration: InputDecoration(
                        labelText: 'Hospital',
                        labelStyle: TextStyle(),
                        fillColor: Colors.blueGrey.shade50,
                        filled: true,
                        prefixIcon: Icon(Icons.local_hospital_outlined)),
                  ),

                  SizedBox(height: 28),

                  TextField(
                    controller: phoneText,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        labelText: "Phone Number",
                        labelStyle: TextStyle(),
                        fillColor: Colors.blueGrey.shade50,
                        filled: true,
                        prefixText: "+880",
                        prefixIcon: Icon(Icons.phone)),
                  ),

                  SizedBox(height: 20),

                  TextField(
                    controller: emailText,
                    decoration: InputDecoration(
                        labelText: 'Email (Optional)',
                        labelStyle: TextStyle(),
                        fillColor: Colors.blueGrey.shade50,
                        filled: true,
                        prefixIcon: Icon(Icons.email_outlined)),
                  ),

                  SizedBox(height: 20),

                  TextField(
                    controller: addressText,
                    decoration: InputDecoration(
                        labelText: 'Address (Optional)',
                        labelStyle: TextStyle(),
                        fillColor: Colors.blueGrey.shade50,
                        filled: true,
                        prefixIcon: Icon(Icons.home)),
                  ),

                  SizedBox(height: 12),

                  Text('Visilation Details'),

                  SizedBox(height: 12),

                  Container(
                    height: 400,
                    width: 400,
                    color: Colors.blueGrey.shade50,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _showExaminationDatePicker(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                TextField(
                                  controller: _examinationDate,
                                  readOnly: true,
                                  enabled: false,
                                  cursorColor: Colors.black,
                                  style: TextStyle(
                                      color: Color(0xff000000),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      letterSpacing: -0.42),
                                  decoration: InputDecoration(
                                      labelText: "Examination Date",
                                      labelStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                      floatingLabelStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Colors.black),
                                      suffixIcon: IconButton(
                                        onPressed: null,
                                        icon:
                                            Icon(Icons.calendar_today_outlined),
                                      )),
                                ),
                                SizedBox(height: 12),
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        _showFollowupDatePicker(context);
                                      },
                                      child: Column(
                                        children: [
                                          TextField(
                                            controller: _followupDate,
                                            readOnly: true,
                                            enabled: false,
                                            cursorColor: Colors.black,
                                            style: TextStyle(
                                                color: Color(0xff000000),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                                letterSpacing: -0.42),
                                            decoration: InputDecoration(
                                                labelText: "Followup Date",
                                                labelStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                floatingLabelStyle: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15,
                                                    color: Colors.black),
                                                suffixIcon: IconButton(
                                                  onPressed: null,
                                                  icon: Icon(Icons
                                                      .calendar_today_outlined),
                                                )),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 12),
                                TextField(
                                  controller: commentsText,
                                  decoration: InputDecoration(
                                    labelText:
                                        'Diagnosis / Comments (Optional)',
                                    labelStyle: TextStyle(),
                                  ),
                                ),
                                SizedBox(height: 12),
                                Text('Attachments'),
                                Stack(
                                  children: [
                                    _image != null
                                        ? CircleAvatar(
                                            radius: 60,
                                            backgroundImage:
                                                MemoryImage(_image!),
                                          )
                                        : CircleAvatar(
                                            radius: 60,
                                          ),
                                    Positioned(
                                        top: 0,
                                        bottom: 0,
                                        left: 0,
                                        right: 0,
                                        child: IconButton(
                                            onPressed: () {
                                              showImagePickerOption(context);
                                            },
                                            icon: Icon(
                                              Icons.add_a_photo_outlined,
                                              size: 70,
                                            )))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          String uName = nameText.text.toString();
                          String uMrd = mrdText.text.toString();
                          String uRef = refText.text;
                          String uHospital = hospitalText.text;
                          String uPhone = phoneText.text;
                          String uEmail = emailText.text;
                          String uAddress = addressText.text;
                          String uComments = commentsText.text;

                          print(
                              "Name: $uName, MRD No.: $uMrd, Ref. Physician: Dr. $uRef, Hospital: $uHospital, Phone Number: +880$uPhone, "
                              "Email: $uEmail, Address: $uAddress, Diagnosis / Comments: $uComments");

                          Navigator.pop(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ListView()));
                          print('Submit Button Pressed');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue.shade900,
                          padding: EdgeInsets.symmetric(
                              horizontal: 130, vertical: 10),
                          //minimumSize: Size(200, 50)
                        ),
                        child: Text(
                          'Submit',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showDatePicker(ctx) {
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              height: 300,
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 250,
                      child: CupertinoDatePicker(
                        maximumYear: 2040,
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: DateTime.now(),
                        onDateTimeChanged: (value) {
                          _date.text =
                              '${value.day.toString().padLeft(2, '0')}/'
                              '${value.month.toString().padLeft(2, '0')}/'
                              '${value.year.toString()}';
                        },
                      ),
                    )
                  ],
                ),
              ),
            ));
  }

  void _showExaminationDatePicker(ctx) {
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              height: 300,
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 250,
                      child: CupertinoDatePicker(
                        maximumYear: 2040,
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: DateTime.now(),
                        onDateTimeChanged: (value) {
                          _examinationDate.text =
                              '${value.day.toString().padLeft(2, '0')}/'
                              '${value.month.toString().padLeft(2, '0')}/'
                              '${value.year.toString()}';
                        },
                      ),
                    )
                  ],
                ),
              ),
            ));
  }

  void _showFollowupDatePicker(ctx) {
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              height: 300,
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 250,
                      child: CupertinoDatePicker(
                        maximumYear: 2040,
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: DateTime.now(),
                        onDateTimeChanged: (value) {
                          _followupDate.text =
                              '${value.day.toString().padLeft(2, '0')}/'
                              '${value.month.toString().padLeft(2, '0')}/'
                              '${value.year.toString()}';
                        },
                      ),
                    )
                  ],
                ),
              ),
            ));
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.5,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromCamera();
                      },
                      child: SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 70,
                            ),
                            Text("Camera")
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromGallery();
                      },
                      child: SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              size: 70,
                            ),
                            Text("Gallery")
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future _pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }

  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }
}
