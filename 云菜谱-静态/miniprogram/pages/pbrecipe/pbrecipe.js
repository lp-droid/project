// pages/pbrecipe/pbrecipe.js
import {
  add
} from '../../utils/db'
const db = wx.cloud.database()
const app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    sort: [],
    files: []
  },
  //页面加载调用type
  onLoad() {
    db.collection('type').get().then(res => {
      console.log(res.data);
      this.setData({
        sort: res.data
      })
    }).catch(err => {
      console.log(err);
    })
  },

  mySelect(e) {
    //拿到图片临时地址
    var arr = e.detail.tempFilePaths; //字符串数组
    var files = arr.map((item, index) => {
      return {
        url: item
      }
    })
    this.setData({
      files
    })
  },
  //提交表单
  async submit(e) {
    wx.showLoading({
      title: '正在提交',
    })
    var arr = []
    var formData = e.detail.value //表单信息
    this.data.files.forEach((item, index) => {
      var nowtime = new Date().getTime() + '-' + index
      var exe = item.url.split('.').pop()
      console.log(exe);
      var item = wx.cloud.uploadFile({
        filePath: item.url,
        cloudPath: nowtime + '.' + exe
      })
      arr.push(item)

    });
    // console.log(arr);
    var result = await Promise.all(arr).catch(err => {
      console.log(err);
    })
    // console.log(result);
    var images = result.map(item => {
      return item.fileID
    })
    var {
      avatarUrl,
      nickName
    } = app.globalData.userInfo
    formData.images = images
    formData.nickName = nickName
    formData.avatarUrl = avatarUrl
    formData.views = 0;
    formData.likes = 0;
    formData.addtime = new Date().getTime()
    console.log(formData);
    if (formData.name == "" || formData.typeid == "") {
      wx.showToast({
        title: '表单不完整',
        icon: "none"
      });
      return;
    }
    var result = add('menu', formData).catch(err => {
      console.log(err);
    })
    wx.hideLoading()
    wx.showToast({
      title: '提交成功',
    })
    setTimeout(res => {
      wx.navigateBack()
    }, 1500)
  


  }

})