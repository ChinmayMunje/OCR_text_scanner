import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';

class ScanText extends StatefulWidget {
  @override
  _ScanTextState createState() => _ScanTextState();
}

class _ScanTextState extends State<ScanText> {
  int _camera = FlutterMobileVision.CAMERA_BACK;
  String _textValue = "text";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Scan Text"),
        ),

        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_textValue),
                      Container(
                        width: 200,
                        height: 60,
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            color: Colors.orange,
                              onPressed: _scantext,
                            child: Text("Scan Text", style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<Null> _scantext() async{
    List<OcrText> text = [];
    try{
      text = await FlutterMobileVision.read(
        camera: _camera,
        waitTap: true,
        fps: 5,
      );
      setState(() {
        _textValue = text[0].value;
      });
    } catch(e){
      text.add(new OcrText('Failed to recognize text.'));
    }
  }
}

