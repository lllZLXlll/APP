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
import {ToastShort} from '../utils/Toast'
let oPx = StyleConfig.oPx;

// 临时图片数据
const imagesUri = 'https://www.pujinziben.com/upload/banner/2017/9/20170911083746952.jpg';

export default class CommentItem extends Component{
  constructor(props) {
    super(props);
  }

  _commentfabulous = () => {
    if (this.props.row.fabulous <= 0) {
      this.props._commentfabulous(this.props.row.id, this.props.index);
    } else {
      ToastShort('你已赞过', 300);
    }
    
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
            <View style={Styles.collectionBottomView}>
              <Text style={[Styles.textLeft, {color: '#999', fontSize: 24/oPx}]}>{this.props.row.commentDate}</Text>
            </View>
          </View>
          
          {
            this.props.row.fabulous > 0
            ?
            <TouchableOpacity 
              style={[Styles.itemTopRightView, {flexDirection: 'row', alignItems: 'center', justifyContent: 'flex-end',}]} 
              activeOpacity={1} onPress={this._commentfabulous}
            >
              <Image style={Styles.onClickIcon} source={Icons.praiseIcon_2} />
              <Text style={[Styles.onClickText, {color: '#ff8200', width: 80/oPx}]}>{this.props.row.fabulousCount}</Text>
            </TouchableOpacity>
            :
            <TouchableOpacity 
              style={[Styles.itemTopRightView, {flexDirection: 'row', alignItems: 'center', justifyContent: 'flex-end',}]} 
              activeOpacity={1} onPress={this._commentfabulous}
            >
              <Image style={Styles.onClickIcon} source={Icons.praiseIcon_1} />
              <Text style={[Styles.onClickText, {width: 80/oPx}]}>{this.props.row.fabulousCount}</Text>
            </TouchableOpacity>
          }    
        </View>    

        <View style={StyleComponent.itemCommentContentView}>
          <View style={StyleComponent.itemCommentImgView}>
            {/* 头像下面图片，暂时隐藏，现阶段并没有什么可放的 */}
            {/*<Image style={StyleComponent.itemCommentImg} source={{uri: imagesUri}} />*/}
          </View>
          
          <View style={StyleComponent.commentContentView}>
            {
              this.props.row.commentStage === 3
              ?
              <View style={StyleComponent.commentContentTopView}>
                <Text style={[Styles.textLeft, StyleComponent.commentContentText]}>
                  回复<Text style={[Styles.textLeft, StyleComponent.revertCommentText]}>{this.props.row.revertUserName}</Text>：
                  {this.props.row.commentContent}
                </Text>
                
              </View>
              :
              <View style={StyleComponent.commentContentTopView}>
                <Text style={[Styles.textLeft, StyleComponent.commentContentText]}>{this.props.row.commentContent}</Text>
              </View>
            }

            {
              this.props.row.revertCount > 0 && this.props.isShowReverCount
              ?
              <TouchableOpacity style={[Styles.topView, StyleComponent.commentContentBottomView]} onPress={() => this.props._toCommentDetails(this.props.row.id, JSON.stringify(this.props.row), this.props.index)}>
                <Text style={StyleComponent.commentRevert} numberOflines={1}>查看{this.props.row.revertCount}条回复</Text>
                <Image style={StyleComponent.commentArrow} source={Icons.arrow_1} />
              </TouchableOpacity>
              : 
              null
            }
            
          </View>
        </View>
      </View>
    )
 }
}
