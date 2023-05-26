// ignore_for_file: prefer_const_constructors
import 'dart:io';

import 'package:flutter/material.dart';
import 'login.dart';
class results extends StatefulWidget {
  String pname, pmail, age, number, dname,mr;

  File? qq;

//  results({required this.qq});
  results({
    required this.pname,
    required this.pmail,
    required this.number,
    required this.dname,
    required this.age,
    required this.qq,
    required this.mr,
  });

  @override
  State<results> createState() => _resultsState();
}

class _resultsState extends State<results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('digital dentistry'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                heightFactor: 3,
                child: Text(
                  'Results',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              if (widget.qq != null)
                Center(
                    child: Image.file(
                  widget.qq!,
                  width: 150, height: 150,
                )),
              SizedBox(
                height: 20,
              ),

              Text(
                '  name : ${widget.pname} \n',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                '  e-mail : ${widget.pmail} \n',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                '  phone number :  ${widget.number} \n',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                '  age : ${widget.age} \n',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                '  doctor name : ${widget.dname} \n',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                ' results : ${widget.mr}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              //   Text('    \n' ,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            ],
          ),
        ));
  }
}
