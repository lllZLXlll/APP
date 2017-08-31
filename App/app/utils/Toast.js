/**
 * 原生消息提示框
 */

 import Toast from 'react-native-root-toast';

 let toast;

 export const ToastShort = (content,position) => {
   if (toast !== undefined) {
     Toast.hide(toast);
   }
   toast = Toast.show(content.toString(), {
     duration: Toast.durations.SHORT,
     position: !position?Toast.positions.BOTTOM:position,
     shadow: true,
     animation: true,
     hideOnPress: true,
     delay: 50
   });
 };

 export const ToastLong = (content,position) => {
   if (toast !== undefined) {
     Toast.hide(toast);
   }
   toast = Toast.show(content.toString(), {
     duration: Toast.durations.LONG,
     position: !position?Toast.positions.BOTTOM:position,
     shadow: true,
     animation: true,
     hideOnPress: true,
     delay: 50
   });
 };
