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

   ### IMPORTANT: If you’re Publishing and using Proguard add these lines to your configuration file:
  ```sh
 -keep class theoremreach.com.** { *; }
 ```   
 
  For the complete implementation, please refer to the example repo.    