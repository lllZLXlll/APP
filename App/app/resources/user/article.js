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
import Icons from '../../components/Icons';

export default class Article extends Component {
	constructor(props) {
		super(props);
		this.state = {
			onClickEdit: false,
			selectComponent_1: <Image style={Styles.itemSelectIcon} source={Icons.selectIcon_1} />,
			selectComponent_2: <Image style={Styles.itemSelectIcon} source={Icons.selectIcon_2} />,
			selectItem_1: false,
			selectItem_2: false,
		};
	}

	_onPressSelect = () => {
		this.setState({onClickEdit: !this.state.onClickEdit});
	}

	_getArticleView() {
		return 	<View style={Styles.articleView}>
						<View style={Styles.textLeftView}>
							<Text style={Styles.textLeft}>发帖：2</Text>
						</View>
						<View style={Styles.textRightView}>
						{
							!this.state.onClickEdit
							?
							<Text style={Styles.textRight} onPress={this._onPressSelect}>编辑</Text>
							:
							<Text style={[Styles.textRight, {color: 'red'}]} onPress={this._onPressSelect}>删除</Text>
						}
						</View>
				</View>;
	}

	_getSelectIcon = () => {
		if (!this.state.selectItem_1) {
			return this.state.selectComponent_1;
		} else {
			return this.state.selectComponent_2;
		}
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
						{
							this.state.onClickEdit
							?
							<TouchableOpacity activeOpacity={1} onPress={() => {this.setState({selectItem_1: !this.state.selectItem_1})}}>
								{ this._getSelectIcon() }
							</TouchableOpacity>
							: null
						}	
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
							<TouchableOpacity activeOpacity={1}>
								<Image style={Styles.onClickIcon} source={Icons.praiseIcon_1} />
							</TouchableOpacity>
							<Text style={Styles.onClickText}>1234</Text>
						</View>
						<View style={Styles.itemPraiseView}>
							<TouchableOpacity activeOpacity={1}>
								<Image style={Styles.onClickIcon} source={Icons.downIcon_1} />
							</TouchableOpacity>
							<Text style={Styles.onClickText}>24</Text>
						</View>
						<View style={Styles.itemPraiseView}>
							<TouchableOpacity activeOpacity={1} onPress={() => {alert('消息')}}>
								<Image style={Styles.onClickIcon} source={Icons.msgIcon} />
							</TouchableOpacity>
							<Text style={Styles.onClickText}>245</Text>
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