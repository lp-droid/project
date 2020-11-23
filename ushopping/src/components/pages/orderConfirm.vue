<template>
  <div>
    <div class="page">
      <!-- header头部 -->
      <header class="headCon">
        <a href="#" class="back"
          ><img src="../../assets/images/arrowLeft (2).jpg" alt=""
        /></a>
        <h2>确认订单</h2>
        <div class="menu">
          <span></span>
          <span></span>
          <span></span>
        </div>
      </header>
      <!-- 收件人信息 -->
      <div class="consigneeInfo">
        <p class="userInfo">
          收货人：YouSu
          <span class="num">10000000000</span>
        </p>
        <p class="addrInfo">
          收货地址：<span class="address"
            >北京市海淀区隐牷路清林苑6号楼中公优就业总部3层</span
          >
        </p>
      </div>
      <!-- 订单信息 -->
      <div class="orderInfo">
        <div class="goodInfo">
          <div class="left">
            <a href="#" class="goodPic"
              ><img src="../../assets/images/shop_4.jpg" alt="shop_4"
            /></a>
            <div class="good">
              <a href="#" class="goodName">雅诗兰黛护肤霜</a>
              <p>规格：50g</p>
            </div>
          </div>
          <p class="price">&yen;123.00</p>
        </div>
        <div class="numInfo">
          <p class="txt">购买数量</p>
          <p class="square">
            <span class="addOrDesc">-</span>
            <input type="text" placeholder="1" />
            <span class="addOrDesc">+</span>
          </p>
        </div>
        <div class="deliver">
          <p>配送方式</p>
          <p>xx快递</p>
        </div>
      </div>
      <!-- 优惠信息 -->
      <div class="discount">
        <div class="coupon">
          <p>优惠券</p>
          <p>无可用</p>
        </div>
        <div class="bounds">
          <p>使用积分</p>
          <div>
            <input type="text" placeholder="输入积分" />
            <a href="#">使用</a>
            <p>可用<span>50</span>积分</p>
          </div>
        </div>
      </div>
      <!-- 汇总信息 -->
      <div class="allInfo">
        <ul>
          <li>
            <p class="txt">商品金额</p>
            <p class="number">&yen;123.00</p>
          </li>
          <li>
            <p class="txt">运费</p>
            <p class="number">+&yen;0.00</p>
          </li>
          <li>
            <p class="txt">优惠券</p>
            <p class="number">-&yen;0.00</p>
          </li>
          <li>
            <p class="txt">会员优惠</p>
            <p class="number">-&yen;0.00</p>
          </li>
        </ul>
        <p class="payment">实付金额：<span>&yen;123.00</span></p>
        <a href="#" class="submit">提交订单</a>
      </div>
  
    </div>
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
@charset "utf-8";
/* 包裹盒 */
.page {
  max-width: 7.5rem;
  margin: 0 auto;
}
.headCon .menu {
  width: 0.55rem;
  display: flex;
  justify-content: space-between;
}
.headCon .menu span {
  display: block;
  width: 0.12rem;
  height: 0.12rem;
  background: #000;
  border-radius: 50%;
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
.consigneeInfo {
  display: flex;
  flex-wrap: wrap;
  margin-bottom: 0.12rem;
  padding: 0.04rem 0.26rem 0.23rem 0.29rem;
  background: #ffffff url(../../assets/images/arrowRight.jpg) no-repeat 99% 50%;
  background-size: 0.19rem 0.26rem;
}
.consigneeInfo .userInfo {
  display: flex;
  justify-content: space-between;
  width: 6.24rem;
  padding-right: 0.71rem;
  font: 0.24rem/0.65rem "微软雅黑";
  color: #5a5a5a;
}
.consigneeInfo .userInfo .num {
  display: block;
  font: 0.24rem/0.65rem "微软雅黑";
  color: #5a5a5a;
}
.consigneeInfo .addrInfo {
  display: flex;
  font: 0.24rem/0.3rem "微软雅黑";
  color: #5a5a5a;
}
.consigneeInfo .addrInfo .address {
  width: 5.32rem;
  display: block;
  font: 0.24rem/0.3rem "微软雅黑";
  color: #5a5a5a;
}
.orderInfo {
  display: flex;
  flex-wrap: wrap;
  background: #fff;
  padding: 0 0.26rem;
  margin-bottom: 0.11rem;
}
.orderInfo .goodInfo {
  display: flex;
  justify-content: space-between;
  padding-bottom: 0.34rem;
  width: 6.98rem;
}
.orderInfo .goodInfo .left {
  display: flex;
}
.orderInfo .goodInfo .left .goodPic {
  display: block;
  padding-top: 0.22rem;
}
.orderInfo .goodInfo .left .goodPic img {
  width: auto;
  height: 2.2rem;
}
.orderInfo .goodInfo .left .good {
  padding-top: 0.28rem;
  padding-left: 0.28rem;
}
.orderInfo .goodInfo .left .good .goodName {
  font: 0.24rem/0.47rem "微软雅黑";
  color: #5f5f5f;
}
.orderInfo .goodInfo .left .good p {
  font: 0.24rem/0.48rem "微软雅黑";
  color: #b3b3b3;
}
.orderInfo .goodInfo .price {
  font: 0.3rem/1.14rem "微软雅黑";
  color: #df3b32;
}
.orderInfo .numInfo {
  display: flex;
  justify-content: space-between;
  padding-bottom: 0.38rem;
  width: 6.98rem;
}
.orderInfo .numInfo .txt {
  font: 0.24rem/0.64rem "微软雅黑";
  color: #626262;
}
.orderInfo .numInfo .square {
  display: flex;
  width: 2.9rem;
  justify-content: space-between;
}
.orderInfo .numInfo .square .addOrDesc {
  display: block;
  width: 0.73rem;
  height: 0.64rem;
  border: 1px solid #515151;
  font: 0.24rem/0.64rem "微软雅黑";
  color: #434343;
  text-align: center;
  border-radius: 0.03rem;
}
.orderInfo .numInfo .square input {
  width: 1.17rem;
  height: 0.64rem;
  border: 1px solid #515151;
  font: 0.24rem/0.64rem "微软雅黑";
  text-align: center;
  border-radius: 0.03rem;
}
.orderInfo .numInfo .square input::placeholder {
  color: #434343;
}
.orderInfo .deliver {
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 6.98rem;
  height: 0.96rem;
  border-top: 1px solid #f0f0f0;
}
.orderInfo .deliver p {
  font: 0.24rem/0.64rem "微软雅黑";
  color: #626262;
}
.discount {
  display: flex;
  flex-wrap: wrap;
  background: #fff;
  margin-bottom: 0.1rem;
}
.discount .coupon {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 0.36rem 0 0.26rem;
  width: 6.88rem;
  height: 1.01rem;
  border-bottom: 1px solid #f1f1f1;
}
.discount .coupon p {
  font: 0.24rem/0.64rem "微软雅黑";
  color: #626262;
}
.discount .bounds {
  display: flex;
  justify-content: space-between;
  align-items: center;
  height: 1.01rem;
  width: 6.98rem;
  padding: 0 0.26rem;
}
.discount .bounds > p {
  font: 0.24rem/0.64rem "微软雅黑";
  color: #626262;
}
.discount .bounds > div {
  display: flex;
}
.discount .bounds > div input {
  width: 1.49rem;
  height: 0.7rem;
  border: 0.02rem solid #d9d9d9;
  font: 0.24rem/0.7rem "微软雅黑";
  border-radius: 0.03rem;
  text-align: center;
}
.discount .bounds > div input::placeholder {
  color: #ebebeb;
}
.discount .bounds > div a {
  display: block;
  width: 0.74rem;
  height: 0.73rem;
  background: #f26b11;
  font: 0.24rem/0.73rem "微软雅黑";
  color: #fff;
  text-align: center;
  border-radius: 0.03rem;
  margin-right: 0.19rem;
  margin-left: 0.09rem;
}
.discount .bounds > div p {
  display: flex;
  font: 0.22rem/0.73rem "微软雅黑";
  color: #929292;
}
.discount .bounds > div p span {
  display: block;
  font: 0.22rem/0.73rem "微软雅黑";
  color: #cd3a40;
}
.allInfo {
  margin-bottom: 1.2rem;
  padding: 0 0.26rem 0.15rem 0.26rem;
  background: #fff;
}
.allInfo ul {
  display: flex;
  height: 2.6rem;
  align-items: center;
  flex-wrap: wrap;
  border-bottom: 1px solid #efefef;
}
.allInfo ul li {
  display: flex;
  justify-content: space-between;
  width: 6.98rem;
}
.allInfo ul li .txt {
  font: 0.24rem/0.44rem "微软雅黑";
  color: #5c5c5c;
}
.allInfo ul li .number {
  font: 0.2rem/0.44rem "微软雅黑";
  color: #db3038;
}
.allInfo .payment {
  text-align: right;
  padding-top: 0.07rem;
  font: 0.36rem/1.26rem "微软雅黑";
  color: #626262;
}
.allInfo .payment span {
  font: 0.36rem/1.26rem "微软雅黑";
  color: #dd373b;
}
.allInfo .submit {
  margin: 0 auto;
  display: block;
  width: 3.55rem;
  height: 1.12rem;
  background: #f26b11;
  font: 0.3rem/1.12rem "微软雅黑";
  color: #fff;
  text-align: center;
  border-radius: 0.03rem;
}
</style>
