/*
	发帖 2017-8-26
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

const itemSelectIcon = require('../../images/icon/icon_1.png');
// 未点赞
const praiseIcon_1 = require('../../images/icon/user/icon_user_praise_1.png');
// 已点赞
const praiseIcon_2 = require('../../images/icon/user/icon_user_praise_2.png');

export default class Article extends Component {

	_getArticleView() {
		return 	<View style={Styles.articleView}>
					<View style={Styles.articleTopView}>
						<View style={Styles.textLeftView}>
							<Text style={Styles.textLeft}>发帖：2</Text>
						</View>
						<View style={Styles.textRightView}>
							<Text style={Styles.textRight}>编辑</Text>
						</View>
					</View>
				</View>;
	}

	_getActicleItemView() {
		return 	<View style={Styles.articleItemView}>
					<View style={Styles.itemTopView}>
						<View style={Styles.itemTopLeftView}>
							<Text style={Styles.itemTopLeftDate}>2017-08-18 13:53
								<Text style={[Styles.itemTopLeftDate, {color: '#ff8200'}]}> 发布成功，粉丝将收到您的发帖通知！</Text>
							</Text>
						</View>
						<View style={Styles.itemTopRightView}>
							<TouchableOpacity activeOpacity={1} onPress={() => {alert('选中')}}>
								<Image style={Styles.itemSelectIcon} source={itemSelectIcon} />
							</TouchableOpacity>
						</View>
					</View>
					<View style={Styles.itemConentView}>
						<Text style={Styles.itemConentText}>
							舒服的沙发上的史蒂夫史蒂夫史蒂夫都是负担舒服的沙发上的史蒂夫史蒂夫史蒂夫都是负担舒服的沙发上的史蒂夫史蒂夫史蒂夫都是负担舒服的沙发上的史蒂夫史蒂夫史蒂夫都是负担
							舒服的沙发上的史蒂夫史蒂夫史蒂夫都是负担舒服的沙发上的史蒂夫史蒂夫史蒂夫都是负担舒服的沙发上的史蒂夫史蒂夫史蒂夫都是负担舒服的沙发上的史蒂夫史蒂夫史蒂夫都是负担
						</Text>
					</View>
					<View style={Styles.praiseView}>
						<View style={Styles.itemPraiseView}>
							<TouchableOpacity activeOpacity={1} onPress={() => {alert('点赞')}}>
								<Image style={Styles.onClickIcon} source={praiseIcon_1} />
							</TouchableOpacity>
						</View>
					</View>
				</View>;
	}

	render() {
		return (
			<ScrollView>
				{ this._getArticleView() }
				{ this._getActicleItemView() }
			</ScrollView>
		);
	}
}