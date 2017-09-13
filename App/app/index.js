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
  TouchableOpacity,
} from 'react-native';
import { 
  TabNavigator, 
  StackNavigator,
  NavigationActions,
} from 'react-navigation';
// 五个底部模块页面
import Home from './resources/home/index';
import Message from './resources/message/index';
import Send from './resources/send/index';
import Found from './resources/found/index';
import User from './resources/user/index';
import Screen from './resources/home/screen';
import Fans from './resources/user/fans/fans';
import Focus from './resources/user/fans/focus';
import Praise from './resources/user/fans/praise';
import Icons from './components/Icons';
import Styles from './style/user/userStyle';
//用户设置
import UserSet from './resources/user/userSet';




// 我的
// 我的-发帖，收藏，评论，访客tab页面
import Mores from './resources/user/more/mores';

// 用户详情页面
import UserMore from './resources/user/userMore';

// 通用网页页面
import WebView from './components/WebView'

// 临时底部图标
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
      navigationOptions: ({ navigation }) => ({
      headerTitle: '我的',
      tabBarLabel: '我的',
      headerRight: (
          <TouchableOpacity activeOpacity={0.6} onPress={() => {navigation.navigate('UserSet')}}>
            <Image source={Icons.set} style={Styles.set} />
          </TouchableOpacity>
      ),
      tabBarIcon: (({ focused }) => {
        return (
          <Image
            source={focused ? icon1 : icon2}
            style={styles.icon}  
          /> 
        );  
      }),
    }),
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
  lazy: false, // 当切换到某选项卡时才进行加载
  swipeEnabled: true, // 是否允许在标签之间进行滑动
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
	  headerTitleStyle: {
		  alignSelf: 'center',
	  },
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
    UserSet: {
        screen: UserSet,
        navigationOptions: ({ navigation }) => ({
            // 是否启用手势关闭屏幕
            title:'设置',
            gesturesEnabled: true,
            headerTitleStyle: {
                alignSelf: 'center',
            },
            headerRight: (<Text></Text>),
        }),
    },
    Fans: {
    screen: Fans,
    navigationOptions: ({ navigation }) => ({
		// 是否启用手势关闭屏幕
		gesturesEnabled: true,
        headerTitleStyle: {
            alignSelf: 'center',
        },
        headerRight: (<Text></Text>),
    }),

  },

    Focus: {
        screen: Focus,
        navigationOptions: ({ navigation }) => ({
            // 是否启用手势关闭屏幕
            gesturesEnabled: true,
            headerTitleStyle: {
                alignSelf: 'center',
            },
            headerRight: (<Text></Text>),
        }),

    },

    Praise: {
        screen: Praise,
        navigationOptions: ({ navigation }) => ({
            // 是否启用手势关闭屏幕
            gesturesEnabled: true,
            headerTitleStyle: {
                alignSelf: 'center',
            },
            headerRight: (<Text></Text>),
        }),

    },

    Mores: {
    screen: Mores,
    navigationOptions: ({ navigation }) => ({
      // 是否启用手势关闭屏幕
      gesturesEnabled: true,
    }),
  },

  UserMore: {
    screen: UserMore,
    navigationOptions: ({ navigation }) => ({
      // 是否启用手势关闭屏幕
      gesturesEnabled: true,
	  title: '个人信息',
	  headerTitleStyle: {
		  alignSelf: 'center',
	  },
	  headerRight: (<Text></Text>),  // 如果没有组件那么标题将会不居中
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
