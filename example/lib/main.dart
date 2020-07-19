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
        .init(apiToken: 'api_key', userId: 'userId');
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
            child: RaisedButton(
          child: Text("Launch TheoremReach"),
          onPressed: () => TheoremReach.instance.show(),
        )),
      ),
    );
  }
}
