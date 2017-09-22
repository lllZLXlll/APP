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
	FlatList,
} from 'react-native';
// 帖子详情中评论item
import CommentItem from '../../components/CommentItem';
// Item
import Item from '../../components/Item';
// 请求组件
import Request from '../../utils/Request';
// 存储数据组件
import Storage from '../../utils/Storage';
// 底部加载组件
import FooterComponent from '../../components/FooterComponent';

import Styles from '../../style/user/userStyle';
import {StyleConfig} from '../../style/style';
import Icons from '../../components/Icons';
let oPx = StyleConfig.oPx;

export default class CommentDetails extends Component {
	constructor(props) {
		super(props);
		this.state = {
			row: JSON.parse(this.props.navigation.state.params.row),
	      	// 帖子回复数据
	      	commentData: [],

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

	async _getData(pageNum, pageSize) {
		let USER = await Storage.getItem('USER');
		// 如果没有值那么就是第一次加载
		if (!pageNum && !pageSize) {
			Request.post('home/queryArticleDetailsComment.do',{uid: USER.UID, pageNum: 1, pageSize: 20, commentId: this.props.navigation.state.params.commentId},(data)=>{
				console.log(data);
				this.setState({
					commentData: data.page,
					// 总页数
					totalPageNum: data.totalPageNum,
					// 如果总页数等于1直接设置底部底线
					isData: data.totalPageNum <= 1 ? false : true,
				});
			},(error)=>{
			    console.log(error);
			});
		} else { // 不是第一次加载
			Request.post('home/queryArticleDetailsComment.do',{uid: USER.UID, pageNum: pageNum, pageSize: pageSize, commentId: this.props.navigation.state.params.commentId},(data)=>{
				this.setState({
					// concat方法把数据追加到原数据后面
					commentData: this.state.commentData.concat(data.page),
					pageNum: data.pageNum,
					isData: data.pageNum >= data.totalPageNum ? false : true,
				});
			},(error)=>{
			    console.log(error);
			});
		}
	}

	_getComenItem(row, index) {
		return	<CommentItem row={row} key={index} index={index}
					_commentfabulous={this._commentfabulous.bind(this)}
				/>;
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


	// 点赞评论 并修改上一个页面数据
	async _commentfabulous1(id, index) {
		let row = this.state.row;
		row.fabulous = row.fabulous + 1;
		this.setState({
			row: row
		});

		this.props.navigation.state.params._commentfabulous1(index);

		let USER = await Storage.getItem('USER');
		// Request.post('home/comment.do',{uid: USER.UID, commentId: id,},(data)=>{
		// 	if (data.error == 0) {
		// 		console.log(data.msg);
		// 	} else {
		// 		console.log(data.msg);
		// 	}
		// });
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

	render() {
		return (
			<View style={Styles.view}>
				<CommentItem row={this.state.row} _commentfabulous={this._commentfabulous1.bind(this)} index={this.props.navigation.state.params.index} />
				<View style={{paddingTop: 10/oPx}}></View>

				<FlatList
				  	data={this.state.commentData}
				  	renderItem={({item, index}) => this._getComenItem(item, index)}
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
				
			</View>
		);
	}
}