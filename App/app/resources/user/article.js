/*
	发帖 2017-8-26
*/
import React, { Component } from 'react';
import {
	View,
	Text,
	Image,
} from 'react-native';

export default class Article extends Component {

	render() {
		return (
			<View style={{width: 200, height: 200, backgroundColor: '#fff', alignItems: 'center', marginTop: 40}}>
				<Text>发帖</Text>
			</View>
		);
	}
}