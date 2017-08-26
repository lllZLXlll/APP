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
import { 
  TabNavigator, 
  StackNavigator,
  NavigationActions,
} from 'react-navigation';

import Home from './resources/home/index';
import Message from './resources/message/index';
import Send from './resources/send/index';
import Found from './resources/found/index';
import User from './resources/user/index';
import Screen from './resources/home/screen';

import WebView from './components/WebView'


const icon1 = require('./images/icon/icon_1.png');
const icon2 = require('./images/icon/icon_1_1.png');


const Tab = TabNavigator({
  Home: {
    screen: Home,
    navigationOptions: {
      headerTitle: '首页', // 设置头部导航栏文字
      tabBarLabel: '首页', // 设置标签栏标签文字
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
      headerTitle: '日报',
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
  lazy: true,// 当切换到某选项卡时才进行加载
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
    navigationOptions: ({ navigation }) => ({
      title: '跳转的页面',
      headerLeft: (<Button title="返回" onPress={() => {navigation.goBack()}} />),
      headerRight: (<Button title="设置" onPress={() => {alert('设置')}} />),
    }),
  },
  // 通用webview，跳转网页
  WebView: {
    screen: WebView,
    navigationOptions: ({ navigation }) => ({
		// 导航栏标题动态获取
		title: `${navigation.state.params.title}`,
		// 是否启用手势关闭屏幕
		gesturesEnabled: true,
	  
    }),
	
  },
},{
	// 让标题随着画面的改变而呈现动画，ios中的默认选项，android设置一样保持动画一致
	headerMode: 'float',
});

const styles = StyleSheet.create({
  icon: {
    width: 20,
    height: 20,
  },
});

export default App;
