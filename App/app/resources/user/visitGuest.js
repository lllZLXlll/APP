/*
	访客 2017-8-26
*/
import React, { Component } from 'react';
import {
	View,
	Text,
	Image,
	TouchableOpacity,
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
		return 	<View style={Styles.visitGuestItemView}>
					<View style={Styles.mothView}>
						<Text style={Styles.mothText}>7月</Text>
					</View>
					<TouchableOpacity activeOpacity={0.5} onPress={() => {alert(1)}}>
						<View style={Styles.visitItemView}>
							<Image style={Styles.visitItemImg} source={Icons.portrait} />
							<View style={Styles.visitView}>
								<View style={Styles.visitItemTextView}>
									<Text style={Styles.visitItemName} numberOfLines={1}>老司机1号</Text>
								</View>
								
								<View style={[Styles.visitItemTextView,{justifyContent: 'flex-start'}]}>
									<Text style={Styles.visitItemContent} numberOfLines={1}>07-14 09:14 访问 [我的资料]</Text>
								</View>
							</View>
							<View style={Styles.arrowImgView}>
								<Image style={Styles.visitItemArrow} source={Icons.arrow} />
							</View>
						</View>
					</TouchableOpacity>
					<TouchableOpacity activeOpacity={0.5} onPress={() => {alert(1)}}>
						<View style={[Styles.visitItemView, {borderBottomWidth: 0}]}>
							<Image style={Styles.visitItemImg} source={Icons.portrait} />
							<View style={Styles.visitView}>
								<View style={Styles.visitItemTextView}>
									<Text style={Styles.visitItemName} numberOfLines={1}>老司机2号</Text>
								</View>
								
								<View style={[Styles.visitItemTextView,{justifyContent: 'flex-start'}]}>
									<Text style={Styles.visitItemContent} numberOfLines={1}>07-14 09:14 访问 [我的帖子]</Text>
								</View>
							</View>
							<View style={Styles.arrowImgView}>
								<Image style={Styles.visitItemArrow} source={Icons.arrow} />
							</View>
						</View>
					</TouchableOpacity>
				</View>;
	}

	_getItem_1() {
		return 	<View style={Styles.visitGuestItemView}>
					<View style={Styles.mothView}>
						<Text style={Styles.mothText}>8月</Text>
					</View>
					<TouchableOpacity activeOpacity={0.5} onPress={() => {alert(1)}}>
						<View style={[Styles.visitItemView, {borderBottomWidth: 0}]}>
							<Image style={Styles.visitItemImg} source={Icons.portrait} />
							<View style={Styles.visitView}>
								<View style={Styles.visitItemTextView}>
									<Text style={Styles.visitItemName} numberOfLines={1}>老司机3号</Text>
								</View>
								
								<View style={[Styles.visitItemTextView,{justifyContent: 'flex-start'}]}>
									<Text style={Styles.visitItemContent} numberOfLines={1}>08-21 19:44 访问 [我的资料]</Text>
								</View>
							</View>
							<View style={Styles.arrowImgView}>
								<Image style={Styles.visitItemArrow} source={Icons.arrow} />
							</View>
						</View>
					</TouchableOpacity>
				</View>;
	}
	
	render() {
		return (
			<View style={Styles.view}>
				{ this._getTopView() }

				{ this._getItem() }
				{ this._getItem_1() }
			</View>
		);
	}
}