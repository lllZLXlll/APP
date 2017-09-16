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
	Modal,
	FlatList,
} from 'react-native';
// 照片浏览
import ImageViewer from '../../components/ImageViewer';
// Item
import Item from '../../components/Item';

import Styles from '../../style/user/userStyle';
import {StyleConfig} from '../../style/style';
import Icons from '../../components/Icons';
let oPx = StyleConfig.oPx;


// 临时图片数据
const imagesUri = 'https://www.pujinziben.com/upload/banner/2017/9/20170911083746952.jpg';

export default class Article extends Component {
	constructor(props) {
		super(props);
		this.state = {
			data: this.props.data,
			isOnClickImage: false,
			dataIndex: 0,
			onClickIndex: 0,
			_onPressMore: this.props._onPressMore,
		};
	}

	_onPressMore = () => {
		this.state._onPressMore();
	}

	_getArticleView() {
		return 	<View style={Styles.articleView}>
						<View style={Styles.textLeftView}>
							<Text style={Styles.textLeft}>发帖：2</Text>
						</View>
				</View>;
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

	_getMore() {
		return 	<View style={Styles.moreView}>
					<Text style={Styles.moreText} onPress={this._onPressMore}>    —查看更多—    </Text>
				</View>;
	}

	_getItem(row, index) {
		return	<Item row={row} index={index} key={index} _setDataIndex={this._setDataIndex} />
	}

	render() {
		if (this.state.data != null) {
			return (
				<View style={Styles.view}>
					{ this._getArticleView() }
					
					{ 
						this.state.data.map((row, index) => {
							return this._getItem(row, index);
						})
					}

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