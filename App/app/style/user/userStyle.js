// 我的样式组件

import {
	StyleSheet,
} from 'react-native';

import {StyleConfig} from '../style';
const oPx = StyleConfig.oPx;

export default Styles = StyleSheet.create({
	// 头部 部分
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
	// tab 部分
	tabView: {
		backgroundColor: '#fff',
		flexDirection: 'row',
		width: StyleConfig.screen_width,
		height: 60/oPx,
		marginTop: 20/oPx,
	},
	itemTabView: {
		flex: 1,
		flexDirection: 'column',
		justifyContent: 'center',
	},
	tabTextView: {
		height: 34/oPx,
		borderColor: StyleConfig.borderColor,
		borderRightWidth: StyleConfig.borderWidth,
		alignItems: 'center',
	},
	itemTabText: {
		fontSize: 26/oPx,
		color: '#000',
	},
	// 发帖 页面部分
	articleView: {
		flex: 1,
		alignItems: 'center',
	},
	articleTopView: {
		width: StyleConfig.screen_width - 60/oPx,
		height: 40/oPx,
		flexDirection: 'row',
	},
	textLeftView: {
		flex: 1,
		justifyContent: 'center',
		flexDirection: 'column',
	},
	textLeft: {
		color: '#999',
		fontSize: 26/oPx,
	},
	textRightView: {
		flex: 1,
		alignItems: 'flex-end',
		justifyContent: 'center',
		flexDirection: 'column',
	},
	textRight: {
		color: '#ff8200',
		fontSize: 26/oPx,
	},
	articleItemView: {
		backgroundColor: '#fff',
		alignItems: 'center',
		flex: 1,
	},
	itemTopView: {
		width: StyleConfig.screen_width - 60/oPx,
		height: 35/oPx,
		flexDirection: 'row',
	},
	itemTopLeftView: {
		flex: 9,
		justifyContent: 'flex-end',
	},
	itemTopRightView: {
		flex: 1,
		alignItems: 'flex-end',
		justifyContent: 'flex-end',
	},
	itemTopLeftDate: {
		fontSize: 20/oPx,
		color: '#999',
	},
	itemSelectIcon: {
		width: 25/oPx,
		height: 25/oPx,
	},
	itemConentView: {
		flex: 1,
		width: StyleConfig.screen_width - 60/oPx,
		marginTop: 20/oPx,
	},
	itemConentText: {
		color: '#999',
		fontSize: 26/oPx,
	},
	itemPraiseView: {
		marginTop: 20/oPx,
	},

});