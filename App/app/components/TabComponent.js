import React, { Component } from 'react';
import {
  View,
  Text,
  TouchableOpacity,
} from 'react-native';

import Styles from '../style/user/userStyle';
import {StyleConfig} from '../style/style';
let oPx = StyleConfig.oPx;

 export default class TabComponent extends Component{
  constructor(props) {
    super(props);
  }

  _getTabComponent(row, index) {
    return  <View style={Styles.itemTabView} key={index}>
              <TouchableOpacity activeOpacity={1} onPress={() => {this.props._setIsSelect(index)}}>
                <View style={Styles.tabTextView}>
                  {
                    this.props.isSelect == index
                    ? 
                    <Text style={[Styles.itemTabText, {color: '#ff8200',}]} numberOfLines={1}>{row.tabTitle}</Text>
                    : 
                    <Text style={Styles.itemTabText} numberOfLines={1}>{row.tabTitle}</Text>
                  }
                </View>
              </TouchableOpacity>
            </View>;
  }

   render(){
      return (
        <View style={Styles.tabView}>
          { 
            this.props.tabTitleMap.map((row, index) => {
              return  this._getTabComponent(row, index);
            })
          }
        </View>
     )
   }
 }
