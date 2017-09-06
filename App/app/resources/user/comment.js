/*
	评论 2017-8-26
*/
import React, { Component } from 'react';
import {
	View,
	Text,
	Image,
} from 'react-native';
import Styles from '../../style/user/userStyle';

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

	_getCommentView() {
		return 	<View style={Styles.articleView}>
						<View style={Styles.textLeftView}>
							<Text style={Styles.textLeft}>评论：2</Text>
						</View>
						
						<View style={Styles.textRightView}>
							<Text style={Styles.textRight} onPress={this._onPressMore}>      更多</Text>
						</View>

				</View>;
	}

	render() {
		return (
			<View style={Styles.view}>
				{ this._getCommentView() }
				
			</View>
		);
	}
}