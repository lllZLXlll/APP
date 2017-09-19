import React, { Component } from 'react';
import {
  View,
  Text,
  ActivityIndicator,
} from 'react-native';

import Styles from '../style/component/componentStyle';

 export default class FooterComponent extends Component{

   render(){
      if (this.props.isData) {
        return (
          <View style={Styles.footerView}>
            <View style={Styles.centerView}>
              <ActivityIndicator />
              <Text style={Styles.footerText}>拼命加载中...</Text>
            </View>
          </View>
       )
     } else {
        return (
            <View style={Styles.footerView}>
              <View style={Styles.centerView}>
                <View style={Styles.threadView}></View>
                <Text style={[Styles.footerText, {flex: 1}]}>这就是我的底线</Text>
                <View style={Styles.threadView}></View>
              </View>
            </View>
         )
     }
  }
 }
