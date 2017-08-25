/*
	我的首页 2017-8-25
*/
import React, { Component } from 'react';
import {
	View,
	Text,
	Image,
	ScrollView,
	TouchableOpacity,
} from 'react-native';
import Styles from '../../style/user/userStyle';
import {StyleConfig} from '../../style/style';

// 头像
const portrait = require('../../images/icon/user/icon_user_portrait.png');
// 箭头图标
const arrow = require('../../images/icon/user/icon_user_arrow.png');

export default class User extends Component {

	// 头像组件
	_getPortraitComponent = () => {
		return 	<TouchableOpacity activeOpacity={0.5} onPress={() => {alert(1)}}>
					<View style={Styles.portraitView}>
						<View style={Styles.portrait}>
							<Image style={Styles.portraitImage} source={portrait} />
						</View>
						<View style={Styles.userName}>
							<View style={Styles.userNameView}>
								<Text style={Styles.userNameText}>开车老司机</Text>
							</View>
							<View style={Styles.autographView}>
								<Text style={Styles.autographText}>今晚秋名山见，看到我的尾灯算我输！</Text>
							</View>
						</View>
						<View style={Styles.arrow}>
							<Image style={Styles.arrowImage} source={arrow} />
						</View>
					</View>
				</TouchableOpacity>;
	}

	// 粉丝，关注，点赞组件
	_getStatisticsComponent = () => {
		return 	<View style={Styles.statisticsView}>
					<View style={Styles.itemView}>
						<TouchableOpacity activeOpacity={1} onPress={() => {alert(2)}}>
							<View style={Styles.itemTextTopView}>
								<Text style={Styles.itemTopText}>25</Text>
							</View>
							<View style={Styles.itemTextBottomView}>
								<Text style={Styles.itemBottomText}>粉丝</Text>
							</View>
						</TouchableOpacity>
					</View>
					
					<View style={Styles.itemView}>
						<TouchableOpacity activeOpacity={1} onPress={() => {alert(3)}}>
							<View style={Styles.itemTextTopView}>
								<Text style={Styles.itemTopText}>124</Text>
							</View>
							<View style={Styles.itemTextBottomView}>
								<Text style={Styles.itemBottomText}>关注</Text>
							</View>
						</TouchableOpacity>
					</View>
					
					<View style={Styles.itemView}>
						<TouchableOpacity activeOpacity={1} onPress={() => {alert(4)}}>
							<View style={Styles.itemTextTopView}>
								<Text style={Styles.itemTopText}>45</Text>
							</View>
							<View style={Styles.itemTextBottomView}>
								<Text style={Styles.itemBottomText}>被赞</Text>
							</View>
						</TouchableOpacity>
					</View>
				</View>;
	}

	render() {
		return (
			<ScrollView>
				{ this._getPortraitComponent() }
				{ this._getStatisticsComponent() }
			</ScrollView>
		);
	}
}