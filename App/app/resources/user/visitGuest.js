/*
	访客 2017-8-26
*/
import React, { Component } from 'react';
import {
	View,
	Text,
	Image,
} from 'react-native';
import Styles from '../../style/user/userStyle';
import Icons from '../../components/Icons';

export default class Visit extends Component {


	_getTopView() {
		return 	<View style={Styles.articleView}>
						<View style={Styles.textLeftView}>
							<Text style={Styles.textLeft}>总访客：3       今日访客：0</Text>
						</View>
						
						<View style={Styles.textRightView}>
							<Text style={Styles.textRight} onPress={this._onPressMore}>      更多</Text>
						</View>

				</View>;
	}

	_getItem() {
		return 	<View style={[Styles.view, {backgroundColor: '#fff'}]}>
					<View style={Styles.mothView}>
						<Text style={Styles.mothText}>7月</Text>
					</View>
				</View>;
	}

	render() {
		return (
			<View style={Styles.view}>
				{ this._getTopView() }

				{ this._getItem() }

			</View>
		);
	}
}