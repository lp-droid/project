// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
//引入css
import './assets/css/reset.css'
import './assets/css/public.css'
import './assets/font/iconfont.css'
//js
import './assets/js/remScale.js'
Vue.config.productionTip = false
//移动端vantui
import VantUI from 'vant'
import store from './store/index'
Vue.use(VantUI)
import 'vant/lib/index.css'

//在vue原型上挂载一个服务器地址
Vue.prototype.$imgUrl = 'http://localhost:3000'
/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  components: { App },
  template: '<App/>'
})
