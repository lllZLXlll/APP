/*
	发帖、收藏 item组件 2017-8-26
*/
import React, { Component } from 'react';
import {
	View,
	Text,
	Image,
	TouchableOpacity,
} from 'react-native';
// 照片浏览
import ImageViewer from './ImageViewer';

import Styles from '../style/user/userStyle';
import {StyleConfig} from '../style/style';
import Icons from './Icons';
let oPx = StyleConfig.oPx;

export default class Item extends Component {
	constructor(props) {
		super(props);
		this.state = {
			delComponent: <Image style={Styles.itemSelectIcon} source={Icons.selectIcon_1} />,
		};
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
			return 	<View key={index}>
						<TouchableOpacity activeOpacity={1} onPress={() => this.props._setDataIndex(dataIndex, index)}>
							<Image source={{uri: row.url}} style={Styles.itemImage} resizeMode="cover" />
						</TouchableOpacity>
					</View>;
		}
	}

	// 四张图片时
	_getImage_4(row, index, begin, end, dataIndex) {
		if (index >= begin && index <= end) {
			return 	<View key={index}>
						<TouchableOpacity activeOpacity={1} onPress={() => this.props._setDataIndex(dataIndex, index)}>
							<Image source={{uri: row.url}} style={Styles.itemImage_4} resizeMode="cover" />
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
			return 	<TouchableOpacity activeOpacity={1} onPress={() => this.props._setDataIndex(dataIndex)}>
						<View style={Styles.itemImgView}>
							<Image source={{uri: images[0].url}} style={Styles.maxImage} resizeMode="cover" />
						</View>
					</TouchableOpacity>;
		}
	}

	_getImageItem(images, begin, end, dataIndex, indexEnd) {
		if (images && images.length != 4) {
			return 	<View style={Styles.itemImgView}>
						{
							images.map((row, index) => {
								return this._getImage(row, index, begin, end, dataIndex);
							})
						}
					</View>;
		} else if (images.length == 4) {
			return 	<View style={Styles.itemImgView}>
						{
							images.map((row, index) => {
								if (index <= indexEnd) {
									return this._getImage_4(row, index, begin, end, dataIndex);
								}
							})
						}
					</View>;
		}
	}

	_getImages(images, index) {
		if (images.length == 1) {	// 一张图片显示大图
			return	<View style={Styles.itemConentView}>
						{ this._getMaxImageItem(images, 0, 0, index) }					
					</View>;
		} else if (images.length == 4) {	// 四张图片显示一行两张大图
			return	<View style={Styles.itemConentView}>
						{ this._getImageItem(images, 0, 1, index, 1) }
						{ this._getImageItem(images, 2, 3, index, 3) }
					</View>;
		} else if (images.length < 4) {		// 少于四张或多于四张每行三张排列
			return	<View style={Styles.itemConentView}>
						{ this._getImageItem(images, 0, 2, index) }
						{ this._getImageItem(images, 3, 3, index) }
					</View>;
		} else {
			return	<View style={Styles.itemConentView}>
						{ this._getImageItem(images, 0, 2, index) }
						{ this._getImageItem(images, 3, 5, index) }
						{ this._getImageItem(images, 6, 8, index) }
					</View>;
		}
	}
	
	// 获得发帖item方法
	_getActicleItem(row, index) {
		return 	<View style={Styles.view}>
					<View style={Styles.pendantView}>
						<Image style={Styles.pendantImage} source={Icons.pendantImage} />
					</View>
					<View style={Styles.articleItemView}>
						<View style={Styles.topView}>
							<Image style={Styles.portraitItem} source={{uri: row.portrait}} />
							<View style={Styles.collectionRightView}>
								<View style={Styles.collectionTopView}>
									<Text style={[Styles.textLeft, {color: '#333'}]}>{row.userName}</Text>
								</View>

								<View style={Styles.collectionBottomView}>
									<Text style={[Styles.textLeft, {color: '#999', fontSize: 24/oPx}]}>{row.articleDate}</Text>
								</View>
							</View>
							<View style={Styles.itemTopRightView}>
								<TouchableOpacity activeOpacity={1} onPress={() => {this._deleteArticle()}}>
									{ this._getDelComponent() }
								</TouchableOpacity>
							</View>
						</View>

						<View style={[Styles.itemConentView, {marginBottom: 10/oPx}]}>
							<Text style={Styles.itemConentText}>
								{row.articleContent}
							</Text>
						</View>

						{
							row.articleImages ? this._getImages(row.articleImages, index) : null
						}
						
						{/* 热评模块 */}
						{/*{*/}
							{/*!this.props.isNoShowComment*/}
							{/*?*/}
							{/*<View style={Styles.itemCommentView}>*/}
							{/*	<View style={[Styles.topView, {marginTop: 10/oPx, marginBottom: 5/oPx}]}>*/}
							{/*		<Image style={[Styles.portraitItem, {}]} source={Icons.portrait} />*/}
							{/*		<View style={Styles.collectionRightView}>*/}
							{/*			<View style={[Styles.collectionTopView, {justifyContent: 'center'}]}>*/}
							{/*				<Text style={[Styles.textLeft, {color: '#333'}]}>用户名</Text>*/}
							{/*			</View>*/}
							{/*		</View>*/}
							{/*		<View style={[Styles.itemTopRightView, {flexDirection: 'row', alignItems: 'center', justifyContent: 'flex-end',}]}>*/}
							{/*			<TouchableOpacity activeOpacity={1} onPress={() => {this._deleteArticle()}}>*/}
							{/*				<Image style={Styles.onClickIcon} source={Icons.praiseIcon_1} />*/}
							{/*			</TouchableOpacity>*/}
							{/*			<Text style={Styles.onClickText}>{row.upCount}</Text>*/}
							{/*		</View>*/}
							{/*	</View>*/}
							{/*	<View style={[Styles.topView, {marginBottom: 20/oPx, marginTop: 10/oPx}]}>*/}
							{/*		<Text style={[Styles.textLeft, {color: '#333', lineHeight: 38/oPx,}]} numberOflines={5}>内容</Text>*/}
							{/*	</View>*/}
							{/*</View>*/}
							{/*: null*/}
						{/*}*/}

						<View style={Styles.praiseView}>
							<TouchableOpacity style={Styles.itemPraiseView} activeOpacity={1} onPress={() => {this.props._fabulous(row.id, index)}}>
								<Image style={Styles.onClickIcon} source={Icons.praiseIcon_1} />
								<Text style={Styles.onClickText}>{row.fabulousCount}</Text>
							</TouchableOpacity>
							<TouchableOpacity style={Styles.itemPraiseView} activeOpacity={1} onPress={() => {this.props._stampede(row.id, index)}}>
								<Image style={Styles.onClickIcon} source={Icons.downIcon_1} />
								<Text style={Styles.onClickText}>{row.stampedeCount}</Text>
							</TouchableOpacity>
							<View style={Styles.itemPraiseView}>
								<TouchableOpacity activeOpacity={1} onPress={this.props._toMsgDetails}>
									<Image style={Styles.onClickIcon} source={Icons.msgIcon} />
								</TouchableOpacity>
								<Text style={Styles.onClickText}>{row.commentCount}</Text>
							</View>
						</View>
					</View>
				</View>;
	}

	render() {
		return (
			<View style={Styles.view}>
				{ this._getActicleItem(this.props.row, this.props.index) }
			</View>
		);
	}
}