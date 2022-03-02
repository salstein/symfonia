# symfonia

A cryptocurrency app.

## symfonia

The project was built using the Model, Views, Controller, and Services (MVCs) Architecture.
The state management used is GetX state management.

# Features Implemented 
-  UI : all broken and splited into Widget classes and Methods to support reusability and readability.
-  API calls : All Api calls are handled by the BaseClient class which is under the services folder the response from the request is sent to the Coin model.
-  The cion model converts the API response Json into Coin object which can easily be binded to the UI.
-  Controller: the controller class extends the GetxController which handle the state of the call.
-  Pull down refresh: The refresh indicator widget which allows the pull down refresh effect to easily update observable values from the controller. 
- -- 


Links:

- [GITHUB LINK](https://github.com/salstein/symfonia)



