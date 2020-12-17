<template>
	<view class="box">
		<view class="row">
			<text>手机号</text>
			<input type="text" v-model="phone" maxlength="12" />
		</view>
		<view class="row">
			<view class="send">
				<button :disabled="!codeTag" class="captcha" size="mini" @click="clickcode">验证码</button>
				<text>{{second}}</text>
			</view>
			<input type="text" v-model="code" placeholder="- - - -" maxlength="4" />
		</view>
		<view class="row">
			<text style="font-size: 23rpx;">收不到验证码？试试 <text style="color:#00BB00;font-size: 23rpx;"> 语音验证</text></text>
			<!--   -->
			<button type="primary" :disabled="!loginTag" style="width: 90%;border-radius: 80rpx;margin-top: 50rpx;" @click="login">登录</button>
		</view>
		<view class="row">
			<text style="color: #006699;text-align: center;">通过微信授权登录</text>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				phone: '',
				code: '',
				loginTag: false,
				codeTag: false,
				second: ''
			}
		},
		watch: {
			//监听手机号
			phone: function(val) {
				console.log(val);
				console.log(/^1[3456789]\d{9}$/.test(val));
				var result = /^1[3456789]\d{9}$/.test(val)
				this.codeTag = result
			},
			code: function(val) {
				if (val.length == 4) {
					this.loginTag = true
				} else {
					this.loginTag = false
				}
			}
		},

		methods: {
			//验证码
			async clickcode() {
				var result = await this.$http('api/sms', {
					phone: this.phone
				}).catch(err => {
					console.log(err);
					return
				})
				uni.setStorageSync('code', result.data.list.code)
				var second = 60
				this.second = second
				setInterval(() => {
					second -= 1
					this.second = second
				}, 1000)
				
			},
			//登录
			async login() {
				// console.log(uni.getStorageSync('code'));
				if (uni.getStorageSync('code') == this.code) {
					var result = await this.$http('api/wxlogin', {
						phone: this.phone,
					}).catch(err => console.log(err))
					console.log(result);
					var userInfo = result.data.list
					uni.setStorageSync('userInfo', userInfo)
					uni.reLaunch({
						url: '../mine/mine'
					})
				}
			}
		}
	}
</script>

<style>
	/* 导入外部的样式文件 */
	/* @import url("../../common/css/index.css"); */
	.box {
		position: relative;
	}

	.row {
		display: flex;
		flex-direction: column;
		justify-content: space-around;
		margin: 40rpx;
	}

	.send {
		display: flex;
		justify-content: space-between;
		align-items: center;
	}

	.send text:nth-of-type(2) {
		color: #00BB00;
	}

	text {
		font-size: 27rpx;
		margin-bottom: 10rpx;
	}

	input {
		border-bottom: 1rpx solid gray;
		height: 65rpx;
	}

	.captcha {
		background: #007cfe;
		color: white;
		padding: 10rpx 20rpx;
		border-radius: 13rpx;
		margin-left: 0;
	}
</style>
