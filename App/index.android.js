/*
  2017-8-24
*/
import React, { Component } from 'react';
import { AppRegistry,Text } from 'react-native';
import AppPage from './app/index';
// import AppPage from './app/components/TabComponent.js';

class App extends Component {

	render() {
		return (
			<AppPage />
		);
	}
}

AppRegistry.registerComponent('App', () => App);
