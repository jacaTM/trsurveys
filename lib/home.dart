import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  static const platform = const MethodChannel('trsurveys');
  static String apiKey = '';

  Future _loadTheoremReach() async {
    try {
      await platform.invokeMethod('theoremReach', apiKey).then((result) {
        print(result);
      });
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: _loadTheoremReach,
          child: Text("Load TheoremReach"),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
