/*
	发现首页 2017-8-24
*/
import React, { Component } from 'react';
import {
	View,
	Text,
	Image,
	Button,
} from 'react-native';

export default class Screen extends Component {

	render() {
		return (
			<View>
				<Text>{this.props.navigation.state.params.name}</Text>
			</View>
		);
	}
}