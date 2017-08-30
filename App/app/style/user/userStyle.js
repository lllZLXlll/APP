// 我的样式组件

import {
	StyleSheet,
} from 'react-native';

import {StyleConfig} from '../style';
const oPx = StyleConfig.oPx;

export default Styles = StyleSheet.create({
	portraitView: {
		flex: 1,
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

	// 发帖
	articleView: {
		height: 40/oPx,
		marginLeft: 30/oPx,
		marginRight: 30/oPx,
		flexDirection: 'row',
	},
	textLeftView: {
		flex: 1,
		justifyContent: 'center',
	},
	textRightView: {
		flex: 1,
		alignItems: 'flex-end',
		justifyContent: 'center',
	},
	textLeft: {
		color: '#999',
		fontSize: 26/oPx,
	},
	textRight: {
		color: '#ff8200',
		fontSize: 26/oPx,
	},
	articleItemView: {
		flex: 1,
		paddingLeft: 30/oPx,
		paddingRight: 30/oPx,
		marginBottom: 10/oPx,
		backgroundColor: '#fff',
	},
	itemTopView: {
		flex: 1,
		height: 50/oPx,
		flexDirection: 'row',
	},
	itemTopLeftView: {
		flex: 9,
		justifyContent: 'flex-end',
	},
	itemTopRightView: {
		flex: 1,
		justifyContent: 'flex-end',
		alignItems: 'flex-end',
	},
	itemTopLeftDate: {
		color: '#999',
		fontSize: 22/oPx,
	},
	itemSelectIcon: {
		width: 30/oPx,
		height: 30/oPx,
	},
	itemConentView: {
		marginTop: 20/oPx,
		marginBottom: 10/oPx,
		flex: 1,
	},
	itemConentText: {
		color: '#000',
		fontSize: 28/oPx,
		lineHeight: 38/oPx,
	},
	praiseView: {
		flex: 1,
		marginTop: 20/oPx,
		marginBottom: 20/oPx,
		flexDirection: 'row',
	},
	itemPraiseView: {
		flex: 1,
		height: 30/oPx,
		flexDirection: 'row',	
	},
	onClickIcon: {
		width: 32/oPx,
		height: 30/oPx,
	},
	onClickText: {
		marginLeft: 10/oPx,
		color: '#999',
		fontSize: 28/oPx,
	},
	itemImage: {
		width: (StyleConfig.screen_width-60/oPx) / 3 - 10/oPx,
		height: (StyleConfig.screen_width-60/oPx) / 3 - 10/oPx,
	},
	itemImgView: {
		flexDirection: 'row',
		marginTop: 10/oPx,
		flex: 1,
	},
	ImgView: {
		flex: 1,
	},
	maxImage: {
		flex: 1,
	},
});



