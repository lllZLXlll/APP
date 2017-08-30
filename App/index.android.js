/*
  2017-8-24
*/
import React, { Component } from 'react';
import { AppRegistry,Text } from 'react-native';
import Orientation from 'react-native-orientation';
import AppPage from './app/index';

class App extends Component {
	componentDidMount() {
	    // 锁定屏幕为纵向
	    Orientation.lockToPortrait();
	    // 锁定屏幕为横向
    	// Orientation.lockToLandscape();

    	// 监听屏幕改变
    	Orientation.addOrientationListener(this._orientationDidChange);
	}

	_orientationDidChange = (orientation) => {
		// 如果屏幕为横向，将屏幕锁定为纵向
	    if (orientation === 'LANDSCAPE') {
	      Orientation.lockToPortrait();
	    }
  	}	

	render() {
		return (
			<AppPage />
		);
	}
}

AppRegistry.registerComponent('App', () => App);
