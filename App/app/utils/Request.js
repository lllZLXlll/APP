/**
 * 请求组件 2017/08/24
 */

let HOST = 'http://192.168.1.132/app/';

let Request = {
   post : async (url,data,successCallback,failCallback) => {
      fetch(HOST + '' + url,{
        method: 'POST',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body:JSON.stringify(data)
      })
      .then((response) => response.json())
      .then((responseData) => {
          successCallback(responseData);
      })
      .catch((error) => {
        if(failCallback)
          failCallback(error);
      });
    

  },
  get:(url,data,successCallback,failCallback) =>{
    fetch(url,{
      method: 'GET',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
    })
    .then((response) => response.json())
    .then((responseData) => {
        successCallback(responseData);
    })
    .catch((error) => {
        failCallback(error);
    });
  },
}

export default Request;
