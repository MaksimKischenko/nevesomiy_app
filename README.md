## Guidelines
Run the example of connecting to OpenFin and creating applications

1. Clone this repository

2. If pubspec.yaml file drops error with pockets compatibility try write a command: dart pub upgrade --null-safety 

3. Go to release directory and start void main (run)

4. Once the flutter app starts in emulator you will see screens of app

5. App is a poetry page presentation. In it we can
    #### choose the theme of the poem
    #### read more poems  
    #### search poem by title 
    #### go into linkURL 
    #### see books in PDF format 


## Source Code Review

Source code for the example is located in /lib/. 
Start point of app is main.dart



1. We add some permissions to AndroidManifest.xml

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.nevesomiy_app">

   <uses-permission android:name="android.permission.INTERNET" />
   <uses-permission android:name="android.permission.QUERY_ALL_PACKAGES"/>
   <application
        android:label="nevesomiy_app"
        android:name="${applicationName}"
        android:icon="@mipmap/nev">
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:launchMode="singleTop"
            android:theme="@style/LaunchTheme"
            android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize">
            <!-- Specifies an Android theme to apply to this Activity as soon as
                 the Android process has started. This theme is visible to the user
                 while the Flutter UI initializes. After that, this theme continues
                 to determine the Window background behind the Flutter UI. -->
            <meta-data
              android:name="io.flutter.embedding.android.NormalTheme"
              android:resource="@style/NormalTheme"
              />
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>
        <!-- Don't delete the meta-data below.
             This is used by the Flutter tool to generate GeneratedPluginRegistrant.java -->
        <meta-data
            android:name="flutterEmbedding"
            android:value="2" />
    </application>
</manifest>
```

## More Info
More information and documentation can be found at:

#### https://pub.dev/packages/url_launcher
#### https://pub.dev/packages/native_pdf_view







