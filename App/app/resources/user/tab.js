/*
	我的首页 2017-8-25
*/
import React, { Component } from 'react';
import { TabNavigator } from 'react-navigation';

// tab 页面
import Article from './article';
import Comment from './comment';
import Collection from './collection';
import VisitGuest from './visitGuest';

// 发帖、评论、收藏、访客 tab
const Tab = TabNavigator({
	Article: {
		screen: Article,
		navigationOptions: {
			tabBarLabel: '发帖',
		},
	},
	Comment: {
		screen: Comment,
		navigationOptions: {
			tabBarLabel: '评论',
		},
	},
	Collection: {
		screen: Collection,
		navigationOptions: {
			tabBarLabel: '收藏',
		},
	},
	VisitGuest: {
		screen: VisitGuest,
		navigationOptions: {
			tabBarLabel: '访客',
		},
	},
}, {
	// 是否允许在标签内滑动
	swipeEnabled: false,
	lazy: true,
});

export default Tab;