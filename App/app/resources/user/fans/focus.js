/*
    粉丝首页
 */

import React, { Component } from 'react';
import {
    View,
    Text,
    Image,
    Button,
} from 'react-native';
import {
    TabNavigator,
    StackNavigator,
    NavigationActions,
} from 'react-navigation';

import FansTable from './FansTable';
import FocusTable from './FocusTable';
import PraiseTable from './PraiseTable';

const FocusTab = TabNavigator({
        FansTable: {
            screen: FansTable,
            navigationOptions: {
                headerTitle: '粉丝',
                tabBarLabel: '粉丝(999)', // 设置标签栏标签文字
            },
        },
        FocusTable: {
            screen: FocusTable,
            navigationOptions: {
                headerTitle: '关注',
                tabBarLabel: '关注(999)', // 设置标签栏标签文字
            },
        },
        PraiseTable: {
            screen: PraiseTable,
            navigationOptions: {
                headerTitle: '赞',
                tabBarLabel: '赞(999)', // 设置标签栏标签文字
            },
        },
    },
    {
        tabBarPosition: 'bottom',
        tabBarOptions: {
            activeTintColor: 'red',
            activeBackgroundColor: '#fff',
            inactiveTintColor: '#999',
            inactiveBackgroundColor: '#fff',
            tabStyle: {
                backgroundColor: '#dedede'
            },
            indicatorStyle: {
                backgroundColor: '#fff'
            },
            style : {
                backgroundColor: '#fff',
            },
        },
        lazy: true, // 当切换到某选项卡时才进行加载
        swipeEnabled: true, // 是否允许在标签之间进行滑动
        initialRouteName: 'FocusTable' ,
    });

export default FocusTab;