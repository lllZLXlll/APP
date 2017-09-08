// 我的样式组件

import {
	StyleSheet,
} from 'react-native';

import {StyleConfig} from '../style';
const oPx = StyleConfig.oPx;

export default Styles = StyleSheet.create({
	view: {
		flex: 1,
	},
	portraitView: {
		height: 160/oPx,
		backgroundColor: '#fff',
		marginTop: 10/oPx,
		flexDirection : 'row',
		borderBottomWidth: StyleConfig.borderWidth,
		borderColor: StyleConfig.borderColor,
	},
	portrait: {
		flex: 1,
		marginBottom: 20/oPx,
		marginTop: 20/oPx,
		marginLeft: 30/oPx,
	},
	userName: {
		flex: 3,
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
		width: 120/oPx,
		height: 120/oPx,
	},
	userNameView: {
		flex: 1,
		justifyContent: 'flex-end',
	},
	userNameText: {
		fontSize: 34/oPx,
		color: '#000',
	},
	autographView: {
		flex: 1,
		justifyContent: 'center',
	},
	autographText: {
		fontSize: 26/oPx,
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
		fontSize: 30/oPx,
		color: '#000',
	},
	itemTextBottomView: {
		flex: 1,
		justifyContent: 'center',
		alignItems: 'center',
	},
	itemBottomText: {
		fontSize: 24/oPx,
		color: '#999',
	},
	
	tabView: {
		backgroundColor: '#fff',
		flexDirection: 'row',
		width: StyleConfig.screen_width,
		height: 70/oPx,
		marginTop: 20/oPx,
	},
	itemTabView: {
		flex: 1,
		justifyContent: 'center',
	},
	tabTextView: {
		height: 34/oPx,
		borderColor: StyleConfig.borderColor,
		borderRightWidth: StyleConfig.borderWidth,
		alignItems: 'center',
		justifyContent: 'center',
	},
	itemTabText: {
		fontSize: 28/oPx,
		color: '#000',
	},

	// 发帖
	articleView: {
		height: 50/oPx,
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
		fontSize: 28/oPx,
	},
	textRight: {
		color: '#ff8200',
		fontSize: 28/oPx,
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
		fontSize: 26/oPx,
	},
	itemSelectIcon: {
		width: 35/oPx,
		height: 35/oPx,
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
		width: StyleConfig.screen_width-60/oPx,
		height: StyleConfig.screen_width-60/oPx,
	},

	moreView: {
		marginTop: 20/oPx,
		marginBottom: 20/oPx,
		alignItems: 'center',
	},
	moreText: {
		fontSize: 26/oPx,
		color: '#ff8200',
	},
	noDataView: {
		flex: 1,
		alignItems: 'center',
		justifyContent: 'center',
	},
	noDataText: {
		fontSize: 30/oPx,
		color: '#999',
	},

	// 评论
	commentItemView: {
		flex: 1,
		backgroundColor: '#fff',
		marginBottom: 10/oPx,
		paddingLeft: 30/oPx,
		paddingRight: 30/oPx,
	},
	commentTopText: {
		color: '#000',
		fontSize: 28/oPx,
		marginTop: 10/oPx,
		lineHeight: 20,
	},
	commentConentView: {
		backgroundColor: '#ebebeb',
		marginTop: 10/oPx,
		marginBottom: 20/oPx,
	},
	commentImg: {
		width: 50/oPx,
		height: 32/oPx,
		marginTop: 10/oPx,
		marginBottom: 20/oPx,
	},
});



