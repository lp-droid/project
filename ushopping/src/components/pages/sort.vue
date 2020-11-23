
<template>
  <div>
    <van-nav-bar
      :title="$route.name"
      @click-left="$router.back()"
      left-text="返回"
      left-arrow
    />
    <div class="dis">
      <van-sidebar v-model="activeKey" @change="chan">
        <van-sidebar-item
          :title="item.catename"
          v-for="item in firstList"
          :key="item.id"
        />
      </van-sidebar>

      <van-grid :border="false" :column-num="3">
        <van-grid-item
          v-for="item in secondList"
          :key="item.id"
          :to="'/list?id=' + item.id"
        >
          <van-image
            :src="
              item.img
                ? $imgUrl + item.img
                : 'https://img.yzcdn.cn/vant/apple-1.jpg'
            "
          />
        </van-grid-item>
      </van-grid>
    </div>
  </div>
</template>

<script>
import { getCateTree } from "../../util/index";
export default {
  data() {
    return {
      activeKey: 0,
      firstList: [],
      secondList: [],
    };
  },
  mounted() {
    this.getCate();
  },
  methods: {
    chan(e) {
      console.log(e);
      this.secondList = this.firstList[e].children;
      // this.activeKey = e;
      // this.getCate();
    },
    getCate() {
      getCateTree().then((res) => {
        console.log(res);
        this.firstList = res.list;

        this.secondList = res.list[this.activeKey].children;
        console.log(this.secondList);
      });
    },
  },
};
</script>

<style lang="" scoped>
.dis {
  display: flex;
}
.van-grid {
  flex: 1;
}
</style>
