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
	FlatList,
	RefreshControl,
} from 'react-native';
// 照片浏览
import ImageViewer from '../../components/ImageViewer';
// 底部加载组件
import FooterComponent from '../../components/FooterComponent';
// Item
import Item from '../../components/Item';
// 请求组件
import Request from '../../utils/Request';
// 存储数据组件
import Storage from '../../utils/Storage';

import Styles from '../../style/user/userStyle';
import {StyleConfig} from '../../style/style';
import Icons from '../../components/Icons';
let oPx = StyleConfig.oPx;

export default class Index extends Component {
	constructor(props) {
		super(props);
		this.state = {
			// 首页数据
			indexList: [],
			isOnClickImage: false,
			dataIndex: 0,
			onClickIndex: 0,
			_onPressMore: this.props._onPressMore,
			// 分页参数
			pageNum: 1,
			pageSize: 20,
			totalPageNum: 0,
			// 是否有数据，true则显示底部加载，false则显示底线
			isData: true,
		};
	}

	componentDidMount(){
		this._getData();
	}

	_getData(pageNum, pageSize) {
		// 如果没有值那么就是第一次加载
		if (!pageNum && !pageSize) {
			Request.post('home/index.do',{pageNum: 1, pageSize: 20},(data)=>{
				this.setState({
					indexList: data.page,
					// 总页数
					totalPageNum: data.totalPageNum,
					// 如果总页数等于1直接设置底部底线
					isData: data.totalPageNum <= 1 ? false : true,
				});
			},(error)=>{
			    console.log(error);
			});
		} else { // 不是第一次加载
			Request.post('home/index.do',{pageNum: pageNum, pageSize: pageSize},(data)=>{
				this.setState({
					// concat方法把数据追加到原数据后面
					indexList: this.state.indexList.concat(data.page),
					pageNum: data.pageNum,
					isData: data.pageNum >= data.totalPageNum ? false : true,
				});
			},(error)=>{
			    console.log(error);
			});
		}
	}

	_getImageViewer = () => {
		if (this.state.indexList != [] && this.state.indexList != null && this.state.indexList != '' && this.state.indexList[this.state.dataIndex].articleImages != null){
			return 	<ImageViewer
						visible={this.state.isOnClickImage}
						imageUrls={this.state.indexList[this.state.dataIndex].articleImages} // 照片路径
						index={this.state.onClickIndex} // 初始显示第几张
						onClick={() => { // 图片单击事件
	                        this.setState({isOnClickImage: false});
	                        console.log(this.state.isOnClickImage);
	                    }}
					/>;
		}
	}

	// 加载组件
	_getListFooterComponent() {
		return 	<FooterComponent isData={this.state.isData} />;
	}

	// 滑动到底部时加载
	_onEndReached = () => {
		if ((this.state.pageNum + 1) <= this.state.totalPageNum) {
			this._getData(this.state.pageNum + 1, this.state.pageSize);
		} else {
			if (this.state.totalPageNum > 0) 
				this.setState({isData: false});
		}
	}

	// 点赞 
	async _fabulous(id, index) {
		let USER = await Storage.getItem('USER');
		Request.post('home/fabulous.do',{uid: USER.UID, articleId: id,},(data)=>{
			if (data.error == 0) {
				console.log(data.msg);
			} else {
				alert(data.msg);
			}
		});

		let indexList = this.state.indexList;
		let data = indexList[index];
		data.fabulousCount = data.fabulousCount + 1;
		indexList[index] = data;
		this.setState({
			indexList: indexList
		});
	}


	// 踩 
	async _stampede(id, index) {
		let USER = await Storage.getItem('USER');
		Request.post('home/stampede.do',{uid: USER.UID, articleId: id,},(data)=>{
			if (data.error == 0) {
				console.log(data.msg);
			} else {
				alert(data.msg);
			}
		});

		let indexList = this.state.indexList;
		let data = indexList[index];
		data.stampedeCount = data.stampedeCount + 1;
		indexList[index] = data;
		this.setState({
			indexList: indexList
		});
	}

	_getItem(row, index) {
		return	<Item row={row} 
					index={index} key={index} 
					_setDataIndex={this._setDataIndex} 
					_toMsgDetails={this._toMsgDetails}
					_fabulous={this._fabulous.bind(this)}
					_stampede={this._stampede.bind(this)}
				/>
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

	// 跳转帖子详情
	_toMsgDetails = () => {
		this.props.navigation.navigate('ArticleDetails');
	}

	render() {
		return (
			<View style={Styles.view}>

				<FlatList
				  	data={this.state.indexList}
				  	renderItem={({item, index}) => this._getItem(item, index)}
				  	getItemLayout={(data, index) => ({length: 100/oPx, offset: 100/oPx * index , index})}
				  	keyExtractor={(item, index) => item.id}
			  		initialNumToRender={20}
			  		ListFooterComponent={() => this._getListFooterComponent()}
			  		onEndReachedThreshold={0.2}
			  		onEndReached={this._onEndReached}
			  		refreshing={false}
			  		onRefresh={() => {
			  			this._getData()
			  		}}
				/>

				{ this._getImageViewer() }
			</View>
		);
	}
}