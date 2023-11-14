# ``IStar``

Insider Star Framework (IStar)
This framework provides an custom webview for our customers.


Dir Structure:
Utilities:  stores all constant data and miscellaneous tools
Extensions: stores all extensions
Models:     stores all models
Protocol:   stores all protocol(in other words interface)


Classes
IStarWebview: Main class for custom webview
    methods:
        init                          : starts the entire flow
        requestNotificationPermission : allows us to obtain notification permission
        listenAppStates               : allows to listen to application states 
        addStarInterface              : allows the user to add customized buttons in one go
        smallStarButtonClick          : the action that will be triggered when the smallstar button is clicked
        bigStarButtonClick            : the action that will be triggered when the bigstar button is clicked
        resetStarButtonClick          : the action that will be triggered when the reset button is clicked
        logList                       : It is used to display all variable states on the console.
        scheduleNotification          : allows scheduling a local notification
        applicationDidEnterBackground : triggered when the app goes to the background
        applicationWillTerminate      : triggered when the app goes to the terminate



