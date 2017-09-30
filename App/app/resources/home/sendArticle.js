/*
	发现首页 2017-8-24
*/
import React, { Component } from 'react';
import {
	View,
	Text,
	Image,
	ImageBackground,
	Button,
	TextInput,
	TouchableOpacity,
	ScrollView,
} from 'react-native';

import Styles from '../../style/home/homeStyle';
import ImagePicker from 'react-native-image-crop-picker';

import Icons from '../../components/Icons';

export default class SendArticle extends Component {
	constructor(props){
		super(props);
		this.state = {
			// 发帖内容
			content: '',
			// 发帖图片 
			images: [],
			// 当前可选择的图片数量
			maxFiles: 9
		};
	}

	// 选择图片方法
	_selectImage = () => {
		ImagePicker.openPicker({  
		  multiple: true , // 是否可多选
		  maxFiles: this.state.maxFiles, // 最多选择的图片数量仅限ios
		  includeBase64: true, // 选择的图片转换成base64编码字符串
		}).then(images => {
			// 多选的图片返回的images数组
			let length = images.length;
			length = 
			this.setState({
				images: this.state.images.concat(images),
				maxFiles: this.state.maxFiles - images.length,
			});
		  	console.log(images);
		});
	}

	_getInputCount() {
		return	<View style={Styles.inputView}>
					<TextInput
						style={Styles.textInput}
						placeholder="不说几句岂不浪费你一身才华~"
						underlineColorAndroid="transparent"
						multiline={true}
						keyboardType="default"
						maxLength={300}
						autoFocus={true}
					 	onChangeText={(content) => this.setState({content})}
                   		value={this.state.content}
                    />

				</View>;
	}

	_delImage = (index) => {
		// 删除对应下标的数组元素
		let images = this.state.images;
		images.splice(index, 1);
		this.setState({
			images: images,
			maxFiles: this.state.maxFiles + 1, // 每次删除后，可选择图片数量+1
		});
	}

	_getImages(row, index) {
		let image = {uri: row.sourceURL};
		return	<ImageBackground key={index} source={image} style={Styles.addImage}>
					<TouchableOpacity activeOpacity={1} onPress={() => this._delImage(index)} style={Styles.delImageView}>
						<Image source={Icons.delImage} style={Styles.delImageIcon} />
					</TouchableOpacity>
				</ImageBackground>;
	}

	render() {
		return (
			<View style={Styles.view}>
				{ this._getInputCount() }
				
				<View style={Styles.imagesView}>
					<ScrollView horizontal={true}>
						{
							this.state.images.length < 9
							?
							<TouchableOpacity activeOpacity={1} onPress={this._selectImage}>
								<Image source={Icons.addImage} style={Styles.addImage} />
							</TouchableOpacity>
							: null
						}
					 	
						{ 
							this.state.images.map((row, index) => {
								return this._getImages(row, index);
							}) 
						}
					</ScrollView>
				</View>
	
			</View>
		);
	}
}