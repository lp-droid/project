import {
  get
} from '../../utils/db'
import {getpage} from '../../utils/tools'
// pages/my/my.js
import {
  getStar
} from '../../utils/tools'
const app = getApp()

const db = wx.cloud.database()
Page({


  /**
   * 页面的初始数据
   */
  data: {
    page:0,
    pagesize:10,
    userInfo: [],
    nav: ['菜单', '分类', '关注'],
    isLogin: false, //是否登录。 false 未登录  true，已经登录
    recipes: [
      // {
      //   recipeName: "烤苏格兰蛋",
      //   src: "../../imgs/1.jpg"
      // },
      // {
      //   recipeName: "法国甜点",
      //   src: "../../imgs/2.jpg"
      // },
      // {
      //   recipeName: "法式蓝带芝心猪排",
      //   src: "../../imgs/3.jpg"
      // },
      // {
      //   recipeName: "菠萝煎牛肉扒",
      //   src: "../../imgs/4.jpg"
      // },
      // {
      //   recipeName: "快手营养三明治",
      //   src: "../../imgs/5.jpg"
      // },
      // {
      //   recipeName: "顶级菲力牛排",
      //   src: "../../imgs/6.jpg"
      // }
    ],
    types: [],
    lists: [{
        src: "../../static/list/list01.jpg",
        name: "土豆小番茄披萨",
        userInfo: {
          nickName: "林总小图",
          pic: "../../static/list/users.png"
        },
        views: 999,
        follow: 100
      },
      {
        src: "../../static/list/list02.jpg",
        name: "草莓巧克力三明治",
        userInfo: {
          nickName: "林总小图",
          pic: "../../static/list/users.png"
        },
        views: 88,
        follow: 200
      },
      {
        src: "../../static/list/list03.jpg",
        name: "法师意大利面",
        userInfo: {
          nickName: "林总小图",
          pic: "../../static/list/users.png"
        },
        views: 999,
        follow: 100
      },
      {
        src: "../../static/list/list04.jpg",
        name: "自制拉花",
        userInfo: {
          nickName: "林总小图",
          pic: "../../static/list/users.png"
        },
        views: 999,
        follow: 100
      },
      {
        src: "../../static/list/list05.jpg",
        name: "营养早餐",
        userInfo: {
          nickName: "林总小图",
          pic: "../../static/list/users.png"
        },
        views: 999,
        follow: 100
      }
    ],
    indexId: 0
  },
  _delStyle() {
    wx.showModal({
      title: "删除提示",
      content: "确定要删除么？",

    })
  },
  async onLoad() {
    //关注
    let openid = wx.getStorageSync('openid')
    var menuid = await get('likes', {
      _openid: openid
    }).catch(err => {
      console.log(err);
    })
    var menuId = menuid.data.map(item => {
      return item.menuid
    })
    console.log(menuId);
    db.collection('menu').where({
      _id: db.command.in(menuId)
    }).get().then(res => {
      res.data.forEach(item => {
        item.star = getStar(item.views)
      });
      this.setData({
        lists: res.data
      })
    })
    //页面加载，获取用户信息
    var userInfo = app.globalData.userInfo
    if (app.globalData.userInfo == null) {

      app.getuser = res => {
        this.setData({
          userInfo: res.userInfo,
          isLogin: true
        })
      }
    } else {
      this.setData({
        isLogin: true,
        userInfo
      })
    }
    this.getmenulist() //菜单
    this.gettypelist() //分类
  },
  //我的菜单
  async getmenulist() {
    var openid = wx.getStorageSync('openid')
    var result = await get('menu', {
      _openid: openid
    })
    console.log(result);
    this.setData({
      recipes: result.data
    })
  },
  //分类
  async gettypelist() {
    var openid = wx.getStorageSync('openid')
    var relust = await get('type', {
      _openid: openid
    }).catch(err => {
      console.log(err);
    })
    console.log(relust);
    this.setData({
      types: relust.data
    })
  },
onReachBottom(){
  this.data.page += 1
  let {
      page,
      pagesize
  } = this.data
  this.getpage(page, pagesize)
},
async getpage(page, pagesize) {
  var openid =wx.getStorageSync('openid')
  var skip = (page - 1) * pagesize
  var result = await get('menu', {_openid:openid}, skip, pagesize).catch(err => {
      console.log(err);
  })
  console.log(result);
  this.setData({
      recipes: this.data.recipes.concat(result.data)
  })
},
 async onShow() {
    this.getmenulist()
    this.gettypelist()
    let openid = wx.getStorageSync('openid')
    var menuid = await get('likes', {
      _openid: openid
    }).catch(err => {
      console.log(err);
    })
    var menuId = menuid.data.map(item => {
      return item.menuid
    })
    console.log(menuId);
    db.collection('menu').where({
      _id: db.command.in(menuId)
    }).get().then(res => {
      res.data.forEach(item => {
        item.star = getStar(item.views)
      });
      this.setData({
        lists: res.data
      })
    })

  },
  //登录
  login(e) {
    //获取到的userInfo，赋值给app.js下的全局变量
    if (e.detail.userInfo == undefined) {
      this.setData({
        isLogin: false
      })
    } else {
      var userInfo = e.detail.userInfo

      this.setData({
        isLogin: true,
        userInfo: userInfo
      })
    }
  },
  //跳转pbrecipe
  pbrecipe() {
    wx.navigateTo({
      url: '../pbrecipe/pbrecipe',

    })
  },
  navclick(e) {
    var id = e.currentTarget.id
    this.setData({
      indexId: id
    })
  },
  //跳转列表
  tolist(e) {
    console.log(e.currentTarget.id);
    wx.navigateTo({
      url: '../list/list?id=' + e.currentTarget.id,
    })
  },
  todatil(e) {
    wx.navigateTo({
      url: '../detail/detail?id=' + e.currentTarget.id,
    })
  }
})