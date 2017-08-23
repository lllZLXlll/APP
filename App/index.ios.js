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
  Image,
  Button,
} from 'react-native';
import { TabNavigator, StackNavigator } from 'react-navigation';

class Home extends Component {
  static navigationOptions = {
    tabBarLabel: '首页',
    tabBarIcon: () => (
      <Image
        source={require('./app/images/icon/icon_1.png')}
        style={styles.icon}
      />
    ),
  };

  render() {
    return (
      <View>
        <Button 
          title="跳转"
          onPress={() => this.props.navigation.navigate('Page')}
        />
      </View>
    );
  }
}

class Page extends Component {
  static navigationOptions = {
    tabBarLabel: '我的',
    tabBarIcon: () => (
      <Image
        source={require('./app/images/icon/icon_2.png')}
        style={styles.icon}
      />
    ),
  };

  render() {
    console.log(this.props.navigation.setParams);
    return (
      <Button
        title="回跳"
        onPress={() => this.props.navigation.goBack()}
      />
    );
  }
}

class Page1 extends Component {
  static navigationOptions = {
    tabBarLabel: '我的',
    tabBarIcon: () => (
      <Image
        source={require('./app/images/icon/icon_2.png')}
        style={styles.icon}
      />
    ),
  };

  render() {
    console.log(this.props.navigation.setParams);
    return (
      <Button
        title="回跳"
        onPress={() => this.props.navigation.goBack()}
      />
    );
  }
}

class Page2 extends Component {
  static navigationOptions = {
    tabBarLabel: '我的',
    tabBarIcon: () => (
      <Image
        source={require('./app/images/icon/icon_2.png')}
        style={styles.icon}
      />
    ),
  };

  render() {
    console.log(this.props.navigation.setParams);
    return (
      <Button
        title="回跳"
        onPress={() => this.props.navigation.goBack()}
      />
    );
  }
}

const Tab = TabNavigator({
  Home: {
    screen: Home,
  },
  Page: {
    screen: Page,
  },
  Page1: {
    screen: Page1,
  },
  Page2: {
    screen: Page2,
  },

},{
  tabBarOptions: {
    activeBackgroundColor: '#999',
    inactiveBackgroundColor: '#fff',
    labelStyle: {
      fontSize: 12,
      color: 'red',
      marginLeft: 0,
    },
    style: {
      height: 40,
    },
    
  },
  lazy: false,
});

const App = StackNavigator({
  Home: {
    screen: Tab,
    navigationOptions: {
      title: '首页',
    },
  },
},{

});


const styles = StyleSheet.create({
  icon: {
    width: 20,
    height: 20,
  },
});

AppRegistry.registerComponent('App', () => App);
