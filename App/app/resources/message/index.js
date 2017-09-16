/*
	发现首页 2017-8-24
*/
import React, { Component } from 'react';
import {
	View,
	Text,
	Image,
    TouchableOpacity,
    ScrollView
} from 'react-native';
import { TabNavigatior } from 'react-navigation';
import Icons from '../../components/Icons';
import  Styles from '../../style/message/messageStyle';

export default class Message extends Component {

    constructor(props) {
        super(props);
        this.state = {
            isClick: 0,
            data: [
                {userName: '水电费',text:  '发布成功，粉丝将收到您的发帖通知！',read: 0},
                {userName: '围观VB',text:  '发布成功，粉丝将收到您的发帖通知！',read: 1},
                {userName: '金克木',text:  '发布成功，粉丝将收到您的发帖通知！',read: 0},
                {userName: '金克木',text:  '发布成功，粉丝将收到您的发帖通知！',read: 0},
                {userName: '金克木',text:  '发布成功，粉丝将收到您的发帖通知！',read: 1},
                {userName: '金克木',text:  '发布成功，粉丝将收到您的发帖通知！',read: 0},
            ],
        }
    }

    _getNightView() {
        return 	<TouchableOpacity onPress={() => {this.props.navigation.navigate('Fans')}}>
			<View style={Styles.fansAttentionlView}>
				<View style={Styles.arrowImageView}>
					<Image style={Styles.messageLeftImage1} source={Icons.fansAttention} />
				</View>
				<View style={Styles.messageItemView}>
					<Text style={Styles.messageItemLeftText}>粉丝关注</Text>
				</View>
				<View style={Styles.arrowImageView}>
					<Image style={Styles.arrowImage_item} source={Icons.arrow} />
				</View>
			</View>
		</TouchableOpacity>;
    }

    _getItemView() {
        return 	<TouchableOpacity onPress={() => {this.props.navigation.navigate('Mores')}}>
			<View style={Styles.messageMoreItemView}>
				<View style={Styles.arrowImageView}>
					<Image style={Styles.messageLeftImage2} source={Icons.Reply} />
				</View>
				<View style={Styles.messageItemView}>
					<View style={Styles.messageItemsView}>
						<Text style={Styles.messageItemLeftText}>评论回复</Text>
					</View>
				</View>

				<View style={Styles.arrowImageView}>
					<Image style={Styles.arrowImage_item} source={Icons.arrow} />
				</View>
			</View>
		</TouchableOpacity>;
    }

    _getItemView_1() {
        return <TouchableOpacity onPress={() => {
            alert(1)
        }}>
			<View style={Styles.messageMoreItemView1}>
				<View style={Styles.arrowImageView}>
					<Image style={Styles.messageLeftImage3} source={Icons.systemMessage} />
				</View>
				<View style={Styles.messageItemView}>
					<Text style={Styles.messageItemLeftText}>系统消息</Text>
				</View>

				<View style={Styles.arrowImageView}>
					<Image style={Styles.arrowImage_item} source={Icons.arrow}/>
				</View>
			</View>
		</TouchableOpacity>;
    }

    _getTextItem(row, index) {
        return <View style={Styles.messageTable} key={index}>
			<View style={Styles.messageTableP}>
				<TouchableOpacity activeOpacity={0.5}>
					<Image style={Styles.messagePortraitImage} source={Icons.portrait} />
				</TouchableOpacity>
			</View>
			<View style={Styles.messageRead}>
                {
                    row.read == 0
                        ?
						<Text style={{color:'#f55'}}>
							●
						</Text>
                        :
						<Text>
						</Text>
                }

			</View>
			<View  style={Styles.messageTableC}>
					<View style={[Styles.messageItems, {justifyContent: 'flex-end',}]}>
						<Text style={Styles.userNameText}>
                            {row.userName}
						</Text>
					</View>
					<View style={Styles.messageItems}>
						<Text style={Styles.autographText} numberOfLines={1}>
                            {row.text}
						</Text>
					</View>
			</View>
		</View>
    }

	render() {
		return (
			<ScrollView style={Styles.view}>
				{this._getNightView()}
                {this._getItemView()}
                {this._getItemView_1()}

				{
					this.state.data.map((row, index) => {
						return this._getTextItem(row, index);
					})
				}
			</ScrollView>

		);
	}
}