# **TheoremReach Plugin**

## Getting started:
### 1. Initialise TheoremReach 
Call `init()` during app initialization

```sh
TheoremReach()
 .init(apiToken: 'apiToken', userId: 'userId', listener: trListener);
```
  
### 2. Initialise callback listeners
 
 ```sh
 trListener(TheoremReachListener event) {
 if (event == TheoremReachListener.theoremReachSurveyAvailable) {
 print('survey available');
 } else if (event == TheoremReachListener.onReward) {
 print('on reward');
 } else if (event == TheoremReachListener.onRewardCenterClosed) {
 print('on closed');
 } else if (event == TheoremReachListener.onRewardCenterOpened) {
 print('on opened');
 }
 }
 ```

 ### 3. Call TheoremReach 
  
  ```sh 
TheoremReach().show()
 ```

   ### IMPORTANT: If you’re Publishing and using Proguard add these lines to your configuration file:
  ```sh
 -keep class theoremreach.com.** { *; }
 ```   
 
  For the complete implementation, please refer to the example repo.    