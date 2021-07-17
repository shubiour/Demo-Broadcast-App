import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'broadcast_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  final _channelName = TextEditingController();
  String check = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text("Demo Broadcast"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                height: MediaQuery.of(context).size.height * 0.13,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.blueAccent),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "Welcome to demo\nbroadcast",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                RaisedButton(
                  onPressed: () =>
                      onJoin(isBroadcaster: false), //disabling the func
                  //onPressed: () {},
                  color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Watch    ',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Icon(Icons.remove_red_eye, color: Colors.white)
                    ],
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                RaisedButton(
                  onPressed: () =>
                      onJoin(isBroadcaster: true), //enabling the func
                  color: Colors.red,
                  //onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Go Live    ',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Icon(Icons.live_tv, color: Colors.white)
                    ],
                  ),
                ),
                Text(
                  check,
                  style: TextStyle(color: Colors.white),
                )
              ])
            ],
          ),
        ));
  }

  Future<void> onJoin({required bool isBroadcaster}) async {
    await [Permission.camera, Permission.microphone].request();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BroadcastScreen(
          channelName: "shuvo", //e.g shuvo takes it and go to broadcastscreen
          isBroadcaster: isBroadcaster,
        ),
      ),
    );
  }
}
