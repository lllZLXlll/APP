/**
 * Created by wsl on 2017/03/28.
 * ##实时数据
 */
 'use strict';
 import React, {Component} from 'react';
 import {
   StyleSheet,
   View,
   Text,
   Image,
   Dimensions,
   ScrollView
 } from 'react-native';
 import {StyleConfig} from '../../style';
 import LinearGradient from 'react-native-linear-gradient';
 import Request from '../../utils/Request';
 import Utils from '../../utils/utils';
 let oPx = StyleConfig.oPx;
 const screenWidth = Dimensions.get('window').width;
class DashLine extends Component{
    render(){
        var len = Math.ceil(screenWidth/4 - 60/oPx);
        var arr = [];
        for(let i=0; i<len; i++){
            arr.push(i);
        }

        return <View style={styles.dashLine}>
            {
                arr.map((item, index)=>{
                    return <Text style={styles.dashItem} key={'dash'+index}> </Text>
                })
            }
        </View>
    }
}
 export default class RealtimeInformation extends Component {
   constructor(props){
     super(props);
     this.state = {
     	investAmount:0.0,
     	dealNumber:0,
     	repayAmount:0,
     	unRepayAmount:0,
     	hasInterest:0,
     	userTotal:0,
     	investorCount:0,
     	avgUserInvest:0,
     	avgInvest:0
     }
   }
   componentDidMount(){
   	this.getData();
   }
   getData(){
   	Request.post('informationRevealed.do',{uid:''},(data)=>{
   	  if(data.error == '0'){
   	  	console.log(data)
   	  	this.setState(data)
   	  }else{
   	  	alert(data.msg);
   	  }
   	})
   }
   render(){
     return (
       <View style={styles.container}>
         <ScrollView >
         	<LinearGradient 
         	start={{x: 0.0, y: 0.0}} end={{x: 1.0, y: 0.0}}
         	colors={['#2f74d1', '#b872fe']} style={styles.top}>
         	<Image style={styles.icon_top} source={require('../../images/find/icon_realtime_top.png')}/>
         	<View style={styles.top_container}>
         		<Text style={styles.topText}>撮合交易总额（元）</Text>
         		<Text style={styles.operateText}>{Utils.formatCurrency(this.state.investAmount)}</Text>
         	</View>
	        </LinearGradient>
	        <View style={styles.viewItems}>
	        	<View style={styles.itemLeft}>
	        		<Text style={styles.itemText}>交易笔数（笔）</Text>
	        		<Text style={styles.itemText}>{this.state.dealNumber}</Text>
	        	</View>
	        	<View style={styles.itemLine}></View>
	        	<View style={styles.itemRight}>
	        		<Text style={styles.itemText}>已还本金（元）</Text>
	        		<Text style={styles.itemText}>{Utils.formatCurrency(this.state.repayAmount)}</Text>
	        	</View>
	        </View>
	        <DashLine/>
	        <View style={styles.viewItems}>
	        	<View style={styles.itemLeft}>
	        		<Text style={styles.itemText}>待还本金（元）</Text>
	        		<Text style={styles.itemText}>{Utils.formatCurrency(this.state.unRepayAmount)}</Text>
	        	</View>
	        	<View style={styles.itemLine}></View>
	        	<View style={styles.itemRight}>
	        		<Text style={styles.itemText}>为用户创造的收益（元）</Text>
	        		<Text style={styles.itemText}>{Utils.formatCurrency(this.state.hasInterest)}</Text>
	        	</View>
	        </View>
	        <DashLine/>
	        <View style={styles.viewItems}>
	        	<View style={styles.itemLeft}>
	        		<Text style={styles.itemText}>注册用户数（人）</Text>
	        		<Text style={styles.itemText}>{this.state.userTotal}</Text>
	        	</View>
	        	<View style={styles.itemLine}></View>
	        	<View style={styles.itemRight}>
	        		<Text style={styles.itemText}>出借人数量（人）</Text>
	        		<Text style={styles.itemText}>{this.state.investorCount}</Text>
	        	</View>
	        </View>
	        <DashLine/>
	        <View style={styles.viewItems}>
	        	<View style={styles.itemLeft}>
	        		<Text style={styles.itemText}>人均累计投资金额（元）</Text>
	        		<Text style={styles.itemText}>{Utils.formatCurrency(this.state.avgUserInvest)}</Text>
	        	</View>
	        	<View style={styles.itemLine}></View>
	        	<View style={styles.itemRight}>
	        		<Text style={styles.itemText}>笔均投资额（元）</Text>
	        		<Text style={styles.itemText}>{Utils.formatCurrency(this.state.avgInvest)}</Text>
	        	</View>
	        </View>
         </ScrollView>
       </View>
     );
   }
 }
 const styles = StyleSheet.create({
 	dashLine: {
        flexDirection: 'row',
    },
    dashItem: {
        height:StyleConfig.borderWidth,
        width:4,
        marginRight:2,
        flex:1,
        backgroundColor: '#ccc',
    },
 	container:{
 		flex:1,
 		marginTop:16/oPx,
 		backgroundColor:'#fff',
 		paddingLeft:30/oPx,
 		paddingRight:30/oPx,
 	},
 	top:{
 		marginTop:40/oPx,
 		flex:1,
 		height:160/oPx,
 		borderRadius:80/oPx,
 		flexDirection:'row',
 		alignItems:'center',
 		marginBottom:10/oPx
 	},
 	icon_top:{
 		width:136/oPx,
 		height:136/oPx,
 		marginLeft:12/oPx
 	},
 	top_container:{
 		flex:1,
 		height:136/oPx,
 		backgroundColor:'transparent',
 		marginLeft:24/oPx,
 	},
 	topText:{
 		fontSize:28/oPx,
 		color:'#fff',
 		marginTop:18/oPx

 	},
 	operateText:{
 		fontSize:60/oPx,
 		color:'#fff',
 	},
 	viewItems:{
 		height:190/oPx,
 		flexDirection:'row',
 		alignItems:'center'
 	},
 	itemLeft:{
 		flex:1,
 		height:100/oPx,
 		justifyContent:'center'
 	},
 	itemRight:{
 		flex:1,
 		height:100/oPx,
 		justifyContent:'center'
 	},
 	itemLine:{
 		width:1/oPx,
 		height:100/oPx,
 		backgroundColor:'#ccc'
 	},
 	itemText:{
 		fontSize:28/oPx,
 		color:'#777',
 		marginTop:10/oPx,
 		textAlign:'center'
 	}
 })