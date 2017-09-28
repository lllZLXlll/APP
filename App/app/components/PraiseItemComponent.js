import React, { Component } from 'react';
import {
  View,
  Text,
  TouchableOpacity,
  Image,
} from 'react-native';

import Styles from '../style/user/userStyle';
import {StyleConfig} from '../style/style';
import Icons from './Icons';
let oPx = StyleConfig.oPx;

 export default class PraiseItemComponent extends Component{
  constructor(props) {
    super(props);
    this.state = {
      isClick: false,
    };
  }

  _getPraiseItem(row) {
         return <View style={Styles.FansTable}>
                  <View style={Styles.FansTableP}>
                      <TouchableOpacity activeOpacity={0.5}>
                          <Image style={Styles.fansPortraitImage} source={Icons.portrait} />
                      </TouchableOpacity>
                  </View>
                  <View style={Styles.FansTableC}>
                    <View style={{height: 70/oPx}}>
                        <View style={Styles.userNameView}>
                            <Text style={[Styles.textLeft, {color: '#333'}]}>
                                {row.userName}
                            </Text>
                        </View>
                        <View style={Styles.autographView}>
                            <Text style={[Styles.textLeft, {color: '#999', fontSize: 24/oPx}]} numberOfLines={1} >
                                {row.text}
                            </Text>
                        </View>
                      </View>
                  </View>

                  <View style={{justifyContent: 'center', marginRight: 30/oPx}} >
                      <TouchableOpacity activeOpacity={0.5} onPress={() => {this.setState({isClick: !this.state.isClick})}}>
                          {
                              this.state.isClick
                                  ?
                                  <Image style={Styles.attentionImage} source={Icons.attentioned}/>
                                  :
                                  <Image style={Styles.attentionImage} source={Icons.attention}/>
                          }
                      </TouchableOpacity>
                  </View>
              </View>;
    }

   render(){
      return (
        <View style={Styles.view}>
          { this._getPraiseItem(this.props.row) }
        </View>
     )
   }
 }
