
import {
    StyleSheet,
} from 'react-native';

import {StyleConfig} from '../style';
const oPx = StyleConfig.oPx;

export default Styles = StyleSheet.create({
    view: {
        flex: 1,
        backgroundColor: '#fff',
    },
    inputView: {
        height: 350/oPx,
        width: StyleConfig.screen_width,
        padding: 20/oPx,
        backgroundColor: '#eee'
    },
    textInput: {
        fontSize: 30/oPx,
    },
    
});