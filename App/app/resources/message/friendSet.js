import React, { Component } from 'react';
import {
    View,
    Text,
    Image,
    Button,
    TouchableOpacity,
    Switch,
} from 'react-native';
import Styles from '../../style/user/userStyle';
import Icons from '../../components/Icons';
import {StyleConfig} from '../../style/style';
let oPx = StyleConfig.oPx;

export default class friendSet extends Component {
    constructor(props) {
        super(props);
        this.state = {
            isSelect: false
        };
    }

    _getNightView() {
        return 	<TouchableOpacity >
            <View style={Styles.nightModelView}>
                <View style={Styles.userItemView}>
                    <Text style={Styles.userItemLeftText}>加入黑名单</Text>
                </View>
                <View style={Styles.userItemCenterView}>
                    <Switch value={this.state.isSelect}
                            onValueChange={()=> {this.setState({isSelect: !this.state.isSelect})}}
                    />
                </View>
            </View>
        </TouchableOpacity>;
    }

    _getItemView() {
        return 	<TouchableOpacity onPress={() => {alert(1)}}>
            <View style={[Styles.userMoreItemView, {marginTop: 25/oPx,}]}>
                <View style={Styles.userItemView}>
                    <Text style={Styles.userItemLeftText}>举报</Text>
                </View>

                <View style={Styles.arrowImageView}>
                    <Image style={Styles.arrowImage_item} source={Icons.arrow} />
                </View>
            </View>
        </TouchableOpacity>;
    }

    _getItemView_1() {
        return 	<TouchableOpacity onPress={() => {alert(1)}}>
            <View style={Styles.userMoreItemView}>
                <View style={Styles.userItemView}>
                    <Text style={Styles.userItemLeftText}>清空聊天记录</Text>
                </View>
            </View>
        </TouchableOpacity>;
    }

    render() {
        return (
            <View style={Styles.view}>
                { this._getNightView() }

                { this._getItemView() }
                { this._getItemView_1() }
            </View>
        );
    }
}