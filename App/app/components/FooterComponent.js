import React, { Component } from 'react';
import {
  View,
  Text,
  ActivityIndicator,
} from 'react-native';

import Styles from '../style/component/componentStyle';

 export default class FooterComponent extends Component{

   render(){
      return (
        <View style={Styles.footerView}>
          <View style={Styles.centerView}>
            <ActivityIndicator />
            <Text style={Styles.footerText}>拼命加载中...</Text>
          </View>
        </View>
     )
   }
 }
