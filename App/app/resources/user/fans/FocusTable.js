import React, { Component } from 'react';
import {
    View,
    Text,
    Image,
    ScrollView,
    TouchableOpacity,
} from 'react-native';

import Icons from '../../../components/Icons';
import Styles from '../../../style/user/userStyle';
// 点赞item组件
import PraiseItemComponent from '../../../components/PraiseItemComponent';
import {StyleConfig} from '../../../style/style';
let oPx = StyleConfig.oPx;

export default class FansTable extends Component {

    constructor(props) {
        super(props);
        this.state = {
            isClick: 0,
            data: [
                {userName: '水电费',text:  '发布成功，粉丝将收到您的发帖通知！'},
                {userName: '围观VB',text:  '发布成功，粉丝将收到您的发帖通知！'},
                {userName: '金克木',text:  '发布成功，粉丝将收到您的发帖通知！'},
            ],
        }
    }

    _getTextItem(row, index) {
        return  <PraiseItemComponent key={index} row={row} />;
    }

    render() {
        return (
            <ScrollView style={{flex: 1}}>
                {
                    this.state.data.map((row, index) => {
                        return this._getTextItem(row, index);
                    })
                }
            </ScrollView>
        )
    }
}