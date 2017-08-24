// 发现样式组件

import {
	StyleSheet,
} from 'react-native';

import {StyleConfig} from '../style';
const oPx = StyleConfig.oPx;

export default Styles = StyleSheet.create({
	backgroundView: {
		flex: 1,
	},
	itemView: {
		height: 100/oPx,
		backgroundColor: '#fff',
		borderBottomWidth: StyleConfig.borderWidth,
		borderBottomColor: StyleConfig.borderColor,
	},
	contentView: {
		width: StyleConfig.screen_width - 60/oPx,
		height: 80/oPx,
		marginLeft: 30/oPx,
		marginTop: 10/oPx,
		flexDirection: 'row',
	},
	contentText: {
		fontSize: 28/oPx,
		lineHeight: 38/oPx,
		paddingRight: 10/oPx,
	},
	textView: {
		width: StyleConfig.screen_width - 140/oPx,
		height: 80/oPx,
	},
	contentImage: {
		height: 80/oPx,
		width: 80/oPx,
	},
	swiperViewStyle: {
		flex: 1,
	},
	flatListView: {
		flex: 2,
	},
	imageStyle: {
		flex: 1,
	},
});