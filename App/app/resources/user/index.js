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
	StatusBar,
} from 'react-native';

import Styles from '../../style/user/userStyle';
import { StyleConfig } from '../../style/style';
import { TabNavigatior } from 'react-navigation';
// 图片常量组件
import Icons from '../../components/Icons';
// tab切换组件
import TabComponent from '../../components/TabComponent';
// 底部加载组件
import FooterComponent from '../../components/FooterComponent';

// tab 内容页面
import Article from './article';
import Comment from './comment';
import Collection from './collection';
import VisitGuest from './visitGuest';

// 滚动视图
var _scrollView = ScrollView;
// 临时图片数据
const imagesUri = 'https://www.pujinziben.com/upload/banner/2017/9/20170911083746952.jpg';

export default class User extends Component {
	constructor(props) {
		super(props);
		this.state = {
			data_1: [
				{sendDate: '2017-8-26 17:53', sendStatus: '发布成功，粉丝将收到您的发帖通知！', sendContent: '煞风景啊谁来讲故事了飞机发生了几份酸辣粉极乐世界发送大量开发建设垃圾焚烧粉红色沙发。', images: [{url:imagesUri}], upCount: 84, downCount: 94, msgCount: 80},
				{sendDate: '2017-8-26 17:53', sendStatus: '发布成功，粉丝将收到您的发帖通知！', sendContent: '可爱叮当猫', images: [{url:imagesUri}, {url:imagesUri}, {url:imagesUri}, ], upCount: 1824, downCount: 24, msgCount: 248},
				{sendDate: '2017-8-27 12:25', sendStatus: '发布成功，粉丝将收到您的发帖通知！', sendContent: '好多好多可爱叮当猫呀！', images: [{url:imagesUri}, {url:imagesUri}, {url:imagesUri}, {url:imagesUri}, {url:imagesUri}, {url:imagesUri}, {url:imagesUri}, {url:imagesUri}, {url:imagesUri}, ], upCount: 124, downCount: 59, msgCount: 77},
			],
			// tab切换栏数据
			tabTitleMap: [
	        	{tabTitle: '发帖'}, {tabTitle: '评论'}, {tabTitle: '收藏'}, {tabTitle: '访客'}
	      	],
	      	// 选中的tab序号0开始
	      	isSelect: 0,
		};
	}

	// 请求数据
	_getData = () => {
		
	}

	// 查看更多
	_onPressMore = () => {
		this.props.navigation.navigate('Mores');
	}
	
	// 查看用户更多资料
	_onPressUserMore = () => {
		this.props.navigation.navigate('UserMore');
	}

	// 头像组件
	_getPortraitComponent = () => {
		return 	<TouchableOpacity activeOpacity={0.5} onPress={this._onPressUserMore}>
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
                    <TouchableOpacity activeOpacity={0.6} onPress={() => this.props.navigation.navigate('Fans')}style={Styles.itemView}>

                        <View style={Styles.itemTextTopView}>
                            <Text style={Styles.itemTopText}>25</Text>
                        </View>
                        <View style={Styles.itemTextBottomView}>
                            <Text style={Styles.itemBottomText}>粉丝</Text>
                        </View>

                    </TouchableOpacity>

                    <TouchableOpacity activeOpacity={1} onPress={() => this.props.navigation.navigate('Focus')} style={Styles.itemView}>
                        <View style={Styles.itemTextTopView}>
                            <Text style={Styles.itemTopText}>124</Text>
                        </View>
                        <View style={Styles.itemTextBottomView}>
                            <Text style={Styles.itemBottomText}>关注</Text>
                        </View>
                    </TouchableOpacity>

                    <TouchableOpacity activeOpacity={1} onPress={() => this.props.navigation.navigate('Praise')} style={Styles.itemView}>
                        <View style={Styles.itemTextTopView}>
                            <Text style={Styles.itemTopText}>45</Text>
                        </View>
                        <View style={Styles.itemTextBottomView}>
                            <Text style={Styles.itemBottomText}>被赞</Text>
                        </View>
                    </TouchableOpacity>
				</View>;
	}

	// 设置tab切换
	_setIsSelect = (index) => {
		if(index != this.state.isSelect) {
			// 回到顶部
			//_scrollView.scrollTo({x: 0, y: 0, animated: false});
			this.setState({isSelect: index});
		}
	}

	_getTabConent() {
		let tabConent = <Article />;
		switch(this.state.isSelect) {
			case 0:
				tabConent = <Article data={this.state.data_1} _onPressMore={this._onPressMore} />;
				break;
			case 1:
				tabConent = <Comment  _onPressMore={this._onPressMore} />;
				break;
			case 2:
				tabConent = <Collection data={this.state.data_1} _onPressMore={this._onPressMore} />;
				break;
			case 3:
				tabConent = <VisitGuest />;
				break;
			default:
				tabConent = <Article data={this.state.data_1} _onPressMore={this._onPressMore} />;
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
		        stickyHeaderIndices={[2]}
		        ref={(scrollView) => { _scrollView = scrollView; }}
			>
				{ this._getPortraitComponent() }
				{ this._getStatisticsComponent() }
				<TabComponent isSelect={this.state.isSelect} tabTitleMap={this.state.tabTitleMap} _setIsSelect={this._setIsSelect} />
				{ this._getTabConent() }

				<FooterComponent />
			</ScrollView>
		);
	}
}