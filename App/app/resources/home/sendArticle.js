/*
	发现首页 2017-8-24
*/
import React, { Component } from 'react';
import {
	View,
	Text,
	Image,
	Button,
	TextInput,
} from 'react-native';

import Styles from '../../style/home/homeStyle';
import ImagePicker from 'react-native-image-crop-picker';

export default class SendArticle extends Component {
	constructor(props){
		super(props);
		this.state = {
			content: '',
			images: [],
		};
	}


	_getInputCount() {
		ImagePicker.openPicker({  
		  multiple: true ,
		  maxFiles: 2, // 最多选择的图片数量仅限ios
		  includeBase64: true, // 选择的图片转换成base64编码字符串
		}).then(images => {
			// 多选的图片返回的images数组
			this.setState({images: images});
		  	console.log(images);
		});
		// ImagePicker.openCropper({  
		//   path: '/Users/imac/Library/Developer/CoreSimulator/Devices/89DE4A4B-5791-4F67-8005-62F90B9414FC/data/Containers/Data/Application/D564C171-4EFC-4557-A3C9-C319AFEB0FA6/tmp/react-native-image-crop-picker/0B326C9D-9806-417E-A644-D0236850182E.jpg',  
		//   width: 300,  
		//   height: 400  
		// }).then(image => {
		//   console.log(image);  
		// }); 
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

	render() {
		return (
			<View style={Styles.view}>
				{ this._getInputCount() }


			</View>
		);
	}
}