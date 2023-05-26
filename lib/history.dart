import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'main.dart';
import 'signup.dart';
import 'newscan.dart';
// ignore_for_file: prefer_const_constructors

class history extends StatefulWidget {
  @override
  State<history> createState() => _historyState();
}

class _historyState extends State<history> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('digital dentistry'),
      ),
      body: Column(
        children: const [
          SizedBox(height: 15,),

          Text(
            'history',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          SizedBox(height: 25,),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("patient name"),
            subtitle: Text('paient \n  doc name '),
            trailing: Icon(Icons.arrow_forward_ios),
         //   onTap: =>,

          ),
          SizedBox(height: 25,),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("patient name"),
            subtitle: Text('paient \n  doc name '),
            trailing: Icon(Icons.arrow_forward_ios),
            //   onTap: =>,

          ), SizedBox(height: 25,),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("patient name"),
            subtitle: Text('paient \n  doc name '),
            trailing: Icon(Icons.arrow_forward_ios),
            //   onTap: =>,

          ), SizedBox(height: 25,),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("patient name"),
            subtitle: Text('paient \n  doc name '),
            trailing: Icon(Icons.arrow_forward_ios),
            //   onTap: =>,

          ), SizedBox(height: 25,),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("patient name"),
            subtitle: Text('paient \n  doc name '),
            trailing: Icon(Icons.arrow_forward_ios),
            //   onTap: =>,

          ),

        ],
      ),
    );
  }
}
