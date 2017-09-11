/*
	用户详情 2017-8-24
*/
import React, { Component } from 'react';
import {
	View,
	Text,
	Image,
	Button,
	TouchableOpacity,
} from 'react-native';
import Styles from '../../style/user/userStyle';
import Icons from '../../components/Icons';

export default class UserMore extends Component {

	_getTopView() {
		return 	<TouchableOpacity onPress={() => {alert(1)}}>
					<View style={Styles.userMoreTopView}>
						<View style={Styles.userItemView}>
							<Text style={Styles.userItemLeftText}>头像</Text>
						</View>
						<View style={Styles.userItemCenterView}>
							<Image style={Styles.userPortraitImage} source={Icons.portrait} />
						</View>
						<View style={Styles.arrowImageView}>
							<Image style={Styles.arrowImage} source={Icons.arrow} />
						</View>
					</View>
				</TouchableOpacity>;
	}
	
	_getItemView() {
		return 	<TouchableOpacity onPress={() => {alert(1)}}>
					<View style={Styles.userMoreItemView}>
						<View style={Styles.userItemView}>
							<Text style={Styles.userItemLeftText}>用户名</Text>
						</View>
						<View style={Styles.userItemCenterView}>
							<Text style={[Styles.userItemLeftText, {color: '#999'}]} numberOfLines={1}>开车老司机</Text>
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
							<Text style={Styles.userItemLeftText}>个性签名</Text>
						</View>
						<View style={Styles.userItemCenterView}>
							<Text style={[Styles.userItemLeftText, {color: '#999'}]} numberOfLines={1}>呜呜呜~老司机来了，要上车的赶紧了啦啦啦啦啦啦啦啦</Text>
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
							<Text style={Styles.userItemLeftText}>性别</Text>
						</View>
						<View style={Styles.userItemCenterView}>
							<Text style={[Styles.userItemLeftText, {color: '#999'}]}>男</Text>
						</View>
						<View style={Styles.arrowImageView}>
							<Image style={Styles.arrowImage_item} source={Icons.arrow} />
						</View>
					</View>
				</TouchableOpacity>;
	}
		
	_getExitView() {
		return 	<TouchableOpacity onPress={() => {alert(1)}}>
					<View style={Styles.exitItemView}>
						<Text style={Styles.exitText}>退出当前账号</Text>
					</View>
				</TouchableOpacity>;
	}
	
	render() {
		return (
			<View style={Styles.view}>
				{ this._getTopView() }
				
				{ this._getItemView() }
				{ this._getItemView_1() }
				{ this._getItemView_2() }
				
				{ this._getExitView() }
			</View>
		);
	}
}