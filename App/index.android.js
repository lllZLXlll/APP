/*
  2017-8-24
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
import { 
  TabNavigator, 
  StackNavigator,
  NavigationActions,
} from 'react-navigation';

import Home from './app/resources/home/index';
import Message from './app/resources/message/index';
import Send from './app/resources/send/index';
import Found from './app/resources/found/index';
import User from './app/resources/user/index';
import Screen from './app/resources/home/screen';


const icon1 = require('./app/images/icon/icon_1.png');
const icon2 = require('./app/images/icon/icon_1_1.png');


const Tab = TabNavigator({
  Home: {
    screen: Home,
    navigationOptions: {
      headerTitle: '首页', // 设置头部导航栏文字
      tabBarLabel: '首页', // 设置标签栏标签文字
      headerRight: true,
      tabBarIcon: (({ focused }) => {
        return (
          <Image
            source={focused ? icon1 : icon2}
            style={styles.icon}  
          /> 
        );  
      }),
    },
  },
  Message: {
    screen: Message,
    navigationOptions: {
      headerTitle: '消息',
      tabBarLabel: '消息',
      tabBarIcon: (({ focused }) => {
        return (
          <Image
            source={focused ? icon1 : icon2}
            style={styles.icon}  
          /> 
        );  
      }),
    },
  },
  Send: {
    screen: Send,
    navigationOptions: {
      headerTitle: '发帖',
      tabBarLabel: ' ',
      tabBarIcon: (({ focused }) => {
        return (
          <Image
            source={focused ? icon1 : icon2}
            style={styles.icon}  
          /> 
        );  
      }),
    },
  },
  Found: {
    screen: Found,
    navigationOptions: {
      headerTitle: '发现',
      tabBarLabel: '发现',
      tabBarIcon: (({ focused }) => {
        return (
          <Image
            source={focused ? icon1 : icon2}
            style={styles.icon}  
          /> 
        );  
      }),
    },
  },
  User: {
    screen: User,
    navigationOptions: {
      headerTitle: '我的',
      tabBarLabel: '我的',
      tabBarIcon: (({ focused }) => {
        return (
          <Image
            source={focused ? icon1 : icon2}
            style={styles.icon}  
          /> 
        );  
      }),
    },
  },

}, {
  tabBarPosition: 'bottom',
  tabBarOptions: {
    activeTintColor: 'red',
    activeBackgroundColor: '#fff',
    inactiveTintColor: '#999',
    inactiveBackgroundColor: '#fff',
    showIcon: true,
    style : {
      backgroundColor: '#fff',
    },
  },
});

const App = StackNavigator({
  Home: {
    screen: Tab,
    navigationOptions: ({ navigation }) => {
      const title = '首页';
      const headerTitleStyle = {
        alignSelf: 'center',
      };
      return{title, headerTitleStyle};
    },
  },
  Screen: {
    screen: Screen,
    navigationOptions: {
      title: '跳转的页面',
    }
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
