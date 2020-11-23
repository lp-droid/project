<template>
  <div>
    <div class="page">
      <!-- header头部 -->
      <van-nav-bar
        :title="$route.name"
        @click-left="$router.back()"
        left-text="返回"
        left-arrow
      />
      <!-- search搜索框 -->
      <div class="search">
        <input type="search" placeholder="搜索商品" />
      </div>
      <!-- list商品列表 -->
      <ul class="list">
        <li v-for="item in list" :key="item.id" @click="godet(item.id)">
          <img :src="$imgUrl + item.img" alt="pic" />
          <div class="good">
            <h4>
              <a href="#">{{ item.name }}</a>
            </h4>
            <p class="price">&yen;{{ item.price }}</p>
            <p class="comment">{{ item.num }}条评论</p>
          </div>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import { getGoods } from "../../util/index";
export default {
  data() {
    return {
      list: [],
    };
  },
  mounted() {
    this.getgoodList();
  },
  methods: {
    getgoodList() {
      getGoods({ fid: this.$route.query.id }).then((res) => {
        this.list = res.list;
      });
    },
    godet(id) {
      this.$router.push({
        path: "/detail",
        query: { id },
      });
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
.headCon {
  display: flex;
  justify-content: space-between;
  height: 0.88rem;
  background: #fff;
  align-items: center;
  padding: 0.4rem 0.28rem 0 0.35rem;
}
.headCon .back img {
  width: auto;
  height: 0.29rem;
}
.headCon .logo img {
  width: auto;
  height: 0.29rem;
}
.headCon .menu span {
  background: #000;
}
.search {
  padding-top: 0.22rem;
}
.search input {
  display: block;
  margin: 0 auto;
  width: 6.23rem;
  height: 0.77rem;
  background: #f26b11 url(../../assets/images/search.jpg) no-repeat 2.38rem
    center;
  background-size: 0.26rem 0.27rem;
  font: 0.26rem/0.77rem "微软雅黑";
  border-radius: 0.77rem;
}
.search input::placeholder {
  padding-left: 2.87rem;
  color: #fff;
}
.list {
  display: flex;
  flex-wrap: wrap;
  margin-bottom: 1.2rem;
  padding: 0.14rem 0.23rem 1.36rem 0.23rem;
}
.list li {
  padding: 0.25rem 0.13rem 0.17rem 0.18rem;
  width: 6.73rem;
  display: flex;
  justify-content: space-between;
  border-bottom: 1px solid #d1d1d1;
}
.list li img {
  width: auto;
  height: 1.6rem;
}
.list li .good {
  width: 4.83rem;
}
.list li .good h4 {
  padding-top: 0.04rem;
}
.list li .good h4 a {
  display: block;
  font: 0.26rem/0.46rem "微软雅黑";
  color: #343434;
}
.list li .good .price {
  font: 0.3rem/0.43rem "微软雅黑";
  color: #e33939;
}
.list li .good .comment {
  padding-top: 0.14rem;
  font: 0.26rem/0.53rem Arial;
  color: #9a9a9a;
}
</style>
