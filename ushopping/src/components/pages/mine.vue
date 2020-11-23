<template>
  <div>
    <div class="page">
      <!-- header头部 -->
      <div class="userInfo" v-if="info">
        <van-image
          round
          width="2.4rem"
          height="2.4rem"
          src="https://img.yzcdn.cn/vant/cat.jpeg"
        />
        <van-cell>{{ info.nickname }}</van-cell>
        <van-button type="primary" @click="quit">退出登录</van-button>
        <!-- icons -->
        <div class="icons">
          <a href="#">
            <img src="../../assets/images/iconMine_1.jpg" alt="iconMine_1" />
            <p>全部订单</p>
          </a>
          <a href="#">
            <img src="../../assets/images/iconMine_2.jpg" alt="iconMine_1" />
            <p>待付款</p>
          </a>
          <a href="#">
            <img src="../../assets/images/iconMine_3.jpg" alt="iconMine_1" />
            <p>待收货</p>
          </a>
        </div>
        <!-- manageArea -->
        <ul class="manageArea">
          <li class="address">
            <a href="#">地址管理</a>
          </li>
          <li class="wallet">
            <a href="#">我的钱包</a>
          </li>
          <li class="coupon">
            <a href="#">我的优惠券</a>
          </li>
          <li class="erweima">
            <a href="#">我的二维码</a>
          </li>
          <li class="friends">
            <a href="#">我的小伙伴</a>
          </li>
        </ul>
      </div>
      <div class="userInfo" v-else>
        <van-image
          round
          width="2.4rem"
          height="2.4rem"
          src="https://img.yzcdn.cn/vant/cat.jpeg"
        />
        <van-cell>xxx</van-cell>
        <van-button type="primary" @click="login">未登录，请登录</van-button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      info: [],
    };
  },
  mounted() {
    this.info = sessionStorage.getItem("userInfo")
      ? JSON.parse(sessionStorage.getItem("userInfo"))
      : "";
  },
  methods: {
    login() {
      this.$router.push("/login");
    },
    quit() {
      sessionStorage.removeItem("userInfo");
      this.$router.push("/login");
    },
  },
};
</script>

<style lang="" scoped>
@charset "utf-8";
/* 包裹盒 */
.page {
  max-width: 7.5rem;
  margin: 0 auto;
}
.userInfo {
  margin: 10px;
  text-align: center;
}
.van-cell__value {
  text-align: center;
}
.footer {
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
.footer a img {
  width: auto;
  height: 0.53rem;
}
.footer a p {
  font: 0.2rem/0.42rem "微软雅黑";
  color: #929292;
}
.footer .active p {
  color: #ff5a05;
}
body {
  background: #f1f1f1;
}
.headCon {
  display: flex;
  justify-content: space-between;
  height: 0.88rem;
  background: #f26b11;
  align-items: center;
  padding: 0.4rem 0.28rem 0 0.35rem;
}
.headCon .back img {
  width: auto;
  height: 0.29rem;
}
.headCon h2 {
  font: 0.35rem/0.88rem "微软雅黑";
  color: #fff;
}
.headCon .menu span {
  background: #fff;
}
.userArea {
  display: flex;
  justify-content: space-between;
  height: 2.06rem;
  align-items: center;
  background: #f26b11;
  padding: 0 0.38rem 0 0.32rem;
}
.userArea .mine {
  width: 2.35rem;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.userArea .mine .minePic {
  display: block;
  width: 1.42rem;
  height: 1.42rem;
  border-radius: 50%;
  border: 0.05rem solid #fff;
  background: #822e02 url(../../assets/images/mine.png) no-repeat center;
  background-size: 1.3rem 1.36rem;
}
.userArea .mine .nameAndLevel .name {
  display: block;
  font: 0.3rem/0.51rem "微软雅黑";
  color: #fff;
}
.userArea .mine .nameAndLevel .level {
  display: block;
  font: 0.28rem/0.43rem "微软雅黑";
  color: #271217;
}
.userArea .register {
  display: block;
  width: 1.59rem;
  height: 0.71rem;
  text-align: center;
  font: 0.26rem/0.71rem "微软雅黑";
  color: #f26a12;
  background: #fff;
  border-radius: 0.04rem;
}
.icons {
  background: #fff;
  padding: 0 0.65rem 0 0.51rem;
  height: 1.42rem;
  margin-bottom: 0.21rem;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.icons a {
  display: block;
  text-align: center;
}
.icons a img {
  height: 0.34rem;
  width: auto;
}
.icons a p {
  font: 0.24rem/0.61rem "微软雅黑";
  color: #616161;
}
.manageArea {
  background: #fff;
  padding-bottom: 1.35rem;
  margin-bottom: 1.2rem;
}
.manageArea li {
  position: relative;
  background: url(../../assets/images/iconMine_4.jpg) no-repeat 0.35rem center;
  background-size: 0.36rem 0.4rem;
  border-bottom: 1px solid #d9d9d9;
}
.manageArea li a {
  display: block;
  font: 0.26rem/1.11rem "微软雅黑";
  color: #5c5c5c;
  text-indent: 0.94rem;
}
.manageArea li::after {
  position: absolute;
  right: 0.35rem;
  top: 0.45rem;
  content: "";
  width: 0.19rem;
  height: 0.26rem;
  background: url(../../assets/images/arrowRight.jpg) no-repeat center;
  background-size: 0.19rem 0.26rem;
}
.manageArea .wallet {
  background: url(../../assets/images/iconMine_5.jpg) no-repeat 0.35rem center;
  background-size: 0.36rem 0.36rem;
}
.manageArea .coupon {
  background: url(../../assets/images/iconMine_6.jpg) no-repeat 0.28rem center;
  background-size: 0.46rem 0.32rem;
}
.manageArea .erweima {
  background: url(../../assets/images/iconMine_7.jpg) no-repeat 0.35rem center;
  background-size: 0.36rem 0.34rem;
}
.manageArea .friends {
  background: url(../../assets/images/iconMine_8.jpg) no-repeat 0.33rem center;
  background-size: 0.38rem 0.36rem;
}
</style>
