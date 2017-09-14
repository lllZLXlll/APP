/*
	首页 2017-9-14
*/
import React, { Component } from 'react';
import {
	View,
	Text,
	Image,
	ScrollView,
	TouchableOpacity,
	Modal,
} from 'react-native';
// 照片浏览
import ImageViewer from '../../components/ImageViewer';
// 底部加载组件
import FooterComponent from '../../components/FooterComponent';
// tab切换组件
import TabComponent from '../../components/TabComponent';
// Item
import Item from '../../components/Item';

import Styles from '../../style/user/userStyle';
import {StyleConfig} from '../../style/style';
import Icons from '../../components/Icons';
let oPx = StyleConfig.oPx;

// 临时图片数据
const imagesUri = 'http://www.pujinziben.com/upload/banner/2017/9/20170911083746952.jpg';

export default class ArticleDetails extends Component {
	constructor(props) {
		super(props);
		this.state = {
			// 临时帖子数据
			data: [
				{id: 1, sendDate: '2017-8-26 17:53', sendStatus: '发布成功，粉丝将收到您的发帖通知！', sendContent: '煞风景啊谁来讲故事了飞机发生了几份酸辣粉极乐世界发送大量开发建设垃圾焚烧粉红色沙发。', images: [{url:imagesUri}], upCount: 84, downCount: 94, msgCount: 80},
			],
			// tab切换栏数据
			tabTitleMap: [
	        	{tabTitle: '趣评(6)'},{tabTitle: '最新评论(1.2万)'},{tabTitle: '赞过(3.1万)'},
	      	],
	      	// 选中的tab序号0开始
	      	isSelect: 0,
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

	_setDataIndex = (dataIndex, index) => {
		this.setState({
			isOnClickImage: true,
			dataIndex: dataIndex,
		});
		if (index) {
			this.setState({
				onClickIndex: index,
			});
		}
	}

	// 设置tab切换
	_setIsSelect = (index) => {
		this.setState({isSelect: index});
	}

	render() {
		return (
			<ScrollView style={Styles.view}>
				<Item row={this.state.data[0]}
				 	index={0} 
				 	_setDataIndex={this._setDataIndex} 
				 	isNoShowComment={true}
				 />

				 <TabComponent isSelect={this.state.isSelect} 
			 		tabTitleMap={this.state.tabTitleMap} 
			 		_setIsSelect={this._setIsSelect}
			 		marginTop={0} 
		 		/>

				{ this._getImageViewer() }
			</ScrollView>
		);
	}
}