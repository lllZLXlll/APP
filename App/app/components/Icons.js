/**
	图片地址类，所有用到过的图片地址写在这里，直接在外部应用即可。
*/


let Icons = [];

// -------------首页-------------begin
Icons.addImage = require('../images/icon/home/icon_home_addImage.png');
Icons.delImage = require('../images/icon/home/icon_home_delImage.png');

// -------------首页-------------end


// -------------我的-------------begin
// 我的信息
// 头像
Icons.portrait = require('../images/icon/user/icon_user_portrait.png');
// 箭头图标
Icons.arrow = require('../images/icon/user/icon_user_arrow.png');
// 箭头图标灰色
Icons.arrow_1 = require('../images/icon/user/icon_user_arrow_1.png');

// 发帖:
// 未点赞
Icons.praiseIcon_1 = require('../images/icon/user/icon_user_praise_1.png');
// 已点赞
Icons.praiseIcon_2 = require('../images/icon/user/icon_user_praise_2.png');
// 未踩
Icons.downIcon_1 = require('../images/icon/user/icon_user_down_1.png');
// 已踩
Icons.downIcon_2 = require('../images/icon/user/icon_user_down_2.png');
// 消息
Icons.msgIcon = require('../images/icon/user/icon_user_comments.png');
// 编辑未选中
Icons.selectIcon_1 = require('../images/icon/user/icon_user_del.png');
// 编辑选中
Icons.selectIcon_2 = require('../images/icon/user/icon_user_del_select.png');
// 阴影背景
Icons.background = require('../images/icon/user/icon_user_background.png');
// 评论图片
Icons.commentImg = require('../images/icon/user/icon_user_image.png');
// 挂件图片
Icons.pendantImage = require('../images/icon/user/icon_user_img.png');
//关注
Icons.attention = require('../images/icon/common/icon_msg_gz.png');
//已关注
Icons.attentioned = require('../images/icon/common/icon_msg_ygz.png');
//设置
Icons.set = require('../images/icon/user/icon_user_set.png');
//粉丝关注
Icons.fansAttention = require('../images/icon/message/msg_03.png');
//评论回复
Icons.Reply = require('../images/icon/message/msg_1_03.png');
//系统消息
Icons.systemMessage = require('../images/icon/message/msg_2_07.png');
//喇叭
Icons.trumpet = require('../images/icon/message/trumpet.png');
//消息提示
Icons.message = require('../images/icon/message/msgShow.png');
//聊天窗口背景
Icons.windowBackGround = require('../images/icon/user/background.jpg');
// -------------我的-------------end

// -------------登录-------------begin
// QQ
Icons.qq = require('../images/icon/login/icon_qq.png');
// Qzone
Icons.qzone = require('../images/icon/login/icon_qzone.png');
// wechat
Icons.wechat = require('../images/icon/login/icon_wechat.png');
// wechats
Icons.wechats = require('../images/icon/login/icon_wechats.png');
// weibo
Icons.weibo = require('../images/icon/login/icon_weibo.png');
// loginBg
Icons.loginBg = require('../images/icon/login/icon_loginBg.png');

// -------------登录-------------end








 export default Icons;