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

export default class Home extends Component {

	render() {
		return (
			<View>
				<Button 
					title="跳转"
					onPress={() => this.props.navigation.navigate('Screen', {name: 'name1234'})}
				/>
			</View>
		);
	}
}