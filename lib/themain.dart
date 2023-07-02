// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'package:flutter/material.dart';
//import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'login.dart';
import 'signup.dart';
import 'signup.dart';
class themain extends StatefulWidget {
  @override
  _theMain createState() => _theMain();
}

final _formkey = GlobalKey<FormState>();

class _theMain extends State<themain> {

final TextEditingController email =  TextEditingController();
 final TextEditingController password =  TextEditingController();
  bool errormsg = false;
/*
  Future<void> loginapi() async {
final String mail = email.toString();
final String pass = password.toString();
    final Map<String, dynamic> requestBody = {
      'Email': mail,
      'Password': pass,
            "ReturnUrl" : ""

    };

final String jsonBody = json.encode(requestBody);
  try {
      var response = await http.post(
        Uri.parse('https://10.0.2.2:7072/api/account/login/'),
        body:jsonBody ,
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        print(data['token']);
        print('Login successfully');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => login(indiOrclinc: doc)),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Wrong email or password.'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ),
        );
        print('Failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }
*/

  /*
  void loginapi(String email, password) async {
    try {
      var response = await http.post(
          Uri.parse('https://10.0.2.2:7072/api/account/login/'),
          body: {'Email': email, 'Password ': password});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('Login successfully');
        Navigator.push(context, MaterialPageRoute(builder: (context) {return login(indiOrclinc: doc);}),);
      } else {ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('wrong email or password.'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ),
        );
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }



  Future<void> _login() async {
    final String eemail = email.toString();
    final String ppassword = password.toString();
    final Map<String, dynamic> requestBody = {
      'Email': eemail,
      'Password': ppassword,
      "ReturnUrl" : ""

    };

    // Convert the request body to JSON
    final String jsonBody = json.encode(requestBody);

    final response = await http.post(
      Uri.parse('https://10.0.2.2:7072/api/account/login/'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonBody,
    );

    if (response.statusCode == 200) {
      print('a7a');
    } else {
      print('failed');
    }
  }
  */

  Future<void> loginapi() async {
    final String pass = password.text;
    final String mail = email.text;
    final Map<String, dynamic> payload = {
      "Email": mail,
      "Password":pass ,
      "ReturnUrl": ""
    };

    final url = 'https://10.0.2.2:7072/api/account/login';

    final encodedPayload = jsonEncode(payload);

    final headers = <String, String>{
      'Content-Type': 'application/json',
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: encodedPayload,
      );

      if (response.statusCode == 200) {
        print('sucessful');

        final responseData = jsonDecode(response.body);
        final data = responseData['data'];
        final id = data['id'];
        print(id);
        Navigator.push(context, MaterialPageRoute(builder: (context) => login(indiOrclinc: doc,iddd: id,)),);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Wrong email or password.'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ),
        );
        print('Login failed. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during login: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('digital Dentistry'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SingleChildScrollView(
              child: Form(
                  key: _formkey,
                  child: Column(children: [
                    Text(
                      'login to use the app',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextFormField(
                            controller: email,
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return 'please enter your mail';
                            },
                            decoration: InputDecoration(
                                icon: Icon(Icons.mail),
                                labelText: "enter your email"),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            controller: password,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'please enter your password';
                              } else
                                null;
                            },
                            obscureText: true,
                            //   controller: passwordController,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.lock),
                              labelText: 'Password',
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 15, top: 30),
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
                      ],
                    ),
                    SizedBox(
                      height: 85,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                           if (_formkey.currentState!.validate() && doc != 0) {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => login(indiOrclinc: doc)),);

                             // loginapi(email.text.toString(), password.text.toString());
                           loginapi();

                          }
                          },
                          child: Text('login'),
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                            minimumSize: Size(125, 50),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(33),
                              ),
                            ),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>signup() ),
                            );                          },
                          child: Text('sign up'),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.teal, width: 2),
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                            minimumSize: Size(125, 50),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(33),
                              ),
                            ),
                            //   primary: Colors.redAccent.withOpacity(.2),
                          ),
                        ),
                      ],
                    ),
                  ])),
            ),
          ],
        ),
      ),
    );
  }
}
