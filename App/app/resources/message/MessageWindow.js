import React, { Component } from 'react';
import {
    View,
    Text,
    Image,
    ScrollView,
    TouchableOpacity,
    TextInput,
    ImageBackground,
} from 'react-native';
import Icons from '../../components/Icons';
import  Styles from '../../style/message/messageStyle';
import {StyleConfig} from '../../style/style';
let oPx = StyleConfig.oPx;

export default class MessageWindow extends Component {

    constructor(props) {
        super(props);
        this.state = {
            isClick: 0,
            text: null,
            data: [
                {time: '2017-6-11',text:  '你是猪吗',status:1},
                {time: '2017-6-11',text:  '你才是猪',status:2},
                {time: '2017-6-11',text:  '你就是猪',status:1},
                {time: '2017-6-11',text:  '我就是猪怎么了。',status:2},
            ],
        }
    }

    //this.props.navigation.state.params.portrait
    _getTextItem(row, index) {
        if(row.status ==1) {
            return <View key={index} style={Styles.sayRecord}>
                <View style={{flex: 9, alignItems: 'flex-end', marginRight: 20 / oPx}}>
                    <View style={Styles.bubble}>
                        <View style={Styles.msgView}>
                            <Text style={Styles.msg}>{row.text}{row.text}{row.text}{row.text}</Text>
                        </View>
                        <View style={Styles.triangle}>
                        </View>
                    </View>
                </View>
                <View style={{flex: 1}}>
                    <Image style={{width: 60 / oPx, height: 60 / oPx}}
                           source={this.props.navigation.state.params.portrait}>
                    </Image>
                </View>
            </View>
        }else{
            return  <View key={index} style={Styles.friendRecord}>
                        <View style={{flex: 1}}>
                            <Image style={{width:60/oPx, height:60/oPx}} source={this.props.navigation.state.params.portrait}>
                            </Image>
                        </View>
                        <View style={{flex: 9, marginLeft:20/oPx}}>
                            <View style={Styles.bubble}>
                                <View style={Styles.triangle1}>
                                </View>
                                <View style={Styles.msgView1}>
                                    <Text style={Styles.msg1}>{row.text}{row.text}{row.text}{row.text}</Text>
                                </View>

                            </View>
                        </View>
                    </View>
        }
    }

    render() {
        return (
            <View style={{flex: 1}}>
                <ImageBackground source={Icons.windowBackGround} style={{flex: 1,}}>
                    <ScrollView>
                        {
                            this.state.data.map((row, index) => {
                                return this._getTextItem(row, index)
                            })
                        }
                    </ScrollView>
                </ImageBackground>
                <View style={Styles.print}>
                    <TextInput style={Styles.inputStyle}
                       placeholder="你想对我说什么? ^_^"
                       underlineColorAndroid="transparent"
                       multiline = {true}
                       numberOfLines = {4}
                       keyboardType = "default"
                       onChangeText={(text) => this.setState({text})}
                       value={this.state.text}
                    />
                    {
                        this.state.text == null || this.state.text == ''
                        ?
                            <View style={[Styles.sendButtom,{backgroundColor: '#d2cfcf'}]}>
                                <Text style={Styles.sendText}>
                                    发送
                                </Text>
                            </View>
                        :
                            <TouchableOpacity activeOpacity={0.5} onPress={() => {alert('发送')}}>
                                <View style={[Styles.sendButtom,{backgroundColor: '#0c8ad2'}]}>
                                    <Text style={Styles.sendText}>
                                        发送
                                    </Text>
                                </View>
                            </TouchableOpacity>
                    }

                </View>
            </View>
        )
    }
}