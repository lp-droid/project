<template>
  <div>
    <div class="footer">
      <router-link to="/home" activeClass="active">
        <a href="javascript:;">
          <span class="iconfont icon-shouye"></span>
          <p>首页</p>
        </a>
      </router-link>

      <router-link to="cart" activeClass="active">
        <a href="javascript:;">
          <span class="iconfont icon-gouwuche"></span>
          <!-- <img src="../../assets/images/iconCart.jpg" alt="iconIndex" /> -->
          <p>购物车</p>
        </a>
      </router-link>

      <router-link to="mine" activeClass="active">
        <a href="javascript:;">
          <span class="iconfont icon-wode"></span>
          <p>我的</p>
        </a>
      </router-link>
    </div>

    <router-view />
  </div>
</template>

<script>
export default {
  data() {
    return {};
  },
};
</script>

<style lang="" scoped>
[v-cloak] {
  display: none;
}

.footer {
  z-index: 1000000;
  position: fixed;
  left: 0;
  bottom: 0;
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100%;
  box-sizing: border-box;
  height: 1.2rem;
  padding: 0 0.5rem;
  background: #fff;
  border-top: 1px solid #ebebeb;
}
.footer a {
  display: block;
  text-align: center;
}
.footer a span {
  color: #929292;
  font-size: 0.53rem;
  width: auto;
  height: 0.53rem;
}
.footer a p {
  font: 0.2rem/0.42rem "微软雅黑";
  color: #929292;
}
.footer .active p,
.footer .active span {
  color: #ff5a05;
}
body {
  background: #f1f1f1;
}
</style>
