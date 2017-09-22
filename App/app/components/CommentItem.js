/**
  帖子详情中评论item
*/
import React, { Component } from 'react';
import {
  View,
  Text,
  TouchableOpacity,
  Image
} from 'react-native';

import Icons from './Icons';
import Styles from '../style/user/userStyle';
import StyleComponent from '../style/component/componentStyle.js';
import {StyleConfig} from '../style/style';
let oPx = StyleConfig.oPx;

// 临时图片数据
const imagesUri = 'https://www.pujinziben.com/upload/banner/2017/9/20170911083746952.jpg';

export default class CommentItem extends Component{
  constructor(props) {
    super(props);
  }

  render(){
    return (
      <View style={[Styles.itemCommentView, StyleComponent.itemCommentView]}>
        <View style={[StyleComponent.topView]}>
          <Image style={Styles.portraitItem} source={{uri:this.props.row.portrait}} />
          <View style={Styles.collectionRightView}>
            <View style={[Styles.collectionTopView, {justifyContent: 'center'}]}>
              <Text style={[Styles.textLeft, {color: '#333'}]}>{this.props.row.userName}</Text>
            </View>
          </View>
          <View style={[Styles.itemTopRightView, {flexDirection: 'row', alignItems: 'center', justifyContent: 'flex-end',}]}>
            <TouchableOpacity activeOpacity={1} onPress={() => {alert(1)}}>
              <Image style={Styles.onClickIcon} source={Icons.praiseIcon_1} />
            </TouchableOpacity>
            <Text style={Styles.onClickText}>{this.props.row.fabulousCount}</Text>
          </View>
        </View>

        <View style={StyleComponent.itemCommentContentView}>
          <View style={StyleComponent.itemCommentImgView}>
            {/* 头像下面图片，暂时隐藏，现阶段并没有什么可放的 */}
            {/*<Image style={StyleComponent.itemCommentImg} source={{uri: imagesUri}} />*/}
          </View>
          
          <View style={StyleComponent.commentContentView}>
            <View style={StyleComponent.commentContentTopView}>
              <Text style={[Styles.textLeft, StyleComponent.commentContentText]} numberOflines={5}>{this.props.row.commentContent}</Text>
            </View>

            {
              this.props.row.revertCount > 0
              ?
              <View style={[Styles.topView, StyleComponent.commentContentBottomView]}>
                <Text style={StyleComponent.commentRevert} numberOflines={1}>查看{this.props.row.revertCount}条回复</Text>
                <Image style={StyleComponent.commentArrow} source={Icons.arrow_1} />
              </View>
              : 
              null
            }
            
          </View>
        </View>
      </View>
    )
 }
}
