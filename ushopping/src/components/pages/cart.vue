<template>
  <div>
    <van-nav-bar
      :title="$route.name"
      @click-left="$router.back()"
      left-text="返回"
      left-arrow
    />
    <div class="page" id="box" v-cloak v-if="list">
      <van-checkbox>复选框</van-checkbox>
      <van-swipe-cell v-for="item in list" :key="item.id">
        <van-card
          :num="item.num"
          :price="item.price"
          desc="描述信息"
          :title="item.goodsname"
          class="goods-card"
          :thumb="
            item.img ? $imgUrl + item.img : 'https://img.yzcdn.cn/vant/cat.jpeg'
          "
        >
          <template #footer>
            <div>
              <van-stepper theme="round" button-size="22" disable-input />
            </div>
          </template>
        </van-card>
        <template #right>
          <van-button
            @click="del(item.id)"
            square
            text="删除"
            type="danger"
            class="delete-button"
          />
        </template>
      </van-swipe-cell>
      <van-submit-bar :price="3050" button-text="提交订单">
        <van-checkbox>全选</van-checkbox>
      </van-submit-bar>
    </div>
    <div v-else>
      <van-empty
        class="custom-image"
        image="https://img.yzcdn.cn/vant/custom-empty-image.png"
      />
    </div>
  </div>
</template>

<script>
import { getCartList, getCartDelete } from "../../util/index";
export default {
  data() {
    return {
      allcheck: false,
      value: "",
      list: [],
    };
  },
  computed: {},
  mounted() {
    this.cart();
    getCartList({
      uid: JSON.parse(sessionStorage.getItem("userInfo")).uid,
    }).then((res) => {
      console.log(res);
      this.list = res.list;
    });
  },
  methods: {
    del(id) {
      console.log(id);
      getCartDelete({ id }).then((res) => {
        this.list = res.list;
        getCartList({
          uid: JSON.parse(sessionStorage.getItem("userInfo")).uid,
        }).then((res) => {
          console.log(res);
          this.list = res.list;
        });
      });
    },
    cart() {
      getCartList({ uid: this.$route.query.uid }).then((res) => {
        this.list = res.list;
        console.log(this.list);
      });
    },
  },
};
</script>

<style lang="" scoped>
/* 包裹盒 */
.delete-button {
  width: 100%;
  height: 100%;
}
/* .page {
  display: flex;
} */
/* .van-swipe-cell__wrapper {
  flex: 1;
} */
.headCon .menu {
  width: 0.55rem;
  display: flex;
  justify-content: space-between;
}

.van-submit-bar__bar {
  margin-bottom: 60px;
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

.main ul {
  overflow: hidden;
  padding-top: 0.26rem;
  padding-bottom: 3.68rem;
}

.main ul li {
  width: calc(100% + 0.98rem);
  display: flex;
  justify-content: space-between;
  box-shadow: 0 0 0.1rem #f7f7f7;
}

.main ul li .good {
  display: flex;
}

.main ul li .good input[type="checkbox"] {
  appearance: none;
  -moz-appearance: none;
  -webkit-appearance: none;
  cursor: pointer;
  margin: 0.69rem 0.44rem 0 0.24rem;
  display: block;
  float: left;
  width: 0.34rem;
  height: 0.34rem;
  border: 0.02rem solid #666666;
  border-radius: 50%;
}

.main ul li .good img {
  width: auto;
  height: 0.82rem;
  padding-top: 0.45rem;
}

.main ul li .good .txt {
  width: 2.35rem;
  padding: 0.07rem 0 0.12rem 0.36rem;
}

.main ul li .good .txt .name {
  font: 0.28rem/0.53rem "微软雅黑";
  color: #343434;
}

.main ul li .good .txt .grammage {
  display: flex;
  font: 0.23rem/0.53rem "微软雅黑";
  color: #666666;
}

.main ul li .good .txt .grammage span {
  display: block;
  font: 0.24rem/0.53rem Arial;
  color: #666666;
}

.main ul li .good .txt .price {
  font: 0.32rem/0.47rem Arial;
  color: #e43a3d;
}

.main ul li p {
  display: flex;
}

.main ul li p .number {
  display: block;
  width: 0.79rem;
  height: 0.53rem;
  border-top: 1px solid #515151;
  border-bottom: 1px solid #515151;
  text-align: center;
  font: 0.2rem/0.57rem Arial;
  color: #454545;
  margin-top: 0.89rem;
}

.main ul li p .addOrDesc {
  display: block;
  width: 0.62rem;
  height: 0.57rem;
  outline: none;
  font: 0.2rem/0.57rem Arial;
  border: none;
  text-align: center;
  color: #454545;
  margin-top: 0.89rem;
  border: 1px solid #515151;
}

.main ul li p .desc {
  border-radius: 0.04rem 0 0 0.04rem;
}

.main ul li p .add {
  border-radius: 0 0.04rem 0.04rem 0;
}

.main ul li p .del {
  display: block;
  width: 0.98rem;
  height: 1.72rem;
  font: 0.24rem/1.72rem "微软雅黑";
  background: #e43a3d;
  color: #fff;
  text-align: center;
  margin-left: 0.31rem;
}

.main ul .active {
  transform: translate(-0.98rem, 0);
  margin: 0.3rem 0;
}

.settlement {
  display: flex;
  justify-content: space-between;
  padding-left: 0.24rem;
  margin-bottom: 1.2rem;
}

.settlement > div {
  display: flex;
  justify-content: space-between;
  width: 4.41rem;
  height: 1.14rem;
  align-items: center;
}

.settlement > div .btn {
  display: flex;
  justify-content: space-between;
  width: 0.95rem;
  font: 0.24rem/0.34rem "微软雅黑";
  color: #676767;
}

.settlement > div .btn input[type="checkbox"] {
  appearance: none;
  -moz-appearance: none;
  -webkit-appearance: none;
  cursor: pointer;
  display: block;
  width: 0.34rem;
  height: 0.34rem;
  border: 0.02rem solid #666666;
  border-radius: 50%;
}

.settlement > div > div {
  text-align: right;
}

.settlement > div > div .count {
  font: 0.3rem/0.46rem "微软雅黑";
  color: #323232;
}

.settlement > div > div .count span {
  display: inline-block;
  font: 0.3rem/0.46rem "微软雅黑";
  color: #e3393c;
}

.settlement > div > div .tip {
  font: 0.2rem/0.37rem "微软雅黑";
  color: #a4a4a4;
}

.settlement a {
  display: block;
  width: 2.14rem;
  height: 1.14rem;
  background: #f26b11;
  font: 0.3rem/1.14rem "微软雅黑";
  color: #ffffff;
  text-align: center;
}
</style>
