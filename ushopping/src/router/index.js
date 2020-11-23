import Vue from 'vue'
import Router from 'vue-router'
import index from '../components/views/index'
//购物车
import cart from '../components/pages/cart'
//首页
import home from '../components/pages/home'
import mine from '../components/pages/mine'
import login from '../components/views/login'
import register from '../components/views/register'
import list from '../components/views/list'
import detail from '../components/views/detail'
import order from '../components/pages/orderConfirm'
import sort from '../components/pages/sort'
Vue.use(Router)
const router = new Router({
  routes: [
    {
      path: '/index',
      component: index,
      children: [
        {
          path: '/order',
          component: order
        },
        {
          path: '/home',
          component: home,
          name: '首页'
        },
        {
          path: '/cart',
          component: cart,
          name: '购物车'
        },
        {
          path: '/mine',
          component: mine
          ,
          name: '个人中心'
        },
        {
          path: '',
          redirect: '/home'
        }

      ]
    },
    {
      path: '/login',
      component: login
      ,
      name: '登录'
    },
    {
      path: '/register',
      component: register
      ,
      name: '注册'
    },
    {
      path: '/list',
      component: list
      ,
      name: '列表'
    },
    {
      path: '/sort',
      component: sort
      ,
      name: '分类'
    },

    {
      path: '/detail',
      component: detail
      ,
      name: '详情'
    },
    {
      path: '*',
      redirect: '/index'
    }
  ]
})
export default router
