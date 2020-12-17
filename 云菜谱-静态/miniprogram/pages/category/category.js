// pages/category/category.js
import {
  get,
  add,
  update,
  del
} from '../../utils/db.js'
Page({

  /**
   * 页面的初始数据
   */
  data: {
    isadd: false,
    isupdate: false,
    list: [],
    val: '',
    id: ''
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad() {
    this.getlist()
  },
  async getlist() {
    var gettype = await get('type').catch(err => {
      console.log(err);
    })
    this.setData({
      list: gettype.data
    })
  },
  showadd() {
    this.setData({
      isadd: true
    })
  },
  inputval(e) {
    this.data.val = e.detail.value
  },
  //添加
  async add() {
    var result = await add('type', {
      name: this.data.val
    }).catch(err => {
      console.log(err);
      return
    })
    this.getlist()
    this.setData({
      isadd: false
    })

  },
  //显示修改
  async showupdate(e) {
    console.log(e);

    this.data.id = e.currentTarget.id

    var name = e.currentTarget.dataset.name
    console.log(this.data.id);
    this.setData({
      isupdate: true,
      val: name
    })
  },
  async update() {
    var id = this.data.id
    var relust = await update('type', id, {
      name: this.data.val
    }).catch(err => {
      console.log(err);
    })
    this.getlist()
    this.setData({
      isupdate: false
    })
  },
  del(e) {
    wx.showModal({
      title: '温馨提示',
      content: '你确定要删除吗',
      success: res => {
        if (res.confirm) {
          var relust = del('type', e.currentTarget.id).catch(err => {
            console.log(err);
          })
          this.getlist()
        }
      }
    })
    console.log(e.currentTarget.id);

  }

})