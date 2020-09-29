# react-native-pagecall

# Supported platforms

- iOS

# Installation

## Using npm

```
npm install react-native-pagecall --save
```

## Using yarn

```
yarn add @react-native-pagecall
```

## Link

- React Native 0.60+

[CLI autolink feature](https://github.com/react-native-community/cli/blob/master/docs/autolinking.md) links the module while building the app.

Use CocoaPods to add the native `RNPageCall` to your project:

```
npx pod-install
```

- React Native <= 0.59

```
react-native link @react-native-pagecall
```

# Usage

## Importing

```jsx
import RNPagecall from 'react-native-pagecall';
```

## Start PageCall

```jsx
// PCA URL, publicRoomId, query
RNPagecall.call("https://pplink.net/call", "publicRoomId", null);
```

## Start live streaming

```jsx
// LSA URL
RNPagecall.startLiveStreamingWithURL("https://pplink.net/live/test_room");
```

## Add a Privacy Policy

You can add a **Privacy Policy** to your iOS project's info.plist like shown below. 

```xml
<key>NSCameraUsageDescription</key>
<string>Blink uses your camera to make video calls.</string>
<key>NSContactsUsageDescription</key>
<string>Blink needs access to your contacts in order to be able to call them.</string>
<key>NSMicrophoneUsageDescription</key>
<string>Blink uses your microphone to make calls.</string>
<key>NSPhotoLibraryAddUsageDescription</key>
<string>Our application needs permission to write photos...</string>
```

## Bitcode

Build Settings → Build Options → Set `Enable Bitcode = No`