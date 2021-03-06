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

import SendArticle from './resources/home/sendArticle';
import Fans from './resources/user/fans/fans';
import Focus from './resources/user/fans/focus';
import Praise from './resources/user/fans/praise';
import Icons from './components/Icons';
// 我的样式
import Styles from './style/user/userStyle';
// 首页样式
import homeStyles from './style/home/homeStyle';

// 消息
//黑名单
import BlackList from './resources/message/BlackList';
//系统消息
import SystemMessage from './resources/message/SystemMessage';
//聊天窗口
import MessageWindow from'./resources/message/MessageWindow';
//好友设置
import friendSet from'./resources/message/friendSet';

// 首页
// 帖子详情
import ArticleDetails from './resources/home/articleDetails';
// 评论详情
import CommentDetails from './resources/home/commentDetails';


// 我的
// 我的-发帖，收藏，评论，访客tab页面
import Mores from './resources/user/more/mores';
// 用户详情页面
import UserMore from './resources/user/userMore';
//用户设置
import UserSet from './resources/user/userSet';

// 通用网页页面
import WebView from './components/WebView'

//消息样式
import msgStyles from './style/message/messageStyle';
// 临时底部图标
const icon1 = require('./images/icon/icon_1.png');
const icon2 = require('./images/icon/icon_1_1.png');


const Tab = TabNavigator({
  Home: {
    screen: Home,
    navigationOptions: ({ navigation }) => ({
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
      headerLeft: (<Text/>),
      headerRight: (
       <TouchableOpacity activeOpacity={0.5} onPress={() => {navigation.navigate('SendArticle')}}>
         <Image source={Icons.add} style={homeStyles.add} />
       </TouchableOpacity>
      ),
    }),
  },
  Message: {
    screen: Message,
      navigationOptions: ({ navigation }) => ({
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
        headerLeft: (<Text/>),
        headerRight: (
         <TouchableOpacity activeOpacity={0.5} onPress={() => {navigation.navigate('BlackList')}}>
           <Text style={msgStyles.blacklistFont}>黑名单</Text>
         </TouchableOpacity>
        ),
    }),
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
          <TouchableOpacity activeOpacity={0.5} onPress={() => {navigation.navigate('UserSet')}}>
            <Image source={Icons.set} style={Styles.set} />
          </TouchableOpacity>
      ),
      headerLeft:(<Text/>),
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
  lazy: true, // 当切换到某选项卡时才进行加载
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
  ArticleDetails: {
    screen: ArticleDetails,
    navigationOptions: ({ navigation }) => ({
      title: '帖子详情',
      headerRight: (<Text/>),
      headerTitleStyle: {
        alignSelf: 'center',
      },
    }),
  },
   CommentDetails: {
    screen: CommentDetails,
    navigationOptions: ({ navigation }) => ({
      title: '评论详情',
      headerRight: (<Text/>),
      headerTitleStyle: {
        alignSelf: 'center',
      },
    }),
  },
  SendArticle: {
    screen: SendArticle,
    
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
  BlackList: {
      screen: BlackList,
      navigationOptions: ({ navigation }) => ({
          // 是否启用手势关闭屏幕
          title: '黑名单',
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
  SystemMessage: {
        screen: SystemMessage,
        navigationOptions: ({ navigation }) => ({
            // 是否启用手势关闭屏幕
            gesturesEnabled: true,
            headerTitle:'系统消息',
            headerTitleStyle: {
                alignSelf: 'center',
            },
            headerRight: (
                <TouchableOpacity activeOpacity={0.5} onPress={() => {alert(1)}}>
                    <Text style={msgStyles.clear}>
                        清空
                    </Text>
                </TouchableOpacity>
            ),
        }),
  },
  MessageWindow: {
        screen: MessageWindow,
        navigationOptions: ({ navigation }) => ({
            // 是否启用手势关闭屏幕
            gesturesEnabled: true,
            headerTitle:`${navigation.state.params.userName}`,
            headerTitleStyle: {
                alignSelf: 'center',
            },
            headerRight: (
                <TouchableOpacity activeOpacity={0.5} onPress={() => {navigation.navigate('friendSet')}}>
                    <Text style={msgStyles.clear}>
                        设置
                    </Text>
                </TouchableOpacity>
            ),
        }),
   },
  friendSet: {
      screen: friendSet,
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
