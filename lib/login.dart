// ignore_for_file: prefer_const_constructors
import 'dart:io';
import 'package:digital_dental/clinichistory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'history.dart';
import 'newscan.dart';
import 'signup.dart';
import 'newscan.dart';
class login extends StatefulWidget {
  int? indiOrclinc;
String? iddd;
  login({required this.indiOrclinc, this.iddd});

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  late List _outputs;
  File? _image;
  bool _loading = false;

/*
  final imagepicker = ImagePicker();
  File? gg;

  Future PickImage() async {
    final xray = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xray == null) return;
    final tempo = File(xray.path);

    setState(() {
      this.gg = tempo;
    });
classify(gg!);
  }
  loadmodel() async {
    await Tflite.loadModel(model: "assets/catsvsdogs.tflite",
    labels: "assets/lable.txt",
    );

  }
classify(File img) async{
    var output = await Tflite.runModelOnImage(path: gg!.path,
    numResults: 2,
     threshold: .5,
     imageMean: 127.5,
     imageStd: 127.5
    );
//print(output);
print("is it here");
  }
  @override
void initstate(){
    super.initState();
    loadmodel();
  }
 @override
  void dispose() async{
    super.dispose();
    await Tflite.close();
  }*/

  @override
  void initState() {
    super.initState();
    _loading = true;
    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model.tflite",
      labels: "assets/label.txt",
      numThreads: 1,
    );
  }

  late String modelresult;

  classifyImage(File image) async {
//await    resizeImage(Image.file(_image!),20,20);
    // Image(image: (_image != null) ? FileImage(_image!) as ImageProvider : AssetImage("assets/xxx.png"), width: 15, height: 15,);
    var output = await Tflite.runModelOnImage(
        path: image.path,
        // imageStd: 255.0,  // defaults to 1.0
        asynch: true);
    setState(() {
      _loading = false;
      _outputs = output!;
      modelresult = _outputs[0][
          "label"]; //calculate how confident the model with the sample (confidence of the first item *index)
      //print("a7a  $modelresult");
    });
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  pickImage() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = File(image.path);
    });

    await classifyImage(_image!);
  }

  /*Image resizeImage(Image image, double width, double height) {
    return Image(
      image: image.image,
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  } */
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('digital dentistry'),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
/*
          _loading
              ? Container(
                  height: 25,
                  width: 25,
                )
              : Container(
                  margin: EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _image == null
                          ? Container()
                          : _outputs != null
                              ? Text(
                                  _outputs[0]["label"],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20),
                                )
                              : Container(child: Text(""))
                    ],
                  ),
                ),
          */

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () async {
                  await pickImage();

                  if (doc == 1) {
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => newscan(
                            ggg: _image,
                            modelresult: modelresult,
                          ),
                        ));
                  } else if (doc == 2) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => newscan(
                            ggg: _image,
                            modelresult: modelresult,
                          ),
                        ));

                    //  results(qq: gg,)));
                    // fetch data from the cloud
                  }
                },
                icon: Icon(
                  Icons.attachment_outlined,
                  size: 33,
                ),
                label: Text(
                  "run new scan",
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    )),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  if (widget.indiOrclinc == 2) {
                    //clinc 1 ndividual 2
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => history()));
                  } else if (widget.indiOrclinc == 1) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => clinichistory(iid: widget.iddd,)));
                  }
                },
                icon: Icon(Icons.history, size: 33),
                label: Text(
                  "view history",
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    )),
              ),
            ],
          ),
        ]));
  }
}
