import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime temp = WorldTime(location: "Berlin", flag: "germany.png", url: "Europe/Berlin");
    await temp.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': temp.location,
      'flag': temp.flag,
      'time': temp.time,
      'isDayTime': temp.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCircle(
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: index.isEven ? Colors.white : Colors.white,
              ),
            );
          },
          size: 100.0,
        ),
      ),
    );
  }
}
