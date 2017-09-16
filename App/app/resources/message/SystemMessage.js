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
import {StyleConfig} from '../../style/style';
let oPx = StyleConfig.oPx;

export default class SystemMessage extends Component {

    constructor(props) {
        super(props);
        this.state = {
            isClick: 0,
            data: [
                {time: '2017-6-11',text:  '天马上就要下雨了，请大家赶紧回家收衣服。',links:null},
                {time: '2017-6-11',text:  '天马上就要下雨了，请大家赶紧回家收衣服。',links:'https://www.baidu.com'},
                {time: '2017-6-11',text:  '天马上就要下雨了，请大家赶紧回家收衣服。天马上就要下雨了，请大家赶紧回家收衣服。天马上就要下雨了，请大家赶紧回家收衣服。',links:'https://www.baidu.com'},
                {time: '2017-6-11',text:  '天马上就要下雨了，请大家赶紧回家收衣服。',links:''},
            ],
        }
    }

    _getTextItem(row, index) {
        return <View style={Styles.syslistTable} key={index}>
            <View  style={Styles.syslistTableC}>
                <View style={Styles.syslistTextView}>
                    <Image style={Styles.trumpetStyle} source={Icons.trumpet}/>
                </View>
                <View style={Styles.syslistTextView}>
                    <Text style={Styles.sysTimeText}>
                        {row.time}
                    </Text>
                </View>
            </View>
            <View style={[Styles.syslistTableP, ]}>
                <Text style={Styles.sysText}>
                    {row.text}
                    {
                        row.links == null || row.links == ''
                            ?
                            null
                            :
                            <Text style={Styles.linksText} onPress={() => {
                                this.props.navigation.navigate(
                                    'WebView',
                                    {
                                        url: row.links,
                                        title: '狂戳这里'
                                    }
                                );
                            }}>
                                {row.links}
                            </Text>
                    }
                </Text>

            </View>
        </View>
    }

    render() {
        return (
            <ScrollView style={[{flex: 1},Styles.syslistView]}>
                {
                    this.state.data.map((row, index) => {
                        return this._getTextItem(row, index);
                    })
                }
            </ScrollView>
        )
    }
}