import 'package:flutter/material.dart';
import 'package:trsurveys/trsurveys.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    TheoremReach.instance
        .init(apiToken: 'yourapitoken', userId: 'userId');
    TheoremReach.instance.setTheoremReachOnRewardListener(onTheoremReachReward);
    TheoremReach.instance
        .setTheoremReachRewardCenterClosed(onTheoremReachRewardCenterClosed);
    TheoremReach.instance
        .setTheoremReachRewardCenterOpened(onTheoremReachRewardCenterOpened);
    TheoremReach.instance
        .setTheoremReachSurveyAvaiableListener(onTheoremReachSurveyAvailable);
    super.initState();
  }

  void onTheoremReachReward(int quantity) {
    print('TR: $quantity');
  }

  void onTheoremReachSurveyAvailable(int survey) {
    print('TR: $survey');
  }

  void onTheoremReachRewardCenterClosed() {
    print('TR: closed');
  }

  void onTheoremReachRewardCenterOpened() {
    print('TR: opened');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("Launch TheoremReach"),
                onPressed: () => TheoremReach.instance.show(),
              ),
              RaisedButton(
                child: Text("Launch TheoremReach Placement"),
                onPressed: () => TheoremReach.instance.show(placementID: 'yourplacement'),
              )
            ],
          )
        ),
      ),
    );
  }
}
