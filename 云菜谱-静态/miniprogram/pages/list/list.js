// pages/list/list.js
import {
  get
} from '../../utils/db'
const db = wx.cloud.database()
import {getStar} from '../../utils/tools'
Page({

  /**
   * 页面的初始数据
   */
  data: {
    lists: [],

  },
  async onLoad(e) {
  // 搜索
    if (e.keyword == undefined) {
      var relust = await get('menu', {
        recipeTypeid: e.id
      }).catch(err => {
        console.log(err);
      })
      //星星
      relust.data.forEach(item=>{
        return  item.star= getStar(item.views)
      })
     
      this.setData({
        lists: relust.data
      })
    } else {
      var relust = await db.collection('menu').where({
        //name字段
        name: db.RegExp({
          regexp: e.keyword,
          options: 'i',
        })
      }).get()
    }
    relust.data.forEach(item=>{
      return  item.star= getStar(item.views)
    })
   
    this.setData({
      lists: relust.data
    })


  },
  todatil(e) {
    wx.navigateTo({
      url: '../detail/detail?id=' + e.currentTarget.id,
    })
  }

})