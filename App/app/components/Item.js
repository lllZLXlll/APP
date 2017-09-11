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

// 临时图片数据
const imagesUri = 'https://avatars2.githubusercontent.com/u/7970947?v=3&s=460';

export default class Item extends Component {
	constructor(props) {
		super(props);
		this.state = {
			delComponent: <Image style={Styles.itemSelectIcon} source={Icons.selectIcon_1} />,
		};
	}

	_onPressMore = () => {
		this.state._onPressMore();
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
						<TouchableOpacity activeOpacity={1} onPress={() => this.props._setDataIndex(dataIndex, index)}>
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
				return 	<TouchableOpacity activeOpacity={1} onPress={() => this.props._setDataIndex(dataIndex)}>
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
		return 	<View style={Styles.view}>
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
							<View style={Styles.itemTopRightView}>
								<TouchableOpacity activeOpacity={1} onPress={() => {this._deleteArticle()}}>
									{ this._getDelComponent() }
								</TouchableOpacity>
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

	render() {
		return (
			<View style={Styles.view}>
				{ this._getActicleItem(this.props.row, this.props.index) }
			</View>
		);
	}
}