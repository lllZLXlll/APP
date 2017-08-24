/*
	发现首页 2017-8-24
*/
import React, { Component } from 'react';
import {
	View,
	Text,
	Image,
	Alert,
	TouchableOpacity,
	FlatList,
} from 'react-native';

import Request from '../../utils/Request';
import Styles from '../../style/found/foundStyle';
import {StyleConfig} from '../../style/style';
let oPx = StyleConfig.oPx;

export default class Found extends Component {
	constructor(props) {
		super(props);
		this.state = {
			isInternet: true, // 是否有网络连接
			stories: [],
			top_stories: [],
		};
	}

	componentWillMount(){
		Request.get('https://news-at.zhihu.com/api/4/news/latest',{},(data)=>{
			this.setState({
				stories: data.stories,
				top_stories: data.top_stories,
			});
		    console.log(data);
		    console.log(this.state.stories);
		},(error)=>{
		    this.setState({
		    	isInternet: false
		    });
		});
	}

	getItem(item, index) {
		console.log(item);
		return 	<TouchableOpacity onPress={() => this.onPress(item.id)}>
					<View style={Styles.itemView}>
						<View style={Styles.contentView}>
							<View style={Styles.textView}>
								<Text style={Styles.contentText} numberOfLines={2}>{item.title}</Text>
							</View>
							<Image
								style={Styles.contentImage}
								source={{uri: item.images[0]}}/>
						</View>
					</View>
				</TouchableOpacity>;
	}

	onPress(id) {
		this.props.navigation.navigate(
			'WebView', 
			{
				url: 'https://news-at.zhihu.com/story/' + id, 
				title: '日报详情'
			}
		);
	}

	render() {
		return (
			<View style={Styles.backgroundView}>
				<FlatList
				  data={this.state.stories}
				  renderItem={({item}) => this.getItem(item)}
				  initialNumToRender={20}
				  getItemLayout={(data, index) => ({length: 100/oPx, offset: 100/oPx * index , index})}
				  keyExtractor={(item, index) => item.id}
				/>
			</View>
		);
	}
}