/**
 * Sample React Native App
 *
 * adapted from App.js generated by the following command:
 *
 * react-native init example
 *
 * https://github.com/facebook/react-native
 */

import React, { Component } from 'react';
import { 
  StyleSheet, 
  Text, 
  View, 
  TextInput,
  TouchableOpacity
} from 'react-native';
import RNPagecall from 'react-native-pagecall';
import AsyncStorage from '@react-native-community/async-storage';

export default class App extends Component {
  state = {
    serverURL: ""
    //roomID: ""
  };

  handleURL = text => {
    this.setState({ serverURL: text });
  };
 
  handleRoomID = text => {
    this.setState({ roomID: text });
  };

  // startLiveStreaming = (serverURL, roomID) => {
  //   AsyncStorage.setItem('userInfo', JSON.stringify(this.state));
  //   RNPagecall.startLiveStreamingWithURL(serverURL, false, roomID, "","");
  // };

  startLiveStreaming = (serverURL) => {
    AsyncStorage.setItem('userInfo', JSON.stringify(this.state));
    //RNPagecall.startLiveStreamingWithURL(serverURL);
    // PCA URL, publicRoomId, query
    RNPagecall.startPageCallWithUrl("https://pplink.net/call", "publicRoomId_Test", null);
  };

  componentDidMount() {
    AsyncStorage.getItem('userInfo').then((state)=> {
        if( state != null){
            this.setState(JSON.parse(state));
        }
    });
  }

  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.title}>Live Streaming Example</Text>
        <TextInput
          style={styles.input}
          underlineColorAndroid="transparent"
          placeholder="URL"
          placeholderTextColor="#9a73ef"
          autoCapitalize="none"
          onChangeText={this.handleURL}
          value={this.state.serverURL}
        />
        {/* <TextInput
          style={styles.input}
          underlineColorAndroid="transparent"
          placeholder="RoomID"
          placeholderTextColor="#9a73ef"
          autoCapitalize="none"
          onChangeText={this.handleRoomID}
          value={this.state.roomID}
        /> */}
        <TouchableOpacity
          style={styles.submitButton}
          //onPress={() => this.startLiveStreaming(this.state.serverURL, this.state.roomID)}
          onPress={() => this.startLiveStreaming(this.state.serverURL)}
        >
          <Text style={styles.submitButtonText}>Start!!</Text>
        </TouchableOpacity>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    //justifyContent: 'center',
    //alignItems: 'center',
    backgroundColor: '#F5FCFF',
    paddingTop: 30
  },
  title: {
    fontSize: 20,
    textAlign: 'left',
    margin: 15,
  },
  input: {
    margin: 15,
    height: 40,
    color: "black",
    borderColor: "#7a42f4",
    borderWidth: 1
  },
  submitButton: {
    backgroundColor: "#7a42f4",
    padding: 10,
    margin: 15,
    height: 40
  },
  submitButtonText: {
    color: "white"
  }
});
