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
	},
	footerText: {
		fontSize: 28/oPx,
		color: '#999',
		marginLeft: 15/oPx,
	},
});



