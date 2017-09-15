import React, { Component } from 'react';
import {
    View,
    Text,
    Image,
    ScrollView,
    TouchableOpacity,
} from 'react-native';
import Icons from '../../components/Icons';
import  Styles from '../../style/message/messageStyle';

export default class BlackList extends Component {

    constructor(props) {
        super(props);
        this.state = {
            isClick: 0,
            data: [
                {userName: '水电费',text:  '色情、抄袭、说脏话ad防守打法水电费水电费撒发生的'},
                {userName: '围观VB',text:  '色情、抄袭、说脏话'},
                {userName: '金克木',text:  '色情、抄袭、说脏话'},
            ],
        }
    }

    _getTextItem(row, index) {
        return <View style={Styles.blacklistTable} key={index}>
            <View style={Styles.blacklistTableP}>
                    <TouchableOpacity activeOpacity={0.5}>
                        <Image style={Styles.messagePortraitImage} source={Icons.portrait} />
                    </TouchableOpacity>
            </View>
            <View  style={Styles.blacklistTableC}>
                    <View style={[Styles.blacklistTextView, {justifyContent: 'flex-end',}]}>
                        <Text style={Styles.userNameText}>
                            {row.userName}
                        </Text>
                    </View>
                    <View style={Styles.blacklistTextView}>
                        <Text style={Styles.blacklistText} numberOfLines={1}>拉黑理由：
                            <Text style={Styles.autographText}>
                                {row.text}
                            </Text>
                        </Text>
                    </View>
            </View>
            <View style={Styles.blacklistTableB}>
                <TouchableOpacity activeOpacity={0.5}>
                    <View style={Styles.blacklistBt}>
                        <Text style={Styles.blackText}>移除黑名单</Text>
                    </View>
                </TouchableOpacity>
            </View>
        </View>
    }

    render() {
        return (
            <ScrollView style={[{flex: 1},Styles.blacklistView]}>
                {
                    this.state.data.map((row, index) => {
                        return this._getTextItem(row, index);
                    })
                }
            </ScrollView>
        )
    }
}