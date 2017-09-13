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
            isClick: 0,
            data: [
                {userName: '水电费',text:  '发布成功，粉丝将收到您的发帖通知！'},
                {userName: '围观VB',text:  '发布成功，粉丝将收到您的发帖通知！'},
                {userName: '金克木',text:  '发布成功，粉丝将收到您的发帖通知！'},
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
                        <TouchableOpacity activeOpacity={0.5}>
                            <View>
                                <Text style={Styles.userNameText}>
                                    {row.userName}
                                </Text>
                            </View>
                        </TouchableOpacity>
                        <TouchableOpacity activeOpacity={0.5}>
                        <View>
                            <Text style={Styles.autographText}>
                                {row.text}
                            </Text>
                        </View>
                        </TouchableOpacity>
                    </View>
                    <View style={Styles.FansTableC} >
                        <TouchableOpacity activeOpacity={0.5} onPress={() => {this.setState({isClick:index+1})}}>
                        {
                            this.state.isClick == index+1
                                ?
                                <Image style={Styles.attentionImage} source={Icons.attentioned}/>
                                :
                                <Image style={Styles.attentionImage} source={Icons.attention}/>
                        }
                        </TouchableOpacity>
                    </View>
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