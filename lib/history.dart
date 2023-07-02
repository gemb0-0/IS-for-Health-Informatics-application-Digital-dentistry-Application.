import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'main.dart';
import 'signup.dart';
import 'newscan.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Item {
  final int age;
  final String fullname;
  final String email;
  final String result;

  Item({required this.age, required this.fullname, required this.email,required this.result});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      result: json['xrayResult'],
      age: json['paitient']['age'],
      fullname: json['paitient']['fullName'],
      email: json['paitient']['email'],
    );
  }
}

class history extends StatefulWidget {
  @override
  State<history> createState() => _historyState();
  String ?docid;
  history({ this.docid});

}

class _historyState extends State<history> {
  List<Item> items = [];

  Future<List<Item>> fetchData() async {
    final response = await http.get(Uri.parse('https://10.0.2.2:7072/api/paitientdata'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List<dynamic> itemList = jsonData['data'];

      return itemList.map((item) => Item.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch data from API');
    }
  }


  @override
  void initState() {
    super.initState();
    fetchData().then((data) {
      setState(() {
        items = data;
        print(items);
      });
    }).catchError((error) {
      print('Error: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('digital dentistry'),
      ),
      body: Column(
        children: [
          SizedBox(height: 15,),
          Center(
            child: Text(
              'history',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
          SizedBox(height: 25,),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {

                return ListTile(
                  title: Text(items[index].fullname),
                  subtitle: Text('${items[index].email}, \n age ${items[index].age}\n ${items[index].result}'),
                 // trailing: Text(items[index].id.toString()),
                  isThreeLine: true,
                  dense: true,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
