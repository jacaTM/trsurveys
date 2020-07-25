import 'dart:async';
import 'package:flutter/services.dart';

typedef void TheoremReachOnRewardListener(int quantity);
typedef void TheoremReachSurveyAvailableListener(int survey);
typedef void TheoremReachRewardCenterOpenedListener();
typedef void TheoremReachRewardCenterClosedListener();

class TheoremReach {
  static TheoremReach get instance => _instance;

  final MethodChannel _channel;

  static final TheoremReach _instance = TheoremReach.private(
    const MethodChannel('theoremreach'),
  );

  TheoremReach.private(MethodChannel channel) : _channel = channel {
    _channel.setMethodCallHandler(_platformCallHandler);
  }

  static TheoremReachOnRewardListener _theoremReachOnReward;
  static TheoremReachSurveyAvailableListener
      _theoremReachSurveyAvailableListener;
  static TheoremReachRewardCenterOpenedListener _theoremReachRewardCenterOpened;
  static TheoremReachRewardCenterClosedListener _theoremReachRewardCenterClosed;

  Future<void> init({String apiToken, String userId}) async {
    assert(apiToken != null && apiToken.isNotEmpty);
    return _channel.invokeMethod(
        "init", <String, dynamic>{"api_token": apiToken, "user_id": userId});
  }

  Future<void> show({String placementID}) {
    return _channel.invokeMethod(
        "show", <String, dynamic>{"placementID": placementID});
  }

  Future<void> setNavBarText({String text}) {
    return _channel
        .invokeMethod('setNavBarText', <String, dynamic>{'text': text});
  }

  Future<void> setNavBarColor({String color}) {
    return _channel
        .invokeMethod('setNavBarColor', <String, dynamic>{'color': color});
  }

  Future<void> setNavBarTextColor({String textColor}) {
    return _channel.invokeMethod(
        'setNavBarTextColor', <String, dynamic>{'text_color': textColor});
  }

  Future _platformCallHandler(MethodCall call) async {
    print(
        "TheoremReach _platformCallHandler call ${call.method} ${call.arguments}");

    switch (call.method) {
      case "onReward":
        _theoremReachOnReward(call.arguments);
        break;

      case "theoremReachSurveyAvailable":
        _theoremReachSurveyAvailableListener(call.arguments);
        break;

      case "onRewardCenterOpened":
        _theoremReachRewardCenterOpened();
        break;

      case "onRewardCenterClosed":
        _theoremReachRewardCenterClosed();
        break;
      default:
        print('Unknown method ${call.method}');
    }
  }

  void setTheoremReachOnRewardListener(
          TheoremReachOnRewardListener theoremReachOnRewardListener) =>
      _theoremReachOnReward = theoremReachOnRewardListener;

  void setTheoremReachSurveyAvaiableListener(
          TheoremReachSurveyAvailableListener
              theoremReachSurveyAvailableListener) =>
      _theoremReachSurveyAvailableListener =
          theoremReachSurveyAvailableListener;

  void setTheoremReachRewardCenterOpened(
          TheoremReachRewardCenterOpenedListener
              theoremReachRewardCenterOpenedListener) =>
      _theoremReachRewardCenterOpened = theoremReachRewardCenterOpenedListener;

  void setTheoremReachRewardCenterClosed(
          TheoremReachRewardCenterClosedListener
              theoremReachRewardCenterClosedListener) =>
      _theoremReachRewardCenterClosed = theoremReachRewardCenterClosedListener;
}
