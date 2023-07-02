// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'dart:io';
import 'package:digital_dental/history.dart';
import 'package:flutter/material.dart';
import 'results.dart';
import 'signup.dart';
import 'login.dart';
import 'package:http/http.dart' as http;
class newscan extends StatefulWidget {
  @override
  State<newscan> createState() => _newscanState();
  String modelresult;
  File? ggg;
  newscan({required this.ggg,required this.modelresult});

}

TextFormField patient(String ll, j) {
  return TextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) return 'cannot be empty';
    },
    controller: j,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      labelText: ll,
    ),
  );
}

TextFormField patientt(String ll, k) {
  return TextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) return 'cannot be empty';
    },
    controller: k,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      labelText: ll,
    ),
    keyboardType: TextInputType.number,
  );
}

class _newscanState extends State<newscan> {
  // DateTime _selectedDate = DateTime.now();
  TextEditingController _pname = new TextEditingController();
  TextEditingController dname = new TextEditingController();
  TextEditingController _pmail = new TextEditingController();
  TextEditingController _number = new TextEditingController();
  TextEditingController _age = new TextEditingController();
  final _formkeynewscan = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    List agerange = [];
    for (int i = 5; i <= 95; i++) {
      agerange.add(i.toString());
    }
    String selectedage = agerange[0];

    Future<void> newscanapi() async {
      final String namee = _pname.text;
      final String emaill = _pmail.text;
      final String num = _number.text;
      final String resultt = widget.modelresult.toString();
      final String agee = _age.text;
      final String docname = dname.text;

      final Map<String, dynamic> payload = {
        "fullName": namee,
        "email": emaill,
        "phoneNumber": num,
        "XRayResult": resultt,
        "age": agee,
        "doctorName" : docname,


      };

      final url = 'https://10.0.2.2:7072/api/paitients/SavePaitient';
      final encodedPayload = jsonEncode(payload);

      final headers = <String, String>{
        'Content-Type': 'application/json',
      };

      try {
        // Make the POST request
        final response = await http.post(
          Uri.parse(url),
          headers: headers,
          body: encodedPayload,
        );
        print('ffggff');
        print(namee);
        print(emaill);
        print(num);
        print(resultt);
        print(agee);
        print(docname);
        if (response.statusCode == 200) {
          print('a7aaaah');
         // Navigator.push(context, MaterialPageRoute(builder: (context) => results(pname: _pname.text, pmail: _pmail.text, number: _number.text, dname: docname, age: _age, qq: widget.ggg, mr: widget.modelresult,),),);

        } else {
          // Request failed
          print('Signup failed. Status code: ${response.statusCode}');
        }
      } catch (e) {
        // An error occurred
        print('Error during signup: $e');
      }
    }



    return Scaffold(
        appBar: AppBar(
          title: Text('digital dentistry'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formkeynewscan,
            child: Column(

                children: [
                  SizedBox(
                    height: 44,
                  ),

                  Text(
                    'Enter patient info',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  SizedBox(
                    height: 70,
                  ),

                  Padding(
                      padding: EdgeInsets.all(13),
                      child: patient('patient\'s name', _pname)),
                  Padding(
                      padding: EdgeInsets.all(13),
                      child: patient('patient\'s email', _pmail)),

                  Padding(
                      padding: EdgeInsets.all(13),
                      child: patientt('phone number', _number)),

                  Padding(
                      padding: EdgeInsets.all(13),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:[
                            Container(
                              width: 70,
                              child: DropdownButtonFormField(
                                value: selectedage,
                                items: agerange
                                    .map((e) => DropdownMenuItem(
                                  child: Text(e),
                                  value: e,
                                ))
                                    .toList(),
                                onChanged: (val) {
                                  selectedage = val as String;

                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(50),
                                      ),
                                    ),
                                    labelText: 'age'),
                              ),
                            )

                          ]
                      )),



                  Column(
                    children: [
                      SizedBox(
                        height: 90,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              child: doc ==1?
                              ElevatedButton.icon(
                                onPressed: () {
                                  newscanapi();

                                },
                                label: Text('  new patient   '),
                                icon: Icon(Icons.add),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(125, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(33),
                                  ),
                                ),
                              ): Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formkeynewscan.currentState!.validate()) {

                                    }
                                  },
                                  child: Text('  show result   '),
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(125, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(33),
                                    ),
                                  ),
                                ),
                              )
                          ),
                          //      SizedBox(width: 25,),
                          Container(
                              child: doc ==1 ?
                              OutlinedButton.icon(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => history()));
                                },
                                label: Text('existing patient'),
                                icon: Icon(Icons.view_agenda_rounded),
                                style: ElevatedButton.styleFrom(
                                    side: BorderSide(color: Colors.teal, width: 2),
                                    minimumSize: Size(125, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(33),
                                    )),
                              ):null
                          ),
                        ],
                      ),
                    ],
                  ),
                ]),
          ),
        ));
  }
}
