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
// 请求组件
import Request from '../../utils/Request';
// 存储数据组件
import Storage from '../../utils/Storage';


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

            // 分页参数
            pageNum: 1,
            pageSize: 20,
            totalPageNum: 0,
		};
	}

    // 请求数据
    componentDidMount(){
        this._getSendData();
    }

    async _getSendData(pageNum, pageSize) {
        let USER = await Storage.getItem('USER');
        let uid = null;
        if (USER) {
            uid = USER.UID;
        }
        // 如果没有值那么就是第一次加载
        if (!pageNum && !pageSize) {
            Request.post('home/index.do',{uid: uid, pageNum: 1, pageSize: 20},(data)=>{
            	console.log('----');
                console.log(data);
                this.setState({
                    data: data.page,
                    // 总页数
                    totalPageNum: data.totalPageNum,
                    // 如果总页数等于1直接设置底部底线
                    isData: data.totalPageNum <= 1 ? false : true,
                });
            },(error)=>{
                console.log(error);
            });
        } else { // 不是第一次加载
            Request.post('home/index.do',{uid: USER.UID, pageNum: pageNum, pageSize: pageSize},(data)=>{
                this.setState({
                    // concat方法把数据追加到原数据后面
                    data: this.state.data.concat(data.page),
                    pageNum: data.pageNum,
                    isData: data.pageNum >= data.totalPageNum ? false : true,
                });
            },(error)=>{
                console.log(error);
            });
        }
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
		return	<Item row={row} index={index} key={index}
				_setDataIndex={this._setDataIndex}
				_toMsgDetails={this.props._toMsgDetails} />
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