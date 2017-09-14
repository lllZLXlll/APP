/*
	用户设置  2017/9/12
*/
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

export default class UserSet extends Component {
    constructor(props) {
        super(props);
        this.state = {
            isSelect: false
        };
    }

    _getNightView() {
        return 	<TouchableOpacity onPress={() => {alert(1)}}>
            <View style={Styles.nightModelView}>
                <View style={Styles.userItemView}>
                    <Text style={Styles.userItemLeftText}>夜间模式</Text>
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
            <View style={Styles.userMoreItemView}>
                <View style={Styles.userItemView}>
                    <Text style={Styles.userItemLeftText}>与我私信</Text>
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
                    <Text style={Styles.userItemLeftText}>帮助</Text>
                </View>

                <View style={Styles.arrowImageView}>
                    <Image style={Styles.arrowImage_item} source={Icons.arrow} />
                </View>
            </View>
        </TouchableOpacity>;
    }

    _getItemView_2() {
        return 	<TouchableOpacity onPress={() => {alert(1)}}>
            <View style={Styles.userMoreItemView}>
                <View style={Styles.userItemView}>
                    <Text style={Styles.userItemLeftText}>关于</Text>
                </View>

                <View style={Styles.arrowImageView}>
                    <Image style={Styles.arrowImage_item} source={Icons.arrow} />
                </View>
            </View>
        </TouchableOpacity>;
    }

    _getVersionsView() {
        return 	<TouchableOpacity onPress={() => {alert(1)}}>
            <View style={Styles.versionsView}>
                <View style={Styles.userItemView}>
                    <Text style={Styles.userItemLeftText}>当前版本</Text>
                </View>

                <View style={Styles.arrowImageView}>
                    <Text style={Styles.versionsText}>1.0</Text>
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
                { this._getItemView_2() }

                { this._getVersionsView() }
            </View>
        );
    }
}