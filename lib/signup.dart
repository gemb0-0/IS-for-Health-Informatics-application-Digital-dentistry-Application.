// ignore_for_file: prefer_const_constructors
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'login.dart';
import 'themain.dart';


int doc = 0;
class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

final _formkeysignup = GlobalKey<FormState>();

TextFormField signupform(String ll) {
  validator:
  (value) {
    if (value == null || value.isEmpty) return 'please enter your mail';
  };
  return TextFormField(
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

class _signupState extends State<signup> {
  @override
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
              ),
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
                height: 150,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formkeysignup.currentState!.validate()&& doc!=0){
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) {return themain();
                    }),
                    );
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
