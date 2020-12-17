// pages/detail/detail.js
const db = wx.cloud.database()
import {
  add,
  getbyId,
  get,
  del
} from '../../utils/db'
Page({

  /**
   * 页面的初始数据
   */
  data: {
    tag: false,
    detail: {}, //数据
    taglike: true
  },
  async onLoad(e) {
    // console.log(this.data.tag);
    var id = e.id
    //调取根据id查询menu列表点击进去浏览量量增加
    await db.collection("menu").doc(id).update({
      data: {
        views: db.command.inc(1)
      }
    })
    var openid = wx.getStorageSync('openid');
    // console.log(openid,id);
    var res = await get('likes', {
      menuid: id,
      _openid: openid
    }).catch(err => {
      console.log(err);
    })
    console.log(res);
    if (res.data.length <= 0) {
      this.setData({
        tag: false
      })
    } else {
      this.setData({
        tag: true
      })
    }
    var result = await getbyId('menu', id).catch(err => {
      console.log(err);
    })
    // console.log(result);
    this.setData({
      detail: result.data
    })
    wx.setNavigationBarTitle({
      title: result.data.name,
    })
  },
  async addlike() {
    if (!this.data.taglike) return
    this.data.taglike = false
    var id = this.data.detail._id
    var result = await add('likes', {
      menuid: id
    }).catch()
    console.log(result);
    this.setData({
      tag: true
    })

    await db.collection('menu').doc(id).update({
      data: {
        likes: db.command.inc(1)
      }
    }).catch(err => {
      console.log(err);
      return
    })
    this.data.detail.likes += 1
    this.setData({
      detail: this.data.detail,
      tag: true,
      taglike: true,
    })
  },
  //取消关注
  async dellikes() {
    if (!this.data.taglike) return
    this.data.taglike = false
    var openid = wx.getStorageSync('openid')
    var id = this.data.detail._id
    var result = await get('likes', {
      _openid: openid,
      menuid: id
    })
    console.log(result.data[0]._id);
    await db.collection('likes').doc(result.data[0]._id).remove().then(res => {
      console.log(res);
    })
    await db.collection('menu').doc(id).update({
      data: {
        likes: db.command.inc(-1)
      }
    }).catch(err => {
      console.log(err);
    })
    this.data.detail.likes -= 1
    this.setData({
      tag: false,
      taglike: true,
      detail: this.data.detail,
    })
  }
})