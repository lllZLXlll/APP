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
import {StyleConfig} from '../../../style/style';
let oPx = StyleConfig.oPx;


export default class FansTable extends Component {

    constructor(props) {
        super(props);
        this.state = {
            isClick: 0,
            data: [
                {userName: '盖伦',text:  '发布成功，粉丝将收到您的发帖通知！'},
                {userName: '进克斯',text:  '发布成功，粉丝将收到您的发帖通知！'},
                {userName: '拉克丝',text:  '发布成功，粉丝将收到您的发帖通知！'},
            ],
        }
    }

    _getTextItem(row, index) {
        return <View style={Styles.FansTable} key={index}>
                    <View style={Styles.FansTableP}>
                        <TouchableOpacity activeOpacity={0.5}>
                            <Image style={Styles.fansPortraitImage} source={Icons.portrait} />
                        </TouchableOpacity>
                    </View>
                    <View  style={Styles.FansTableC}>
                        <View style={Styles.userNameView}>
                            <Text style={[Styles.userNameText, {fontSize: 24/oPx}]}>
                                {row.userName}
                            </Text>
                        </View>
                        <View style={Styles.autographView}>
                            <Text style={[Styles.autographText, {fontSize: 18/oPx}]}>
                                {row.text}
                            </Text>
                        </View>
                    </View>
                    <TouchableOpacity activeOpacity={0.5} onPress={() => {this.setState({isClick:index+1})}}>
                        <View style={{alignItems: 'center', justifyContent: 'center', marginRight: 30/oPx}} >
                            {
                                this.state.isClick == index+1
                                    ?
                                    <Image style={Styles.fansPraise} source={Icons.praiseIcon_2}/>
                                    :
                                    <Image style={Styles.fansPraise} source={Icons.praiseIcon_1}/>
                            }
                        </View>
                    </TouchableOpacity>
                </View>
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