// 我的样式组件

import {
	StyleSheet,
} from 'react-native';

import {StyleConfig} from '../style';
const oPx = StyleConfig.oPx;

export default Styles = StyleSheet.create({
	loginIconView: {
		height: 240/oPx,
		marginTop: 10/oPx,
		marginBottom: 20/oPx,
		backgroundColor: '#fff',
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
});



