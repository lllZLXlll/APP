/*
	评论 2017-8-26
*/
import React, { Component } from 'react';
import {
	View,
	Text,
	Image,
} from 'react-native';
import Styles from '../../../style/user/userStyle';
import Icons from '../../../components/Icons';

export default class Comment extends Component {
	constructor(props) {
		super(props);
		this.state = {
			_onPressMore: this.props._onPressMore,
		};
	}
	_onPressMore = () => {
		this.state._onPressMore();
	}

	_getCommentItem() {
		return 	<View style={Styles.commentItemView}>
					<Text style={Styles.commentTopText} numberOfLines={3}>
						回复<Text style={[Styles.commentTopText, {color: '#5dd6f4'}]}>用户名</Text>:
						哈哈哈～笑死了，还有这种操作！
					</Text>
					<View style={Styles.commentConentView}>
						<Text style={[Styles.commentTopText, {color: '#999', marginTop: 0}]} numberOfLines={5}>
							当工作和爱情不如意时，可逃出小弟弟，凝视它，静思它所蕴含之精神：能长能短，能粗能细，能伸能屈，能软能硬，学学它，眼前的困难算个鸟！
						</Text>
					</View>
				</View>;
	}

	_getCommentItem_Img() {
		return 	<View style={Styles.commentItemView}>
					<Text style={Styles.commentTopText} numberOfLines={3}>
						回复<Text style={[Styles.commentTopText, {color: '#5dd6f4'}]}>用户名</Text>:
						这是哪里？泰国、新加坡、印度尼西亚？
					</Text>
					<Image style={Styles.commentImg} source={Icons.commentImg} />
				</View>;
	}

	render() {
		return (
			<View style={Styles.view}>
				{ this._getCommentItem() }
				{ this._getCommentItem_Img() }
			</View>
		);
	}
}