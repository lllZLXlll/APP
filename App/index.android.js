/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  Image,
  Button,
} from 'react-native';
import { 
	TabNavigator, 
	StackNavigator,
	NavigationActions,
} from 'react-navigation';

class Home extends Component {
	constructor(props) {
		super(props);
		this.state = {
			
		}
	}
	
  static navigationOptions = {
    tabBarLabel: '首页',
    tabBarIcon: () => (
      <Image
        source={require('./app/images/icon/icon_1.png')}
        style={styles.icon}
      />
    ),
  };

  render() {
    return (
      <View>
        <Button 
          title="跳转"
          onPress={() => 
			this.props.navigation.navigate('Page', {name: '1234'})
		  }
        />
      </View>
    );
  }
}

class Page extends Component {
  static navigationOptions = {
    tabBarLabel: '消息',
    tabBarIcon: () => (
      <Image
        source={require('./app/images/icon/icon_2.png')}
        style={styles.icon}
      />
    ),
  };

  render() {
    console.log(1234);
    console.log(this.props.navigation);
    return (
		<Button
			title='回跳'
			onPress={() => this.props.navigation.goBack()}
		/>
    );
  }
}

class Page1 extends Component {
  static navigationOptions = {
    tabBarLabel: '发帖',
    tabBarIcon: () => (
      <Image
        source={require('./app/images/icon/icon_2.png')}
        style={styles.icon}
      />
    ),
  };

  render() {
    console.log(this.props.navigation.setParams);
    return (
      <Button
        title="回跳"
        onPress={() => this.props.navigation.goBack()}
      />
    );
  }
}

class Page2 extends Component {
  static navigationOptions = {
    tabBarLabel: '发现',
    tabBarIcon: () => (
      <Image
        source={require('./app/images/icon/icon_2.png')}
        style={styles.icon}
      />
    ),
  };

  render() {
    console.log(this.props.navigation.setParams);
    return (
      <Button
        title="回跳"
        onPress={() => this.props.navigation.goBack()}
      />
    );
  }
}

class Page3 extends Component {
  static navigationOptions = {
    tabBarLabel: '我的',
    tabBarIcon: () => (
      <Image
        source={require('./app/images/icon/icon_2.png')}
        style={styles.icon}
      />
    ),
  };

  render() {
    console.log(this.props.navigation.setParams);
    return (
      <Button
        title="回跳"
        onPress={() => this.props.navigation.goBack()}
      />
    );
  }
}

const Tab = TabNavigator({
  Home: {
    screen: Home,
  },
  Page: {
    screen: Page,
  },
  Page1: {
    screen: Page1,
  },
  Page2: {
    screen: Page2,
  },
  Page3: {
    screen: Page3,
  },

}, {
	tabBarPosition: 'bottom',
	tabBarOptions: {
		activeTintColor: 'red',
		activeBackgroundColor: '#fff',
		inactiveTintColor: '#999',
		inactiveBackgroundColor: '#fff',
		showIcon: true,
		style : {
			backgroundColor: '#fff',
		},
	},
});

const App = StackNavigator({
  Home: {
    screen: Tab,
    navigationOptions: ({ navigation }) => ({
      title: "首页",
	  headerTitleStyle: {
			alignSelf: 'center',
		},
    }),
  },
},{
	
});


const styles = StyleSheet.create({
  icon: {
    width: 20,
    height: 20,
  },
});

AppRegistry.registerComponent('App', () => App);
