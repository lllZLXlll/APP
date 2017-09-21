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
	ScrollView,
	RefreshControl,
	NetInfo,
	ImageBackground,
} from 'react-native';
import Swiper from 'react-native-swiper';
import Request from '../../utils/Request';
import Styles from '../../style/found/foundStyle';
import {StyleConfig} from '../../style/style';
let oPx = StyleConfig.oPx;

export default class Found extends Component {
	constructor(props) {
		super(props);
		this.state = {
			isNetWork: true, // 是否有网络连接
			stories: [],
			top_stories: [],
		};
	}

	componentDidMount(){
		this._getData();
	}

	// 请求数据
	_getData = () => {
		Request.get('https://news-at.zhihu.com/api/4/news/latest',{},(data)=>{
			this.setState({
				stories: data.stories,
				top_stories: data.top_stories,
				isNetWork: true
			});
		},(error)=>{
		    this.setState({
		    	isNetWork: false,
		    });
		});
	}


	// 获得轮播图
	getImage(row, index) {
		return 	<TouchableOpacity key={index} activeOpacity={1} onPress={() => this.onPress(row.id)}>
					<View style={Styles.imageStyle}>
						<ImageBackground
							style={Styles.imageStyle}
							source={{uri: row.image}}
						>
							<Text style={Styles.swiperText} numberOfLines={2}>{row.title}</Text>
						</ImageBackground>
					</View>
				</TouchableOpacity>;
	}

	// 获得日报列表
	getItem(item, index) {
		return 	<TouchableOpacity activeOpacity={0.5} onPress={() => this.onPress(item.id)}>
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
	
	// 点击进入日报详情
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
		if (this.state.isNetWork) {
			return (
				<ScrollView contentContainerStyle={Styles.backgroundView}
					refreshControl={
			            <RefreshControl
			              	refreshing={false}
			              	onRefresh={this._getData}
			            />
			        }
				>
					<View style={Styles.swiperViewStyle}>
						<Swiper autoplay={true} showsPagination={false}>
							{
								this.state.top_stories.map(( row, index ) => {
									return this.getImage(row, index);
								})
							}
						</Swiper>
					</View>
					<View style={Styles.flatListView}>
						<FlatList
						  data={this.state.stories}
						  renderItem={({item}) => this.getItem(item)}
						  getItemLayout={(data, index) => ({length: 100/oPx, offset: 100/oPx * index , index})}
						  keyExtractor={(item, index) => item.id}
						/>
					</View>
				</ScrollView>
			);
		} else if (!this.state.isNetWork) {
			return 	(<ScrollView contentContainerStyle={Styles.backgroundView}
						refreshControl={
				            <RefreshControl
				              	refreshing={false}
				              	onRefresh={this._getData}
				            />
				        }
					>
						<View style={Styles.noDataView}>
							<Text style={Styles.noDataText}>您的设备未连接到网络</Text>
						</View>
					</ScrollView>); 
		}
		
	}
}