// pages/type/type.js
const db=wx.cloud.database()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    types:[
      // {typename:"营养菜谱",'src':"../../static/type/type01.jpg"},
      // {typename:"儿童菜谱",'src':"../../static/type/type02.jpg"},
      // {typename:"家常菜谱",'src':"../../static/type/type03.jpg"},
      // {typename:"主食菜谱",'src':"../../static/type/type04.jpg"},
      // {typename:"西餐菜谱",'src':"../../static/type/type05.jpg"},
      // {typename:"早餐菜谱",'src':"../../static/type/type06.jpg"},
    ]
  },
  onLoad(){
db.collection('type').get().then(res=>{
  console.log(res);
  this.setData({
    types:res.data
  })
})
  },
 tolist(e){
wx.navigateTo({
  url: '../list/list?id='+e.currentTarget.id,
})
 }
})