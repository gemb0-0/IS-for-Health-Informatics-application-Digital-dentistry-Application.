// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'signup.dart';
import 'login.dart';

class themain extends StatefulWidget {
  @override
  _theMain createState() => _theMain();

}

final _formkey = GlobalKey<FormState>();


class _theMain extends State<themain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('digital dentistry'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            SingleChildScrollView(
              child: Form(
                  key : _formkey,
                  child: Column(
                      children: [
                        Text(
                          'login to use the app',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextFormField(
                                validator: (value) {
                                  if (value== null || value.isEmpty)
                                    return 'please enter your mail';
                                },
                                decoration: InputDecoration(
                                    icon: Icon(Icons.mail), labelText: "enter your email"),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(15),
                              child: TextFormField(
                                validator: (value) {
                                  if (value== null || value.isEmpty) {
                                    return 'please enter your password';
                                  }
                                  else null;
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
                                  padding: EdgeInsets.only(left: 15,top: 30),
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
                        SizedBox(height: 85,),



                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            ElevatedButton(
                              onPressed: () {
                                if (_formkey.currentState!.validate()&& doc!=0&& doc ==1){
                                  Navigator.push(
                                    context, MaterialPageRoute(builder: (context) {return login();
                                  }),
                                  );
                                }
                                else if (doc ==2){
                                  Navigator.push(
                                    context, MaterialPageRoute(builder: (context) {return login();
                                  }),
                                  );
                                } //add indvidual page

                              },
                              child: Text('login'),
                              style: ElevatedButton.styleFrom(
                                textStyle:
                                TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                                  MaterialPageRoute(builder: (context) {
                                    return signup();
                                  }),
                                );
                              },
                              child: Text('sign up'),
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.teal, width: 2),
                                textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
