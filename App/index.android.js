/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */
import React, { Component } from 'react';
import {
  AppRegistry,
  Text,
  View,
  Button,
  StyleSheet,
  WebView,
  Image,
} from 'react-native';
import { StackNavigator, TabNavigator, DrawerNavigator } from 'react-navigation';

class page1 extends Component {
  render() {
    return <Text>页面1</Text>
  }
}

class page2 extends Component {
  render() {
    return <Text>页面2</Text>
  }
}

const Tab = TabNavigator ({
  page1: {screen: page1 },
  page2: {screen: page2 },
});

const Stack = StackNavigator({
  Home: {
    screen: Tab,
    navigationOptions: {
      title: '主页', 
    },
  },
});

class MyHomeScreen extends React.Component {
  static navigationOptions = {
    drawerLabel: 'Home',
    drawerIcon: ({ tintColor }) => (
      <Image
        source={require('./app/images/icon/icon_1.png')}
      />
    ),
  };

  render() {
    return null;
  }
}

class MyNotificationsScreen extends React.Component {
  static navigationOptions = {
    drawerLabel: 'Notifications',
    drawerIcon: ({ tintColor }) => (
      <Image
        source={require('./app/images/icon/icon_1.png')}
      />
    ),
  };

  render() {
    return null;
  }
}

class webView extends Component {

  render() {
    return (
      <WebView
          source={{uri: 'https://www.baidu.com'}}
        />
    );
  }
}

const styles = StyleSheet.create({
  icon: {
    width: 24,
    height: 24,
  },
});

const Drawer = DrawerNavigator({
  Home: {
    screen: Stack,
    navigationOptions: {
      title: '', 

    },
  },
  Notifications: {
    screen: MyNotificationsScreen,
  },
}, {
  contentOptions: {
    activeBackgroundColor: '#999',
    style: {
      marginVertical: 0,
    },
  },
  drawerPosition: 'left'
  // contentComponent: webView,


});


AppRegistry.registerComponent('App', () => Drawer);
