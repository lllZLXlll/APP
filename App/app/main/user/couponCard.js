/**
 * Created by wsl on 2017/02/16.
 */
'use strict';
import React, {Component} from 'react';
import {
  StyleSheet,
  View,
  Text,
  Image,
  TouchableOpacity,
  LayoutAnimation
} from 'react-native';
import {StyleConfig} from '../../style';
import NavigationBar from '../../components/NavigationBar';
import ScrollableTabView,{DefaultTabBar} from 'react-native-scrollable-tab-view';
import UseCoupon from './couponCardX';
import IsCoupon from './couponCardY';
import DeCoupon from './couponCardZ';
import Request from '../../utils/Request';
import { goBack } from '../../utils/NavigatorBack';
const oPx = StyleConfig.oPx;
export default class CouponCard extends Component{
  constructor(props){
    super(props);
    this.state = {
      cardTap:'1',
      title:'代金券',
      height:0,
      showChange:true,
      taste1:[],
      taste2:[],
      taste3:[],
      oData:[]
    }
  }
  componentWillMount() {
    // 创建动画
    LayoutAnimation.spring();
  }
  componentDidMount(){
    this._getData();
  }
  _getData(){
    Request.post('vocherAmts.do',{uid:''},(data)=>{
      let status='',money='';
      if(data.isUse==0 && data.experienceCash > 0){
        status = '1';
        money = data.experienceCash;
      }else if(data.isUse==1){
        status = '2';
        money = data.experienceCash;
      } else if(data.isUse==2){
        status = '3';
        money = data.experienceCash;
      }
      this.setState({taste1:data.mapList1,taste2:data.mapList2,taste3:[{usestatus:status,money:money}],oData:data.mapList1});
    },(error)=>{});
  }
  _goBack(){
    goBack(this.props.navigator);
  }
  loginOrRegist(){
    if(this.state.showChange){
      LayoutAnimation.spring();
      this.setState({height:270/oPx,showChange:!this.state.showChange})
    }else{
      this.setState({height:0,showChange:!this.state.showChange});
    };
  }
  _cardTap(index){
    if(this.state.cardTap == index)
      return;
    switch (index) {
      case 1:this.setState({cardTap:index,title:'代金券',oData:this.state.taste1,height:0,showChange:!this.state.showChange});
        break;
      case 2:this.setState({cardTap:index,title:'现金券',oData:this.state.taste2,height:0,showChange:!this.state.showChange});
        break;
      case 3:this.setState({cardTap:index,title:'体验金',oData:this.state.taste3,height:0,showChange:!this.state.showChange});
        break;
      default:this.setState({cardTap:index,title:'代金券',oData:this.state.taste1,height:0,showChange:!this.state.showChange});break;
    }
  }
  render(){
    return (
      <View style={{flex:1}}>
        <NavigationBar
          title={this.state.title}
          leftShowIcon={true}
          leftBtnFunc={this._goBack.bind(this)}
          rightDisplay={false}
          rightTitle={"全部"}
          rightBtnFunc={this.loginOrRegist.bind(this)}
        />
        <View style={{flex:1}}>
          <ScrollableTabView
            style={styles.scrollable}
            tabBarUnderlineStyle={styles.tabBarUnderlineStyle}
            tabBarTextStyle={styles.tabBarTextStyle}
            tabBarActiveTextColor={'#e5383e'}
            tabBarInactiveTextColor={'#333'}
            renderTabBar={() => <DefaultTabBar tabStyle={styles.tabStyle} style={styles.defaultBar}/>}
            >
            <UseCoupon tabLabel="未使用" navigator={this.props.navigator} data={this.state.oData} title={this.state.title} loading={true} changeCouponId={this.props.changeCouponId}/>
            <IsCoupon tabLabel="已使用" title={this.state.title} data={this.state.oData}/>
            <DeCoupon tabLabel="已过期" title={this.state.title} data={this.state.oData}/>
          </ScrollableTabView>
          <View style={[styles.tableView,{height:this.state.height}]}>
            <TouchableOpacity style={styles.tableViewItem} onPress={()=>this._cardTap(1)}>
              <Text>代金券</Text>
              {this.state.cardTap=='1'?<Image style={styles.choseImg} source={require('../../images/user/user_coupon_chose.png')}/>:null}
            </TouchableOpacity>
            <TouchableOpacity style={styles.tableViewItem} onPress={()=>this._cardTap(2)}>
              <Text>现金券</Text>
              {this.state.cardTap=='2'?<Image style={styles.choseImg} source={require('../../images/user/user_coupon_chose.png')}/>:null}
            </TouchableOpacity>
            <TouchableOpacity style={styles.tableViewItem} onPress={()=>this._cardTap(3)}>
              <Text>体验金</Text>
              {this.state.cardTap=='3'?<Image style={styles.choseImg} source={require('../../images/user/user_coupon_chose.png')}/>:null}
            </TouchableOpacity>
          </View>
      </View>
      </View>

    )
  }
}
const styles = StyleSheet.create({
  scrollable:{
    height:65/oPx,
    backgroundColor:'#e9ecf3'
  },
  defaultBar:{
    borderWidth:0,
    height:65/oPx,
    backgroundColor:'#fff',
  },
  tabStyle:{
    paddingBottom:0,
    height:65/oPx,
    borderWidth:0,
    backgroundColor:'#fff',
  },
  tabBarUnderlineStyle:{
    backgroundColor:'#e5383e',
    height:3/oPx,
  },
  tabBarTextStyle:{
    fontSize:28/oPx,
    fontWeight:'200'
  },
  tableView:{
    width:StyleConfig.screen_width,
    height:270/oPx,
    position:'absolute',
    top:0,
    left:0,
    zIndex:100,
    backgroundColor:'#fff',
    overflow:'hidden'
  },
  tableViewItem:{
    flex:1,
    borderBottomWidth:StyleConfig.borderWidth,
    borderBottomColor:'#e0e0e0',
    alignItems:'center',
    justifyContent:'center',
    overflow:'hidden'
  },
  tableViewItemText:{
    color:'#333',
    fontSize:28/oPx
  },
  choseImg:{
    width:42/oPx,
    height:27/oPx,
    position:'absolute',
    right:30/oPx,
  }
})
