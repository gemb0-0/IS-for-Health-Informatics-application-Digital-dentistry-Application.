// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'login.dart';
import 'themain.dart';
import 'package:http/http.dart' as http;


int doc = 0;
TextEditingController name = new TextEditingController();
TextEditingController email = new TextEditingController();
TextEditingController password = new TextEditingController();
TextEditingController cpassword = new TextEditingController();

class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

final _formkeysignup = GlobalKey<FormState>();


class _signupState extends State<signup> {
  @override
  TextFormField signupform(String txt,Icon theicon, bool obs, data  ) {
    return TextFormField(
      obscureText:obs ,
        controller: data,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Cannot be empty';
        }},
          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50),),),
        labelText: txt,
        icon: theicon,

      ),
    );
  }



/*
  void signupapi(String name,String email, password,cpassword) async {
    try {
      var response = await http.post(
          Uri.parse('https://10.0.2.2:7072/Api/Hospitals/SaveHospital'),
          body: {  'HospitalName' : name,'Email': email, 'Password': password});

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('Login successfully');
        Navigator.push(
          context, MaterialPageRoute(builder: (context) {return login(indiOrclinc: doc);}),);
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }
*/


  Future<void> signupapi() async {
    // Create the JSON request payload
    final String namee = name.toString();
    final String passwordd = password.toString();
    final String emaill = email.toString();

    final Map<String, dynamic> payload = {
      "HospitalName": namee,
      "Password": passwordd,
      "User": {
        "Email": emaill,
      }
    };

    final url = 'https://10.0.2.2:7072/Api/Hospitals/SaveHospital';
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

      if (response.statusCode == 200) {
        print('Signup successful!');
        Navigator.push(context, MaterialPageRoute(builder: (context) {return themain();}),);
      } else {
        // Request failed
        print('Signup failed. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // An error occurred
      print('Error during signup: $e');
    }
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('digital dentistry'),
      ),

      body: SingleChildScrollView(
        child: Form(
          key: _formkeysignup,
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 25,
              ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: signupform('please enter your name', Icon(Icons.person, ),false,name ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: signupform('please enter your email', Icon(Icons.mail),false,email ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: signupform('enter your password', Icon(Icons.lock),true,password ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: signupform('confirm enter your password', Icon(Icons.lock),true, cpassword),
              ),
              /*
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                    validator:
                        (value) {
                      if (value == null || value.isEmpty) return 'please enter your name';
                    },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    labelText: "enter your name",
                    icon: Icon(Icons.person),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                    validator:
                        (value) {
                      if (value == null || value.isEmpty) return 'please enter your email';
                    },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    labelText: "enter your email",
                    icon: Icon(Icons.mail),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  validator:
                      (value) {
                    if (value == null || value.isEmpty) return 'please enter your password';
                  },
                  obscureText: true,
                  //   controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    labelText: 'Password',
                    icon: Icon(Icons.lock),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  validator:
                      (value) {
                    if (value == null || value.isEmpty) return 'please confirm your password';
                  },
                  obscureText: true,
                  //   controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    labelText: 'confirm your Password',
                    icon: Icon(Icons.lock),
                  ),
                ),
              ),*/
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 15, top: 15, bottom: 15),
                      child: Text(
                        'sign up as',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ))),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 15),
                  ),
                  Icon(Icons.supervisor_account),
                  Text(
                    ' clinic',
                    style: TextStyle(fontSize: 18),
                  ),
                  Radio(
                      value: 1,
                      groupValue: doc,
                      onChanged: (value) {
                        setState(() {
                          doc = value as int;
                        });
                      }),
                  Icon(Icons.person),
                  Text(
                    ' individual ',
                    style: TextStyle(fontSize: 18),
                  ),
                  Radio(
                    value: 2,
                    groupValue: doc,
                    onChanged: (value) {
                      setState(() {
                        doc = value as int;
                      });
                    },
                  )
                ],
              ),
              SizedBox(
                height: 125,
              ),
              ElevatedButton(
                onPressed:  () {
                 if (_formkeysignup.currentState!.validate()&& doc!=0){
                   signupapi();
                   Navigator.push(context, MaterialPageRoute(builder: (context) {return themain();}),);

                 }
                },
                style: ElevatedButton.styleFrom(
                  textStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  minimumSize: Size(100, 50),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
                child: Text('Register'),
              ),
            ],

          ),
        ),
      ),
    );
  }
}

