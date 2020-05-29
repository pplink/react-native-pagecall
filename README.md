# Getting started

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
// PCA URL, RoomID, MyID
RNPagecall.startPageCallWithURL("https://pplink.net", "roomID", "myID");
```

## Start live streaming

```jsx
// PCA URL, isHost, RoomID, UserID, UserName
RNPagecall.startLiveStreamingWithURL("https://pplink.net", false, "roomID", "userID", "userName");
```