// 我的样式组件

import {
	StyleSheet,
} from 'react-native';

import {StyleConfig} from '../style';
const oPx = StyleConfig.oPx;

export default Styles = StyleSheet.create({
	// 列表底部组件view
	footerView: {
		flex: 1,
		alignItems: 'center',
	},
	centerView: {
		flex: 1,
		flexDirection: 'row',
		paddingLeft: 30/oPx,
		paddingRight: 30/oPx,
		marginTop: 20/oPx,
		marginBottom: 20/oPx,
		alignItems: 'center',
	},
	footerText: {
		fontSize: 28/oPx,
		color: '#999',
		marginLeft: 15/oPx,
	},
	threadView: {
		flex: 1,
		height: StyleConfig.borderWidth,
		backgroundColor: '#999',
	},

	// 帖子详情中的评论item
	itemCommentView: {
		marginTop: 0, 
		marginBottom: 0, 
		backgroundColor: '#fff',
		paddingLeft: 30/oPx,
		paddingRight: 30/oPx,
		borderColor: StyleConfig.borderColor, 
		borderTopWidth: StyleConfig.borderWidth,
	},
	topView: {
		marginTop: 10/oPx, 
		marginBottom: 5/oPx,
		flex: 1,
		flexDirection: 'row',
	},
	itemCommentContentView: {
		flexDirection: 'row',
	},
	itemCommentImgView: {
		width: 70/oPx, 
		marginRight: 10/oPx, 
		marginTop: 10/oPx,
	},
	itemCommentImg: {
		width: 70/oPx, 
		height: 100/oPx,
	},
	commentContentView: {
		flex: 1, 
		marginLeft: 10/oPx,
	},
	commentContentTopView: {
		marginBottom: 20/oPx, 
		paddingLeft: 0/oPx,
	},
	commentContentText: {
		fontSize: 30/oPx,
		color: '#333', 
		lineHeight: 38/oPx,
	},
	commentContentBottomView: {
		paddingBottom: 20/oPx, 
		alignItems: 'center', 
		paddingLeft: 0/oPx, 
	},
	commentRevert: {
		fontSize: 24/oPx, 
		color: '#ff8200',
	},
	commentArrow: {
		width: 10/oPx, 
		height: 20/oPx, 
		marginLeft: 10/oPx,
	},
});



