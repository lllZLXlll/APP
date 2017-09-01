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

import Styles from '../../style/user/userStyle';
import Icons from '../../components/Icons';

export default class Article extends Component {
	constructor(props) {
		super(props);
		this.state = {
			delComponent: <Image style={Styles.itemSelectIcon} source={Icons.selectIcon_1} />,
			data: this.props.data ? this.props.data : null,
			isOnClickImage: false,
			dataIndex: 0,
			onClickIndex: 0,
			_onPressMore: this.props._onPressMore,
		};
	}

	_onPressMore = () => {
		alert(1);
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
		return 	<View style={Styles.articleItemView} key={index}>
					<View style={Styles.itemTopView}>
						<View style={Styles.itemTopLeftView}>
							<Text style={Styles.itemTopLeftDate}>{row.sendDate}</Text>
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
				<View style={{flex: 1}}>
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
				<Text>暂无记录</Text>
			);
		}
		
	}
}