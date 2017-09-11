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

export default class FansTable extends Component {

    constructor(props) {
        super(props);
        this.state = {
            isSelect: 1,
            data: [
                {userName: '水电费',text:  '发布成功，粉丝将收到您的发帖通知！'},
                {userName: '围观VB',text:  '发布成功，粉丝将收到您的发帖通知！'},
                {userName: '金克木',text:  '发布成功，粉丝将收到您的发帖通知！'},
              ],
        }
    }

    _getTextItem(row, index) {
        return <TouchableOpacity activeOpacity={0.5} onPress={() => {alert(1)}} key={index}>
            <View style={Styles.FansTable}>
                <View style={Styles.FansTableP}>
                    <Image style={Styles.fansPortraitImage} source={Icons.portrait} />
                </View>
                <View  style={Styles.FansTableC}>
                    <View>
                        <Text style={Styles.userNameText}>
                            {row.userName}
                        </Text>
                    </View>
                    <View>
                        <Text style={Styles.autographText}>
                            {row.text}
                        </Text>
                    </View>
                </View>
                <View style={Styles.FansTableC} onPress={() => {this.state({isSelect:6})}}>
                    {
                        this.state.isSelect == 6
                            ?
                            <Image style={Styles.attentionImage} source={Icons.praiseIcon_2}/>
                            :
                            <Image style={Styles.attentionImage} source={Icons.praiseIcon_1}/>
                    }

                </View>
            </View>
        </TouchableOpacity>
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