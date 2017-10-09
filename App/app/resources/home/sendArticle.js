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
	Alert,
} from 'react-native';

import Styles from '../../style/home/homeStyle';
//消息样式
import msgStyles from '../../style/message/messageStyle';
import ImagePicker from 'react-native-image-crop-picker';
import {ToastShort} from '../../utils/Toast';
// 存储数据组件
import Storage from '../../utils/Storage';
// 请求组件
import Request from '../../utils/Request';

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

		导航头部设置
	static navigationOptions = ({ navigation }) => ({
      title: '',
      headerLeft: (
        <TouchableOpacity style={Styles.goBackStyle} activeOpacity={0.5} onPress={() => {navigation.state.params._goBack()}}>
          <Text style={[msgStyles.blacklistFont, Styles.textRed]}>取消</Text>
        </TouchableOpacity>
      ),
      headerRight: (
        <TouchableOpacity activeOpacity={0.5} onPress={() => {navigation.state.params._checkData()}}>
          <Text style={msgStyles.blacklistFont}>发送</Text>
        </TouchableOpacity>
      ),
      // 是否启用手势关闭屏幕
      gesturesEnabled: false,
  	  headerTitleStyle: {
  		  alignSelf: 'center',
  	  },
    });

	async componentDidMount() {
		// 想要在导航栏中调用本页面方法，必须设置到navigation中
		this.props.navigation.setParams({
			_goBack: this._goBack.bind(this), 
			_checkData: this._checkData.bind(this)
		});

		let DRAFT = await Storage.getItem('DRAFT');
		this.setState({
			content: DRAFT.CONTENT ? DRAFT.CONTENT : '',
			images: DRAFT.IMAGES ? DRAFT.IMAGES : [],
			maxFiles: DRAFT.MAXFILES ? DRAFT.MAXFILES : 9
		});

	}

	// 选择图片方法
	_selectImage = () => {
		// 从相册中选择相片
		ImagePicker.openPicker({
		  multiple: true , // 是否可多选
		  maxFiles: this.state.maxFiles, // 最多选择的图片数量仅限ios
		  includeBase64: true, // 选择的图片转换成base64编码字符串
		}).then(images => {
			this.setState({
				images: this.state.images.concat(images),// 多选的图片返回的images数组
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
					 	onChangeText={(content) => this.setState({content: content})}
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

	// 返回首页是否保存草稿
	_goBack() {
		// 输入了文字或选择了图片就提示是否保存草稿
		if (this.state.content != '' || this.state.maxFiles < 9) {
			Alert.alert(
                '提示',
                '未编辑完内容是否保存草稿？',
                [
                	{text: '删除', onPress: () => {this._delDraft()}},
                    {text: '保存', onPress: () => {this._saveDraft()}},
                ]
            );
		} else {
			this.props.navigation.goBack();
		}
	}

	// 保存到草稿
	_saveDraft = () => {
		let param = {
			// 内容
            CONTENT: this.state.content,
            // 图片
            IMAGES: this.state.images,
            // 可选图片数量
            MAXFILES: this.state.maxFiles,
        };
        Storage.setItem('DRAFT',param);
        this.props.navigation.goBack();
	}

	// 删除草稿
	_delDraft = () => {
		Storage.clearItem('DRAFT');
		this.props.navigation.goBack();
	}

	// 提交前判断数据是否为空，是否登录
	async _checkData() {
		if (this.state.content == '') {
			ToastShort('内容不能为空', 300);
			return;
		}
		if (this.state.content.length < 10) {
			ToastShort('别浪费你的才华，多写点吧！', 300);
			return;
		}
		if (this.state.images.length > 9) {
			ToastShort('最多只能选择九张图片', 300);
			return;
		}

		let USER = await Storage.getItem('USER');
		let uid = null;
		if (USER) {
			uid = USER.UID;
		} else {
			alert('未登录，跳转登录页面');
			return;
		}

		this._submit(uid);
	}

	_submit = (uid) => {
		Request.post('home/sendArticle.do',{uid: uid, content: this.state.content, images: this.state.images},(data)=>{
			console.log(data);
			if (data.error == 0) {
				alert('发帖成功');
			} else {
				alert(data.msg);
			}
		},(error)=>{
		    console.log(error);
		});
	}

	render() {
		return (
			<View style={Styles.view}>
				{ this._getInputCount() }
				
				<View style={Styles.imagesView}>
					{
						this.state.images.length < 9
						?
						<TouchableOpacity activeOpacity={1} onPress={this._selectImage}>
							<Image source={Icons.addImage} style={Styles.addImage} />
						</TouchableOpacity>
						: null
					}
					{/* keyboardShouldPersistTaps="handled" 此属性让滚动视图子元素第一次点击就获得焦点 */} 	
					<ScrollView horizontal={true} keyboardShouldPersistTaps="handled">
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