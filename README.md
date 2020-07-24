# **TheoremReach Plugin**

## Getting started:
### 1. Initialise TheoremReach 
Call `init()` during app initialization & set your listeners.

```sh
 TheoremReach.instance
        .init(apiToken: 'api_key', userId: 'userId');
    TheoremReach.instance.setTheoremReachOnRewardListener(onTheoremReachReward);
    TheoremReach.instance
        .setTheoremReachRewardCenterClosed(onTheoremReachRewardCenterClosed);
    TheoremReach.instance
        .setTheoremReachRewardCenterOpened(onTheoremReachRewardCenterOpened);
    TheoremReach.instance
        .setTheoremReachSurveyAvaiableListener(onTheoremReachSurveyAvailable);
```
  
### 2. Initialise callback listeners
 
 ```sh
  void onTheoremReachReward(int quantity) {
    print('TR: $quantity');
  }

  void onTheoremReachSurveyAvailable(int survey) {
    print('TR: $survey'); // 1 represents if a survey is available 
  }

  void onTheoremReachRewardCenterClosed() {
    print('TR: closed');
  }

  void onTheoremReachRewardCenterOpened() {
    print('TR: opened');
  }
 ```

 ### 3. Call TheoremReach 
  
  ```sh 
TheoremReach.instance.show()
 ```
 If you use placements:
 ```sh
 TheoremReach.instance.show(placementID: "yourplacement");

   ### IMPORTANT: If you’re Publishing and using Proguard add these lines to your configuration file:
  ```sh
 -keep class theoremreach.com.** { *; }
 ```

 ### 4. Android users
 TheoremReach SDK 3.4.0 uses Play Services Ads 19.2.0, and needs to add in Manifest the following meta-data
 with an AdMob App ID.
 ```sh
    <manifest>
        <application>
            <!-- Sample AdMob App ID: ca-app-pub-3940256099942544~3347511713 -->
            <meta-data
                android:name="com.google.android.gms.ads.APPLICATION_ID"
                android:value="ca-app-pub-xxxxxxxxxxxxxxxx~yyyyyyyyyy"/>
        </application>
    </manifest>
 ```
 
  For the complete implementation, please refer to the example repo.    