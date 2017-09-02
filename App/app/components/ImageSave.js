import {
    Image,
    Platform,
    CameraRoll,
    ImageEditor,
    Alert,
} from 'react-native';
//import {ToastShort} from '../utils/Toast';

let ImageSave = {
  Save: (url) => {
    if(Platform.OS === 'ios') {
            CameraRoll.saveToCameraRoll(url,'photo').done(function(data){
                // ToastShort('保存图片成功',300);
                Alert.alert('提示', '保存图片成功');
            },function(err){
                Alert.alert('提示', '您没有对此应用开放访问相册权限，无法保存！请到 [设置] -> [隐私] 中找到此应用，并开放权限。');
            });
    } else {
        Image.getSize(url, (width, height) => {
            ImageEditor.cropImage(
                url,
                {offset:{x:0,y:0},size:{width:width, height:height}},
                (croppedURI)=>{
                    CameraRoll.saveToCameraRoll(croppedURI,'photo').done(function(data){
                        // ToastShort('保存图片成功',0);
                        Alert.alert('提示', '保存图片成功');
                    },function(err){
                        Alert.alert('提示', '您没有对此应用开放访问相册权限，无法保存！请先开放权限才能保存图片。');
                    });
                },
                (err)=>true
            );
        });
    }
  },

};

export default ImageSave;
