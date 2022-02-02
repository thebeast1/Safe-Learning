import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:safe_learning/pages/broadcast_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _channelName = TextEditingController();
  String check = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height * 0.2,
                child: TextFormField(
                  controller: _channelName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintText: 'أسم الدرس',
                  ),
                ),
              ),
              TextButton(
                onPressed: () => onJoin(isBroadcaster: false),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.remove_red_eye,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'طالب',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.pink,
                ),
                onPressed: () => onJoin(isBroadcaster: true),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.live_tv),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'مدرس',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              Text(
                check,
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
        ));
  }

  Future<void> onJoin({bool isBroadcaster}) async {
    await [Permission.camera, Permission.microphone].request();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BroadcastPage(
          channelName: _channelName.text,
          isBroadcaster: isBroadcaster,
        ),
      ),
    );
  }
}
