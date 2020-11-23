<template>
  <div>
    <div class="page">
      <van-nav-bar
        :title="$route.name"
        @click-left="$router.back()"
        left-text="返回"
        left-arrow
      />
    </div>
    <div v-if="info">
      <img class="pic" :src="$imgUrl + info.img" alt="" />
      <p>商品名称：{{ info.goodsname }}</p>
      <p>￥{{ info.price.toFixed(2) }}</p>
      <p>商品数量 <van-stepper v-model="value" /></p>
      <p>
        {{ info.specsname }}

        <van-tag type="primary" v-for="item in specsarr" :key="item">{{
          item
        }}</van-tag>
      </p>
      <div>
        <p>商品详情</p>
        <p :v-html="info.description"></p>
      </div>
    </div>
    <van-goods-action>
      <van-goods-action-icon icon="chat-o" text="客服" color="#07c160" />
      <van-goods-action-icon icon="cart-o" text="购物车" />
      <van-goods-action-button
        type="warning"
        text="加入购物车"
        @click="gocart"
      />
      <van-goods-action-button type="danger" text="立即购买" />
    </van-goods-action>
  </div>
</template>

<script>
import { getGoodsInfo, getCartAdd } from "../../util/index";
import { Toast } from "vant";
export default {
  data() {
    return {
      info: "",
      value: 1,
      specsarr: [],
    };
  },
  mounted() {
    this.getInfo();
  },
  methods: {
    getInfo() {
      getGoodsInfo({
        id: this.$route.query.id,
      }).then((res) => {
        if (res.code == 200) {
          this.info = res.list[0];
          this.specsarr = res.list[0].specsattr.split(",");
        }
      });
    },
    gocart() {
      if (sessionStorage.getItem("userInfo")) {
        getCartAdd({
          uid: JSON.parse(sessionStorage.getItem("userInfo")).uid,
          goodsid: this.info.id,
          num: this.value,
        }).then((res) => {
          if (res.code == 200) {
            Toast.success(res.msg);
            this.$router.push({
              path: "/cart",
              query: {
                uid: JSON.parse(sessionStorage.getItem("userInfo")).uid,
              },
            });
          }
        });
      } else {
        Toast.fail("请先登录");
        this.$router.push("/login");
      }
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
.pic {
  width: 100%;
  height: auto;
}
p {
  font-size: 0.35rem;
  padding: 10px;
}
.van-stepper {
  float: right;
}
.van-tag {
  margin: 5px;
}
</style>
