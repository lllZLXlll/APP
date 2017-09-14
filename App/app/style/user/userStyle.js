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

    itemBottomTextIsSelect: {
        fontSize: 24/oPx,
        color: '#eeb323',
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
		fontSize: 30/oPx,
	},
	textRight: {
		color: '#ff8200',
		fontSize: 28/oPx,
	},
	articleItemView: {
		flex: 1,
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
		justifyContent: 'center',
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
		paddingLeft: 30/oPx,
		paddingRight: 30/oPx,
	},
	itemConentText: {
		color: '#333',
		fontSize: 30/oPx,
		lineHeight: 38/oPx,
	},
	praiseView: {
		flex: 1,
		marginTop: 20/oPx,
		marginBottom: 20/oPx,
		flexDirection: 'row',
		paddingLeft: 30/oPx,
		paddingRight: 30/oPx,
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
		width: (StyleConfig.screen_width-60/oPx) / 3 - 5/oPx,
		height: (StyleConfig.screen_width-60/oPx) / 3 - 5/oPx,
		marginRight: 5/oPx,
	},
	itemImage_4: {
		width: (StyleConfig.screen_width-60/oPx) / 2 - 5/oPx,
		height: (StyleConfig.screen_width-60/oPx) / 2 - 5/oPx,
		marginRight: 5/oPx,
	},
	itemImgView: {
		flexDirection: 'row',
		marginTop: 5/oPx,
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
	itemCommentView: {
		backgroundColor: '#eee',
		marginTop: 20/oPx,
		marginBottom: 20/oPx,
	},
	
	// 粉丝
	FansTable: {
        height: 160/oPx,
        backgroundColor: '#fff',
        flexDirection : 'row',
        borderTopWidth: StyleConfig.borderWidth,
        borderColor: StyleConfig.borderColor,
	},
    FansTableP: {
        marginTop: 20/oPx,
	},
    FansTableC: {
        marginLeft: 10/oPx,
        alignSelf: 'center',
    },
    attentionImage: {
        width: 96/oPx,
        height: 42/oPx,
    },
    fansPortraitImage: {
        width: 110/oPx,
        height: 110/oPx,
        marginLeft: 30/oPx
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

	// 收藏
	pendantView: { // 头部挂件
		flex: 1,
		height: 30/oPx,
		backgroundColor: '#fff',
	},
	pendantImage: { // 挂件图片
		width: StyleConfig.screen_width,
		height: 30/oPx,
	},
	topView: {
		flex: 1,
		flexDirection: 'row',
		paddingLeft: 30/oPx,
		paddingRight: 30/oPx,
	},
	portraitItem: {
		width: 70/oPx,
		height: 70/oPx,
	},
	collectionRightView: {
		marginLeft: 20/oPx,
	},
	collectionTopView: {
		flex: 1,
		justifyContent: 'flex-end',
	},
	collectionBottomView: {
		flex: 1,
		justifyContent: 'flex-end',
	},

	// 访客
	visitGuestItemView: {
		flex: 1,
		backgroundColor: '#fff',
		marginBottom: 10/oPx,
	},
	mothView: {
		height: 50/oPx,
		borderBottomWidth: StyleConfig.borderWidth,
		borderColor: StyleConfig.borderColor,
		justifyContent: 'center',
	},
	mothText: {
		fontSize: 30/oPx,
		color: '#000',
		marginLeft: 30/oPx,
	},
	visitItemView: {
		height: 100/oPx,
		flexDirection: 'row',
		marginLeft: 30/oPx,
		paddingRight: 30/oPx,
		borderBottomWidth: StyleConfig.borderWidth,
		borderColor: StyleConfig.borderColor,
		paddingTop: 10/oPx,
		paddingBottom: 10/oPx,
	},
	visitItemImg: {
		height: 80/oPx,
		width: 80/oPx,
	},
	visitItemTextView: {
		flex: 1,
		justifyContent: 'flex-end',
		marginLeft: 20/oPx,
	},
	visitItemName: {
		fontSize: 28/oPx,
		color: '#000',
	},
	visitItemContent: {
		fontSize: 24/oPx,
		color: '#999',
	},
	visitItemArrow: {
		height: 24/oPx,
		width: 12/oPx,
	},
	visitView: {
		flex: 2,
	},
	arrowImgView: {
		flex: 1,
		justifyContent: 'center',
		alignItems: 'flex-end',
	},
	
	// 个人信息
	userMoreTopView: {
		backgroundColor: '#fff',
		height: 120/oPx,
		marginTop: 35/oPx,
		marginBottom: 35/oPx,
		flexDirection: 'row',
		paddingLeft: 30/oPx,
		paddingRight: 30/oPx,
	},
	userItemView: {
		flex: 1,
		justifyContent: 'center',
	},
	userItemLeftText: {
		fontSize: 28/oPx,
		color: '#000',
	},
	userItemCenterView: {
		flex: 1,
		justifyContent: 'center',
		alignItems: 'flex-end',
	},
	arrowImageView: {
		justifyContent: 'center',
	},
	
	userMoreItemView: {
		backgroundColor: '#fff',
		height: 70/oPx,
		flexDirection: 'row',
		paddingLeft: 30/oPx,
		paddingRight: 30/oPx,
		borderBottomWidth: StyleConfig.borderWidth,
		borderColor: StyleConfig.borderColor,
	},
	arrowImage_item: {
		height: 24/oPx,
		width: 12/oPx,
	},
	exitItemView: {
		height: 70/oPx,
		width: StyleConfig.screen_width,
		alignItems: 'center',
		justifyContent: 'center',
		marginTop: 35/oPx,
		backgroundColor: '#fff',
	},
	exitText: {
		fontSize: 28/oPx,
		color: 'red',
	},
    fansPraise: {
        height: 30/oPx,
        width: 32/oPx,
        marginLeft: 31/oPx,
	},
	set: {
        height: 45/oPx,
        width: 45/oPx,
		marginRight: 30/oPx,
	},
	//夜间模式
    nightModelView: {
        backgroundColor: '#fff',
        height: 80/oPx,
        marginTop: 30/oPx,
        marginBottom: 30/oPx,
        flexDirection: 'row',
        paddingLeft: 30/oPx,
        paddingRight: 30/oPx,
    },
	//当前版本
    versionsView: {
        height: 70/oPx,
        width: StyleConfig.screen_width,
        flexDirection: 'row',
        paddingLeft: 30/oPx,
        paddingRight: 30/oPx,
        marginTop: 50/oPx,
        backgroundColor: '#fff',
    },
    versionsText: {
        fontSize: 28/oPx,
        color: '#9e9e9e',
	}
});



