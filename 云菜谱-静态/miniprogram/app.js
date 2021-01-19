//app.js
App({

  onLaunch: function () {
  
      wx.getSetting({
        success: res => {
          // 用户已经授权了
          if (res.authSetting['scope.userInfo']) {
            wx.getUserInfo({
              success: res => {
                this.globalData.userInfo = res.userInfo
                if (this.getuser) {
                  this.getuser(res)
                }
              }
            })
          }
        }
      })
    if (!wx.cloud) {
      console.error('请使用 2.2.3 或以上的基础库以使用云能力')
    } else {
      wx.cloud.init({
        // env 参数说明：
        //   env 参数决定接下来小程序发起的云开发调用（wx.cloud.xxx）会默认请求到哪个云环境的资源
        //   此处请填入环境 ID, 环境 ID 可打开云控制台查看
        //   如不填则使用默认环境（第一个创建的环境）
        env: 'test-3g04c3e4af6b8a92',
        traceUser: true,
      })
    }
    //小程序初始化的时候，获取到openid，存储到本地缓存
    wx.cloud.callFunction({
      name: 'login',
      success: res => {
        wx.setStorageSync('openid',res.result.openid)
      }
    })


  },
  globalData: {
    userInfo: null
  }
})