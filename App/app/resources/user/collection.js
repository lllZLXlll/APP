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
import ImageViewer from '../../components/ImageViewer';

import Styles from '../../style/user/userStyle';
import {StyleConfig} from '../../style/style';
import Icons from '../../components/Icons';
let oPx = StyleConfig.oPx;

// 临时图片数据
const imagesUri = 'https://avatars2.githubusercontent.com/u/7970947?v=3&s=460';

export default class Collection extends Component {
	constructor(props) {
		super(props);
		this.state = {
			delComponent: <Image style={Styles.itemSelectIcon} source={Icons.selectIcon_1} />,
			data: [
				{sendDate: '2017-8-26 17:53', sendStatus: '发布成功，粉丝将收到您的发帖通知！', sendContent: '煞风景啊谁来讲故事了飞机发生了几份酸辣粉极乐世界发送大量开发建设垃圾焚烧粉红色沙发。', images: [{url:imagesUri}], upCount: 84, downCount: 94, msgCount: 80},
				{sendDate: '2017-8-26 17:53', sendStatus: '发布成功，粉丝将收到您的发帖通知！', sendContent: '可爱叮当猫', images: [{url:imagesUri}, {url:imagesUri}, {url:imagesUri}, ], upCount: 1824, downCount: 24, msgCount: 248},
				{sendDate: '2017-8-27 12:25', sendStatus: '发布成功，粉丝将收到您的发帖通知！', sendContent: '好多好多可爱叮当猫呀！', images: [{url:imagesUri}, {url:imagesUri}, {url:imagesUri}, {url:imagesUri}, {url:imagesUri}, {url:imagesUri}, {url:imagesUri}, {url:imagesUri}, {url:imagesUri}, ], upCount: 124, downCount: 59, msgCount: 77},
			],
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
						
						<View style={Styles.textRightView}>
							<Text style={Styles.textRight} onPress={this._onPressMore}>      更多</Text>
						</View>

				</View>;
	}

	_deleteArticle() {
		alert('确定要删除吗？');
	}

	_getDelComponent = () => {
		return this.state.delComponent;
	}

	// 获得图片方法：集合，下标，开始位置，结束位置
	_getImage(row, index, begin, end, dataIndex) {
		if (index >= begin && index <= end) {
			return 	<View style={Styles.ImgView} key={index}>
						<TouchableOpacity activeOpacity={1} onPress={() => {this.setState({isOnClickImage: true, dataIndex: dataIndex, onClickIndex: index})}}>
							<Image source={{uri: row.url}} style={Styles.itemImage} />
						</TouchableOpacity>
					</View>;
		}
	}

	/** 
		用户最多上传9张图片，每一个view显示三张图片，view布局是row 横向布局，暂时没有
		找到好的方法循环出不定数量的图片，只能先用这个蠢方法，把集合分成三份，循环三
		次，调用三次方法，以后找到好的方法记得替换掉。
	*/
	_getMaxImageItem(images, begin, end, dataIndex) {
		if (images) {
			// 只有一张图片，显示大图
			if (images.length == 1) {
				return 	<TouchableOpacity activeOpacity={1} onPress={() => {this.setState({isOnClickImage: true, dataIndex: dataIndex,})}}>
							<View style={Styles.itemImgView}>
								<Image source={{uri: images[0].url}} style={Styles.maxImage} />
							</View>
						</TouchableOpacity>;
			} else {
				return 	<View style={Styles.itemImgView}>
							{
								images.map((row, index) => {
									return this._getImage(row, index, begin, end, dataIndex);
								})
							}
						</View>;
			}
		}
	}

	_getImageItem(images, begin, end, dataIndex) {
		if (images) {
			return 	<View style={Styles.itemImgView}>
						{
							images.map((row, index) => {
								return this._getImage(row, index, begin, end, dataIndex);
							})
						}
					</View>;
		}
	}

	// 获得发帖item方法
	_getActicleItem(row, index) {
		return 	<View style={Styles.view} key={index}>
					<View style={Styles.pendantView}>
						<Image style={Styles.pendantImage} source={Icons.pendantImage} />
					</View>
					<View style={Styles.articleItemView}>
						<View style={Styles.topView}>
							<Image style={Styles.portraitItem} source={Icons.portrait} />
							<View style={Styles.collectionRightView}>
								<View style={Styles.collectionTopView}>
									<Text style={[Styles.textLeft, {color: '#000'}]}>用户名</Text>
								</View>

								<View style={Styles.collectionBottomView}>
									<Text style={[Styles.textLeft, {color: '#999', fontSize: 24/oPx}]}>08-18 17:24</Text>
								</View>
							</View>
						</View>

						<View style={Styles.itemConentView}>
							<Text style={Styles.itemConentText}>
								{row.sendContent}
							</Text>
						</View>

						{
							row.images 
							?
							<View style={Styles.itemConentView}>
								{ this._getMaxImageItem(row.images, 0, 2, index) }
								{ this._getImageItem(row.images, 3, 5, index) }
								{ this._getImageItem(row.images, 6, 8, index) }
							</View>
							: null
						}

						<View style={Styles.praiseView}>
							<View style={Styles.itemPraiseView}>
								<TouchableOpacity activeOpacity={1}>
									<Image style={Styles.onClickIcon} source={Icons.praiseIcon_1} />
								</TouchableOpacity>
								<Text style={Styles.onClickText}>{row.upCount}</Text>
							</View>
							<View style={Styles.itemPraiseView}>
								<TouchableOpacity activeOpacity={1}>
									<Image style={Styles.onClickIcon} source={Icons.downIcon_1} />
								</TouchableOpacity>
								<Text style={Styles.onClickText}>{row.downCount}</Text>
							</View>
							<View style={Styles.itemPraiseView}>
								<TouchableOpacity activeOpacity={1} onPress={() => {alert('消息')}}>
									<Image style={Styles.onClickIcon} source={Icons.msgIcon} />
								</TouchableOpacity>
								<Text style={Styles.onClickText}>{row.msgCount}</Text>
							</View>
						</View>
					</View>
				</View>;
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

	render() {
		if (this.state.data != null) {
			return (
				<View style={Styles.view}>
					{ this._getArticleView() }
					
					{ 
						this.state.data.map((row, index) => {
							return this._getActicleItem(row, index);
						})
					}

					{ this._getImageViewer() }

					{ this._getMore() }
				</View>
			);
		} else {
			return (
				<View style={Styles.noDataView}><Text style={Styles.noDataText}>暂无记录</Text></View>
			);
		}
		
	}
}