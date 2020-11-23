<template>
  <div>
    <div id="box" class="page">
      <van-nav-bar
        :title="$route.name"
        @click-left="$router.back()"
        left-text="返回"
        right-text="登录"
        left-arrow
        @click-right="$router.push('/register')"
      />
      <div class="con">
        <van-form>
          <van-field
            v-model="info.phone"
            name="用户名"
            label="用手机号"
            placeholder="手机号"
            :rules="[{ required: true, message: '请填写手机号' }]"
          />
          <van-field
            v-model="info.nickname"
            name="昵称"
            label="昵称"
            placeholder="昵称"
            :rules="[{ required: true, message: '请填昵称' }]"
          />
          <van-field
            v-model="info.password"
            type="password"
            name="密码"
            label="密码"
            placeholder="密码"
            :rules="[{ required: true, message: '请填写密码' }]"
          />
          <div style="margin: 16px">
            <van-button
              @click="reg"
              round
              block
              type="info"
              native-type="submit"
            >
              提交
            </van-button>
          </div>
        </van-form>
      </div>
    </div>
  </div>
</template>

<script>
import { getRegister } from "../../util/index";
import { Toast } from "vant";
export default {
  data() {
    return {
      info: {
        nickname: "",
        phone: "",
        password: "",
      },
    };
  },
  methods: {
    reg() {
      getRegister(this.info).then((res) => {
        console.log(res);
        if (res.code == 200) {
          Toast.success(res.msg);
          this.$router.push("/login");
        } else {
          Toast.fail(res.msg);
        }
      });
    },
  },
};
</script>

<style lang="" scoped>
.headCon .menu {
  width: 0.65rem;
  /* display: flex; */
  /* justify-content: space-between; */
}

.headCon {
  display: flex;
  justify-content: space-between;
  height: 0.88rem;
  background: #f26b11;
  align-items: center;
  padding: 0.4rem 0.28rem 0 0.35rem;
}

.headCon h2 {
  font: 0.3rem/0.88rem "微软雅黑";
  color: #fff;
}

.con {
  font: 0.3rem/0.32rem "微软雅黑";
  color: #2d2d2d;
  padding: 0.35rem;
  padding-top: 50px;
}

input {
  font: 0.24rem/0.32rem "微软雅黑";
}

.con button {
  width: 100%;
  height: 0.8rem;
  background: #f26b11;
  outline: none;
  border: none;
  border-radius: 0.08rem;
  font: bold 0.3rem/0.32rem "微软雅黑";
  color: #fff;
  margin-bottom: 0.35rem;
}
</style>
