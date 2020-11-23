<template>
  <div>
    <div id="box" class="page">
      <van-nav-bar
        :title="$route.name"
        @click-left="$router.back()"
        left-text="返回"
        right-text="注册"
        left-arrow
        @click-right="$router.push('/register')"
      />

      <van-form>
        <van-field
          v-model="form.phone"
          name="用户名"
          label="用手机号"
          placeholder="手机号"
          :rules="[{ required: true, message: '请填写手机号' }]"
        />
        <van-field
          v-model="form.password"
          type="password"
          name="密码"
          label="密码"
          placeholder="密码"
          :rules="[{ required: true, message: '请填写密码' }]"
        />
        <div style="margin: 16px">
          <van-button
            @click="login"
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
</template>

<script>
import { Toast } from "vant";
import { getLogin } from "../../util/index";
export default {
  data() {
    return {
      form: {
        phone: "",
        password: "",
      },
    };
  },
  methods: {
    login() {
      getLogin(this.form).then((res) => {
        if (res.code == 200) {
          Toast.success(res.msg);
          sessionStorage.setItem("userInfo", JSON.stringify(res.list));
          this.$router.push("/mine");
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
  padding-top: 1rem;
}

.con div {
  margin: 0.35rem 0;
  padding-bottom: 0.1rem;
  border-bottom: 2px solid #ccc;
}

.con p a {
  font: 0.3rem/0.32rem "微软雅黑";
  padding-bottom: 0.2rem;
  color: #999;
  float: right;
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
}
</style>
