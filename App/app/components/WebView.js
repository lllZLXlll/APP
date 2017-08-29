import React, { Component } from 'react';
import {
    View,
    StyleSheet,
    Image,
    ScrollView,
    WebView,
} from 'react-native';
import { StackNavigator } from 'react-navigation';

 export default class MyWebView extends Component{
   constructor(props){
     super(props);
     this.state={

     }
   }
   
   render(){
     return (
       <View style={{flex:1,backgroundColor:'#fff'}}>
         <WebView
             onError={()=>alert('error')}
             source={{uri: this.props.navigation.state.params.url}}
         />
       </View>
     )
   }
 }
