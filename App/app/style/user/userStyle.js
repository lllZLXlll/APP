// 我的样式组件

import {
	StyleSheet,
} from 'react-native';

import {StyleConfig} from '../style';
const oPx = StyleConfig.oPx;

export default Styles = StyleSheet.create({
	portraitView: {
		width: StyleConfig.screen_width,
		height: 120/oPx,
		backgroundColor: '#fff',
		marginTop: 10/oPx,
		flexDirection : 'row',
		borderBottomWidth: StyleConfig.borderWidth,
		borderColor: StyleConfig.borderColor,
	},
	portrait: {
		flex: 1,
		marginBottom: 10/oPx,
		marginTop: 10/oPx,
		marginLeft: 30/oPx,
	},
	userName: {
		flex: 4,
		marginBottom: 10/oPx,
		marginTop: 10/oPx,
	},
	arrow: {
		flex: 1,
		marginBottom: 10/oPx,
		marginTop: 10/oPx,
		marginRight: 30/oPx,
		alignItems: 'flex-end',
		justifyContent: 'center',
	},
	portraitImage: {
		flex: 1,
		width: 100/oPx,
		height: 100/oPx,
	},
	userNameView: {
		flex: 1,
		justifyContent: 'flex-end',
	},
	userNameText: {
		fontSize: 28/oPx,
		color: '#000',
	},
	autographView: {
		flex: 1,
		justifyContent: 'center',
	},
	autographText: {
		fontSize: 22/oPx,
		color: '#999',
	},
	arrowImage: {
		width: 15/oPx,
		height: 30/oPx,
	},
	
	statisticsView: {
		width: StyleConfig.screen_width,
		height: 80/oPx,
		backgroundColor: '#fff',
		flexDirection : 'row',
	},
	itemView: {
		flex: 1,
		marginBottom: 10/oPx,
		marginTop: 10/oPx,
		alignItems: 'center',
	},
	itemTextTopView: {
		flex: 1,
		justifyContent: 'flex-end',
		alignItems: 'center',
	},
	itemTopText: {
		fontSize: 28/oPx,
		color: '#000',
	},
	itemTextBottomView: {
		flex: 1,
		justifyContent: 'center',
		alignItems: 'center',
	},
	itemBottomText: {
		fontSize: 22/oPx,
		color: '#999',
	},
});