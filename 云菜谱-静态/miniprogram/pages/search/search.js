// pages/search/search.js
const db = wx.cloud.database()
import {
  get
} from '../../utils/db'
Page({

  /**
   * 页面的初始数据
   */
  data: {
    val: '',
    hotlist: [],
    recentList:[]
  },
  async onLoad() {
    //页面加载，获取访问量最高的9条记录
    var result = await get('menu', {}, 0, 9, {
      field: "views",
      sort: "desc"
    }, {
      name: true
    })
    console.log(result);
    this.setData({
      hotlist: result.data
    })

  },



  inpval(e) {
    this.data.val = e.detail.value
  },
  sear() {

    var keyword = this.data.val; //获取搜索的关键字
    //存储缓存
    var arr = wx.getStorageSync('recent') || []
    var index = arr.findIndex(item => {
      return item == keyword
    })
    if (index != -1) {
      arr.splice(index, 1)
    }
    arr.unshift(keyword)
    wx.setStorageSync('recent', arr)
    wx.navigateTo({
      url: '../list/list?keyword=' + keyword,
    })
  },
  //点击热门搜索带参数跳转list
  tolist(e) {
    wx.navigateTo({
      url: '../list/list?keyword=' + e.currentTarget.dataset.keyword,
    })
  },
  onShow() {
    var arr = wx.getStorageSync('recent')
    this.setData({
      recentList:arr
    })
  }

})