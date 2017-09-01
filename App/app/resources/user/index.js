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
	RefreshControl,
} from 'react-native';

import Styles from '../../style/user/userStyle';
import { StyleConfig } from '../../style/style';
import { TabNavigatior } from 'react-navigation';
import Icons from '../../components/Icons';

// tab 内容页面
import Article from './article';
import Comment from './comment';
import Collection from './collection';
import VisitGuest from './visitGuest';


// 临时图片数据
const imagesUri = 'https://avatars2.githubusercontent.com/u/7970947?v=3&s=460';

export default class User extends Component {
	constructor(props) {
		super(props);
		this.state = {
			isSelect: 1,
			data_1: [
				{sendDate: '2017-8-26 17:53', sendStatus: '发布成功，粉丝将收到您的发帖通知！', sendContent: '煞风景啊谁来讲故事了飞机发生了几份酸辣粉极乐世界发送大量开发建设垃圾焚烧粉红色沙发。', images: [{url:imagesUri}], upCount: 84, downCount: 94, msgCount: 80},
				{sendDate: '2017-8-26 17:53', sendStatus: '发布成功，粉丝将收到您的发帖通知！', sendContent: '可爱叮当猫', images: [{url:imagesUri}, {url:imagesUri}, {url:imagesUri}, ], upCount: 1824, downCount: 24, msgCount: 248},
				{sendDate: '2017-8-27 12:25', sendStatus: '发布成功，粉丝将收到您的发帖通知！', sendContent: '好多好多可爱叮当猫呀！', images: [{url:imagesUri}, {url:imagesUri}, {url:imagesUri}, {url:imagesUri}, {url:imagesUri}, {url:imagesUri}, {url:imagesUri}, {url:imagesUri}, {url:imagesUri}, ], upCount: 124, downCount: 59, msgCount: 77},
			],
		}
	}

	// 请求数据
	_getData = () => {
		
	}

	// 头像组件
	_getPortraitComponent = () => {
		return 	<TouchableOpacity activeOpacity={0.5} onPress={() => {alert(1)}}>
					<View style={Styles.portraitView}>
						<View style={Styles.portrait}>
							<Image style={Styles.portraitImage} source={Icons.portrait} />
						</View>
						<View style={Styles.userName}>
							<View style={Styles.userNameView}>
								<Text style={Styles.userNameText} numberOfLines={1}>开车老司机</Text>
							</View>
							<View style={Styles.autographView}>
								<Text style={Styles.autographText} numberOfLines={1}>今晚秋名山见，看到我的尾灯算我输！</Text>
							</View>
						</View>
						<View style={Styles.arrow}>
							<Image style={Styles.arrowImage} source={Icons.arrow} />
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

	_getTabComponent() {
		const textStyle = this.state.textStyle;
		return 	<View style={Styles.tabView}>
					<View style={Styles.itemTabView}>
						<TouchableOpacity activeOpacity={1} onPress={() => {this.setState({isSelect: 1})}}>
							<View style={Styles.tabTextView}>
								{
									this.state.isSelect == 1 
									? 
									<Text style={[Styles.itemTabText, {color: '#ff8200',}]}>发帖</Text>
									: 
									<Text style={Styles.itemTabText}>发帖</Text>
								}
							</View>
						</TouchableOpacity>
					</View>
					<View style={Styles.itemTabView}>
						<TouchableOpacity activeOpacity={1} onPress={() => {this.setState({isSelect: 2})}}>
							<View style={Styles.tabTextView}>
								{
									this.state.isSelect == 2 
									? 
									<Text style={[Styles.itemTabText, {color: '#ff8200',}]}>评论</Text>
									: 
									<Text style={Styles.itemTabText}>评论</Text>
								}
							</View>
						</TouchableOpacity>
					</View>
					<View style={Styles.itemTabView}>
						<TouchableOpacity activeOpacity={1} onPress={() => {this.setState({isSelect: 3})}}>
							<View style={Styles.tabTextView}>
								{
									this.state.isSelect == 3 
									? 
									<Text style={[Styles.itemTabText, {color: '#ff8200',}]}>收藏</Text>
									: 
									<Text style={Styles.itemTabText}>收藏</Text>
								}
							</View>
						</TouchableOpacity>
					</View>
					<View style={Styles.itemTabView}>
						<TouchableOpacity activeOpacity={1} onPress={() => {this.setState({isSelect: 4})}}>
							<View style={[Styles.tabTextView, {borderRightWidth: 0}]}>
								{
									this.state.isSelect == 4 
									? 
									<Text style={[Styles.itemTabText, {color: '#ff8200',}]}>访客</Text>
									: 
									<Text style={Styles.itemTabText}>访客</Text>
								}
							</View>
						</TouchableOpacity>
					</View>
				</View>;
	}
	
	_goScreen = () => {
		this.props.navigation.navigate('Screen', {name: 'name1234'});
	}

	_getTabConent() {
		let tabConent = <Article />;
		switch(this.state.isSelect) {
			case 1:
				tabConent = <Article data={this.state.data_1} />;
				break;
			case 2:
				tabConent = <Comment />;
				break;
			case 3:
				tabConent = <Collection />;
				break;
			case 4:
				tabConent = <VisitGuest />;
				break;
		}
		return tabConent;
	}


	
	render() {	
		return (
			<ScrollView style={{flex: 1}}
				refreshControl={
		            <RefreshControl
		              	refreshing={false}
		              	onRefresh={this._getData}
		            />
		        }
			>
				{ this._getPortraitComponent() }
				{ this._getStatisticsComponent() }
				{ this._getTabComponent() }
				{ this._getTabConent() }
			</ScrollView>
		);
	}
}