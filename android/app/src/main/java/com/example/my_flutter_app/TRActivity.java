package com.example.my_flutter_app;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;

import theoremreach.com.theoremreach.TheoremReach;
import theoremreach.com.theoremreach.TheoremReachRewardListener;
import theoremreach.com.theoremreach.TheoremReachSurveyAvailableListener;
import theoremreach.com.theoremreach.TheoremReachSurveyListener;

import io.flutter.app.FlutterActivity;

public class TRActivity extends FlutterActivity implements TheoremReachRewardListener, TheoremReachSurveyListener, TheoremReachSurveyAvailableListener {

    private final String TAG = "TheoremReach";
    
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.theoremreach);
      TheoremReach.initWithApiKeyAndUserIdAndActivityContext("api_token", "user_id", this);
        //customize navigation header
        TheoremReach.getInstance().setNavigationBarText("Demo App");
        TheoremReach.getInstance().setNavigationBarColor("#211548");
        TheoremReach.getInstance().setNavigationBarTextColor("#FFFFFF");

        //set reward and survey status listeners
        TheoremReach.getInstance().setTheoremReachRewardListener(this);
        TheoremReach.getInstance().setTheoremReachSurveyListener(this);
        TheoremReach.getInstance().setTheoremReachSurveyAvailableListener(this);

        if (TheoremReach.getInstance().isSurveyAvailable()) {
             TheoremReach.getInstance().showRewardCenter();
         }

    }
    @Override
    protected void onStart() {
     super.onStart();
    }
    @Override
    protected void onResume() {
        super.onResume();
        TheoremReach.getInstance().onResume(this);
    }

    @Override
    protected void onPause() {
        super.onPause();
        TheoremReach.getInstance().onPause();
    }

    @Override
    public void onReward(int i) {
        Log.d(TAG, "onReward: " + i);

    }

    @Override
    public void onRewardCenterClosed() {
        Log.d(TAG, "onRewardCenterClosed");
    }

    @Override
    public void onRewardCenterOpened() {
        Log.d(TAG, "onRewardCenterOpened");
    }

    @Override
    public void theoremreachSurveyAvailable(boolean surveyAvailable) {
        Log.d(TAG, "TheoremReach Survey Available: " + surveyAvailable);
    }

}
