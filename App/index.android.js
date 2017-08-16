/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  Button,
} from 'react-native';

import {
  StackNavigator,
} from 'react-navigation';

class App1 extends Component {
  static navigationOptions = {
    title: '1',
  };

  render() {
    const { navigate } = this.props.navigation;
    return (
      <View>
        <Button
          title="从这里开始我的APP!"
          onPress={() => 
            navigate('App2', name: 'name')}/>
      </View>
    );
  }
}

class App2 extends Component {
  static navigationOptions = {
    title: '2',
  };
  render() {
    const { navigate } = this.props.navigation;
    return (
      <View>
         <Button
          title="再跳"
          onPress={() => 
            navigate('App3')}/>
      </View>
    );
  }
}

class App3 extends Component {
  static navigationOptions = {
    title: '3',
  };

  render() {
    const { navigate } = this.props.navigation;
    return (
      <View>
        <Button title="回去第一个" 
          onPress={() => navigate('App1')}
         />
      </View>
    );
  }
}

const App = StackNavigator({
  App1: {screen: App1},
  App2: {screen: App2},
  App3: {screen: App3},
});


AppRegistry.registerComponent('App', () => App);
