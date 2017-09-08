/*
	收藏 2017-8-26
*/
import React, { Component } from 'react';
import {
	View,
	Text,
	Image,
	ScrollView,
	TouchableOpacity,
	Modal,
	FlatList,
} from 'react-native';
// 照片浏览
import ImageViewer from '../../../components/ImageViewer';
// 底部加载组件
import FooterComponent from '../../../components/FooterComponent';
// Item
import Item from '../../../components/Item';

import Styles from '../../../style/user/userStyle';
import {StyleConfig} from '../../../style/style';
import Icons from '../../../components/Icons';
let oPx = StyleConfig.oPx;

// 临时图片数据
const imagesUri = 'https://avatars2.githubusercontent.com/u/7970947?v=3&s=460';

export default class Collection extends Component {
	constructor(props) {
		super(props);
		this.state = {
			data: [
				{id: 1, sendDate: '2017-8-26 17:53', sendStatus: '发布成功，粉丝将收到您的发帖通知！', sendContent: '煞风景啊谁来讲故事了飞机发生了几份酸辣粉极乐世界发送大量开发建设垃圾焚烧粉红色沙发。', images: [{url:imagesUri}], upCount: 84, downCount: 94, msgCount: 80},
				{id: 2, sendDate: '2017-8-26 17:53', sendStatus: '发布成功，粉丝将收到您的发帖通知！', sendContent: '可爱叮当猫', images: [{url:imagesUri}, {url:imagesUri}, {url:imagesUri}, ], upCount: 1824, downCount: 24, msgCount: 248},
				{id: 3, sendDate: '2017-8-27 12:25', sendStatus: '发布成功，粉丝将收到您的发帖通知！', sendContent: '好多好多可爱叮当猫呀！', images: [{url:imagesUri}, {url:imagesUri}, {url:imagesUri}, {url:imagesUri}, {url:imagesUri}, {url:imagesUri}, {url:imagesUri}, {url:imagesUri}, {url:imagesUri}, ], upCount: 124, downCount: 59, msgCount: 77},
			],
			isOnClickImage: false,
			dataIndex: 0,
			onClickIndex: 0,
			_onPressMore: this.props._onPressMore,
		};
	}

	_getImageViewer = () => {
		return 	<ImageViewer 
					visible={this.state.isOnClickImage}
					imageUrls={this.state.data[this.state.dataIndex].images} // 照片路径
					index={this.state.onClickIndex} // 初始显示第几张
					onClick={() => { // 图片单击事件
                        this.setState({isOnClickImage: false});
                    }}
				/>;
	}

	// 加载组件
	_getListFooterComponent() {
		return 	<FooterComponent />;
	}

	// 滑动到底部时加载
	_onEndReached = () => {
		let data = this.state.data;
		let a = {id: 4, sendDate: '2017-8-26 17:53', sendStatus: '发布成功，粉丝将收到您的发帖通知！', sendContent: '煞风景啊谁来讲故事了飞机发生了几份酸辣粉极乐世界发送大量开发建设垃圾焚烧粉红色沙发。', upCount: 84, downCount: 94, msgCount: 80};
		let b = {id: 5, sendDate: '2017-8-26 17:53', sendStatus: '发布成功，粉丝将收到您的发帖通知！', sendContent: '煞风景啊谁来讲故事了飞机发生了几份酸辣粉极乐世界发送大量开发建设垃圾焚烧粉红色沙发。', upCount: 84, downCount: 94, msgCount: 80};
		let c = {id: 6, sendDate: '2017-8-26 17:53', sendStatus: '发布成功，粉丝将收到您的发帖通知！', sendContent: '煞风景啊谁来讲故事了飞机发生了几份酸辣粉极乐世界发送大量开发建设垃圾焚烧粉红色沙发。', upCount: 84, downCount: 94, msgCount: 80};
		data.push(a);
		data.push(b);
		data.push(c);
	}

	_getItem(row, index) {
		return	<Item row={row} index={index} key={index} _setDataIndex={this._setDataIndex} />
	}

	render() {
		if (this.state.data != null) {
			return (
				<View style={Styles.view}>

					<FlatList
					  	data={this.state.data}
					  	renderItem={({item, index}) => this._getItem(item, index)}
					  	getItemLayout={(data, index) => ({length: 100/oPx, offset: 100/oPx * index , index})}
					  	keyExtractor={(item, index) => item.id}
				  		initialNumToRender={10}
				  		ListFooterComponent={() => this._getListFooterComponent()}
				  		onEndReachedThreshold={0.2}
				  		onEndReached={this._onEndReached}
					/>

					{ this._getImageViewer() }
				</View>
			);
		} else {
			return (
				<View style={Styles.noDataView}><Text style={Styles.noDataText}>暂无记录</Text></View>
			);
		}
		
	}
}