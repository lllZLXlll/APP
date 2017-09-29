/*
	帖子详情 2017-9-14
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
// 点赞item组件
import PraiseItemComponent from '../../components/PraiseItemComponent';
// 帖子详情中评论item
import CommentItem from '../../components/CommentItem';
// Item
import Item from '../../components/Item';
// 请求组件
import Request from '../../utils/Request';
// 存储数据组件
import Storage from '../../utils/Storage';

import CommentDetails from '../home/commentDetails';

import Styles from '../../style/user/userStyle';
import {StyleConfig} from '../../style/style';
import Icons from '../../components/Icons';
let oPx = StyleConfig.oPx;

// 临时图片数据
const imagesUri = 'https://www.pujinziben.com/upload/banner/2017/9/20170911083746952.jpg';

export default class ArticleDetails extends Component {
	constructor(props) {
		super(props);
		this.state = {
			data: JSON.parse(this.props.navigation.state.params.row),
			// tab切换栏数据
			tabTitleMap: [
	        	{tabTitle: '评论'},{tabTitle: '赞过'},
	      	],
	      	// 帖子回复数据
	      	commentData: [],
	      	// 点赞临时数据
	      	praiseData: [],
	      	// 选中的tab序号0开始
	      	isSelect: 0,
			isOnClickImage: false,
			dataIndex: 0,
			onClickIndex: 0,
			_onPressMore: this.props._onPressMore,

			// 分页参数
			pageNum: 1,
			pageSize: 20,
			totalPageNum: 0,
			isData: false,
		};
	}

	componentDidMount(){
		this._getData();
	}

	setTabTitleMap = (dataMap) => {
		let tabTitleMap = this.state.tabTitleMap;
		tabTitleMap[0].tabTitle = tabTitleMap[0].tabTitle + '(' + dataMap.articleCommentCount + ')';
		tabTitleMap[1].tabTitle = tabTitleMap[1].tabTitle + '(' + dataMap.articleFabulousCount + ')';
		return tabTitleMap;
	}

	async _getData(pageNum, pageSize) {
		let USER = await Storage.getItem('USER');
		let uid = null;
		if (USER) {
			uid = USER.UID;
		}
		// 如果没有值那么就是第一次加载
		if (!pageNum && !pageSize) {
			Request.post('home/queryArticleDetails.do',{uid: uid, pageNum: 1, pageSize: 20, articleId: this.state.data.id},(data)=>{
				let tabTitleMap = this.setTabTitleMap(data.dataMap);
				this.setState({
					commentData: data.page,
					// 总页数
					totalPageNum: data.totalPageNum,
					tabTitleMap: tabTitleMap,
					// 如果总页数等于1直接设置底部底线
					isData: data.totalPageNum <= 1 ? false : true,
				});
			},(error)=>{
			    console.log(error);
			});
		} else { // 不是第一次加载
			Request.post('home/queryArticleDetails.do',{uid: uid, pageNum: pageNum, pageSize: pageSize, articleId: this.state.data.id},(data)=>{
				let tabTitleMap = this.setTabTitleMap(data.dataMap);
				this.setState({
					// concat方法把数据追加到原数据后面
					commentData: this.state.commentData.concat(data.page),
					pageNum: data.pageNum,
					tabTitleMap: tabTitleMap,
					isData: data.pageNum >= data.totalPageNum ? false : true,
				});
			},(error)=>{
			    console.log(error);
			});
		}

		// 按点赞时间倒序查询50条赞数据
		Request.post('home/queryArticlePraises.do',{articleId: this.state.data.id},(data)=>{
			this.setState({
				praiseData: data,
			});
		},(error)=>{
		    console.log(error);
		});
	}

	_getImageViewer = () => {
		if (this.state.data != [] && this.state.data != null && this.state.data != '' && this.state.data.articleImages != null){
			return 	<ImageViewer
						visible={this.state.isOnClickImage}
						imageUrls={this.state.data.articleImages} // 照片路径
						index={this.state.onClickIndex} // 初始显示第几张
						onClick={() => { // 图片单击事件
	                        this.setState({isOnClickImage: false});
	                    }}
					/>;
		}
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

	// 跳转评论详情
	_toCommentDetails = (id, row, index) => {
		this.props.navigation.navigate('CommentDetails', {
			commentId: id,
			row: row,
			index: index,
			_commentfabulous1: this._commentfabulous1,
		});
	}

	_getComenItem(row, index) {
		return	<CommentItem row={row} key={index} index={index} 
					isShowReverCount={true}
					_commentfabulous={this._commentfabulous.bind(this)} 
					_toCommentDetails={this._toCommentDetails}
				/>;
	}

	_getPraiseItem(row, index) {
         return  <PraiseItemComponent key={index} row={row} />;
    }

	_getTab = () => {
		switch(this.state.isSelect) {
			case 0:
				return this.state.commentData.map((row, index) => {
	 				return	this._getComenItem(row, index);
	 			});
				break;
			case 1:
				return this.state.praiseData.map((row, index) => {
	 				return	this._getPraiseItem(row, index);
	 			});
				break;
			default:
				return this.state.commentData.map((row, index) => {
	 				return	this._getComenItem(row, index);
	 			});
 				break;
		}
	}

	_getFooter() {
		return	<FooterComponent isData={this.state.isData} noDisplay={true} />
	}

	// 点赞帖子
	async _fabulous(id, index) {
		let data = this.state.data;
		data.fabulousCount = data.fabulousCount + 1;
		this.setState({
			data: data
		});

		let USER = await Storage.getItem('USER');
		Request.post('home/fabulous.do',{uid: USER.UID, articleId: id,},(data)=>{
			if (data.error == 0) {
				console.log(data.msg);
			} else {
				console.log(data.msg);
			}
		});
		
		// 调用首页传进来点赞方法，修改首页数据
		this.props.navigation.state.params._fabulous(this.props.navigation.state.params.index);
	}

	// 点赞评论
	async _commentfabulous(id, index) {
		let commentData = this.state.commentData;
		let data = commentData[index];
		data.fabulousCount = data.fabulousCount + 1;
		data.fabulous = data.fabulousCount;
		commentData[index] = data;
		this.setState({
			commentData: commentData
		});

		let USER = await Storage.getItem('USER');
		Request.post('home/comment.do',{uid: USER.UID, commentId: id,},(data)=>{
			if (data.error == 0) {
				console.log(data.msg);
			} else {
				console.log(data.msg);
			}
		});
	}

	// 评论详情点赞后修改本页面数据
	_commentfabulous1 = (index) => {
		let commentData = this.state.commentData;
		let data = commentData[index];
		data.fabulousCount = data.fabulousCount + 1;
		data.fabulous = data.fabulousCount;
		commentData[index] = data;
		this.setState({
			commentData: commentData
		});
	}
	
	// 踩帖子
	async _stampede(id, index) {
		let data = this.state.data;
		data.stampedeCount = data.stampedeCount + 1;
		this.setState({
			data: data
		});

		let USER = await Storage.getItem('USER');
		Request.post('home/stampede.do',{uid: USER.UID, articleId: id,},(data)=>{
			if (data.error == 0) {
				console.log(data.msg);
			} else {
				console.log(data.msg);
			}
		});

		// 调用首页传进来踩方法，修改首页数据
		this.props.navigation.state.params._stampede(this.props.navigation.state.params.index);
	}

	render() {
		let row = JSON.parse(this.props.navigation.state.params.row);
		return (
			<ScrollView style={Styles.view} stickyHeaderIndices={[1]}>
				<Item row={this.state.data}
				 	index={0}
				 	_setDataIndex={this._setDataIndex}
				 	_fabulous={this._fabulous.bind(this)}
				 	_stampede={this._stampede.bind(this)}
				 />

				 <TabComponent isSelect={this.state.isSelect} 
			 		tabTitleMap={this.state.tabTitleMap} 
			 		_setIsSelect={this._setIsSelect}
			 		marginTop={0}
		 		/>

		 		{ this._getTab() }
		 		
		 		{ this._getFooter() }

				{ this._getImageViewer() }
			</ScrollView>
		);
	}
}