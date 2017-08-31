import React, { Component } from 'react';
import {
    Modal,

} from 'react-native';
// 照片浏览组件
import ImageViewer from 'react-native-image-zoom-viewer';
import ImageSave from './ImageSave';

 export default class MyImageViewer extends Component{
   constructor(props){
     super(props);
     this.state={

     }
   }
   
  _onRequestClose() {

  }

   render(){
      return (
        <Modal style={{flex: 1}} 
            animationType="slide"
            visible={this.props.visible}
            onRequestClose={() => {this._onRequestClose()}} // android必须实现
          >
          <ImageViewer
                imageUrls={this.props.imageUrls} // 照片路径
                enableImageZoom={true} // 是否开启手势缩放
                index={this.props.index} // 初始显示第几张
                onClick={this.props.onClick} // 图片单击事件
                onSave={(url) => {
                  ImageSave.Save(url); // 图片保存
                }}
            />
        </Modal>
     )
   }
 }
