// 我的样式组件

import {
	StyleSheet,
} from 'react-native';

import {StyleConfig} from '../style';
const oPx = StyleConfig.oPx;

export default Styles = StyleSheet.create({
	loginIconView: {
		height: 240/oPx,
		flexDirection: 'row',
	},
	loginItemView: {
		flex: 1,
		alignItems: 'center',

	},
	loginItemImg: {
		width: 140/oPx,
		height: 140/oPx,
		marginTop: 20/oPx,
	},
	loginItemText: {
		fontSize: 30/oPx,
		color: '#333',
		marginTop: 20/oPx,
	},
	loginBottomView: {
		flex: 5,
		alignItems: 'center',
		justifyContent: 'flex-end',
	},
	loginBgImg: {
		width: 500/oPx,
		height: 617/oPx,
	},
	loginContentView: {
		flex: 2,
		alignItems: 'center',
		paddingLeft: 30/oPx,
		paddingRight: 30/oPx,
		justifyContent: 'center',
	},
});



