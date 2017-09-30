
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
    imagesView: {
        marginTop: 30/oPx,
        marginLeft: 30/oPx,
        marginRight: 30/oPx,

    },
    addImage: {
        width: 140/oPx,
        height: 140/oPx,
        marginRight: 20/oPx,
    },
    delImageIcon: {
        width: 30/oPx,
        height: 30/oPx,

    },
    delImageView: {
        alignItems: 'flex-end',
    },
    add: {
        width: 40/oPx,
        height: 40/oPx,
        marginRight: 20/oPx,
    },
    
});