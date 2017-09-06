/*
	我的首页 2017-8-25
*/
import React, { Component } from 'react';
import { TabNavigator, StackNavigator } from 'react-navigation';
import { StyleConfig } from '../../../style/style';
let oPx = StyleConfig.oPx;

// tab 页面
import Articles from './articles';
import Comments from './comments';
import Collections from './collections';
import VisitGuests from './visitGuests';

// 发帖、评论、收藏、访客 tab
const Mores = TabNavigator({
	Articles: {
		screen: Articles,
		navigationOptions: {
			title: '发帖',
		},
	},
	Comments: {
		screen: Comments,
		navigationOptions: {
			title: '评论',
		},
	},
	Collections: {
		screen: Collections,
		navigationOptions: {
			title: '收藏',
		},
	},
	VisitGuests: {
		screen: VisitGuests,
		navigationOptions: {
			title: '访客',
		},
	},
}, {
  tabBarPosition: 'bottom',
  tabBarOptions: {
    activeTintColor: '#ff8200',
    activeBackgroundColor: '#fff',
    inactiveTintColor: '#999',
    inactiveBackgroundColor: '#fff',
    showIcon: false,
    style : {
      backgroundColor: '#fff',
      height: 80/oPx,
    },
    labelStyle: {
    	fontSize: 30/oPx,
    },
  },
  lazy: true, // 当切换到某选项卡时才进行加载
  swipeEnabled: true, // 是否允许在标签之间进行滑动
  // initialRouteName: 'Comments',
});

export default Mores;