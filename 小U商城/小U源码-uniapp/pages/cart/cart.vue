<template>
	<view class="container">
		<view class="top">
			<scroll-view class="scroll-view_H" scroll-x="true" scroll-left="0" v-for="(item,index) in list">
				<view class="cartInfo" id="demo1">
					<!-- 购物车商品信息 -->
					<view class="cartInfochild">
						<!-- 选择框 -->
						<view class="cartInfo_switch common">
							<!-- 点击当前商品 -->
							<switch type="checkbox" @click="singleCheck(index)" :checked="item.checked" />
						</view>
						<!-- 图片 -->
						<view class="cartInfo_image common">
							<image :src="baseUrl+item.img" mode=""></image>
						</view>

						<!-- 信息 -->
						<view class="cartInfo_info">
							<label for="" style="font-size: 26rpx;">{{item.goodsname}}</label>
							<label for="" style="font-size: 24rpx; color: #ccc;">规格：黑色</label>
							<label for="" style="color: red;">￥{{item.price}}</label>
						</view>
						<!-- 加减数量 -->
						<view class="cartInfo_num">
							<view class="cartInfo_num_child">
								<label for="" @click="reduce(index)">-</label>
								<label for="">{{item.num}}</label>
								<label for="" @click="add(index)">+</label>
							</view>
						</view>
					</view>
				</view>
				<view class="cartDel" id="demo2"><label for="">删除</label></view>
			</scroll-view>


		</view>

		<!-- 底部 -->
		<view class="foot">
			<view class="footd1">
				<switch type="checkbox" :checked="isAllCheck" @click="allcheck" />
				<label>全选</label>
			</view>
			<view class="footd2">
				<view class="footd2sp1">
					总计：
					<label style="color: red;">{{total}}</label>
				</view>
				<label class="footd2sp2">不含运费，已优惠￥0.00</label>
			</view>
			<!-- 跳到提交订单，结算页面 -->
			<view class="footd3">
				<!-- 被选中的商品的个数 -->
				<label @click="toConfirm">去结算{{totalnum}}</label>
			</view>
		</view>
	</view>
</template>

<script>
	import {
		baseUrl
	} from '../../utils/config.js'
	export default {
		data() {
			return {
				list: [],
				baseUrl
			}
		},
		onLoad() {
			this.getlist()
		},
		onShow() {
			this.getlist()
		},
		methods: {
			//购物车接口
			async getlist() {
				let {
					uid,
					token
				} = uni.getStorageSync('userInfo')
				console.log(uid);
				var result = await this.$http('api/cartlist', {
					uid: uid
				}, 'get', token).catch(err => {
					console.log(err);
				})
				// console.log(result.data);
				//判断成功
				if (result.data.code == 500) {
					uni.reLaunch({
						url: '../send/send'
					})
				}
				// 渲染到页面
				var list = result.data.list;
				if (list == null) return
				list.forEach(item => {
					item.checked = true;
				});
				this.list = result.data.list;
				// console.log(result.data.list);
			},
			//全选
			allcheck() {
				this.isAllCheck = !this.isAllCheck
			},
			singleCheck(index) {
				//页面数据要变化
				this.list[index].checked = !this.list[index].checked;
			},
			reduce(index) {
				// console.log(this.list[index].num);
				//页面num减少
				if (this.list[index].num <= 1) {
					this.list[index].num = 1
					return;
				}
				this.list[index].num -= 1;
				// this.list[index].num -= 1
				this.cartEdit(index)
				console.log(this.list[index]);

				// console.log(result);
			},
			add(index) {
				this.list[index].num += 1
				this.cartEdit(index)
			},
			//修改数量
			async cartEdit(index) {
				var {
					token
				} = uni.getStorageSync('userInfo')
				let {
					num,
					id
				} = this.list[index]
				var result = await this.$http('api/cartedit', {
					id: id,
					num: num
				}, 'get', token).catch(err => {
					console.log(err);
				})
			},
			//去结算
			toConfirm() {
				var arr = this.list.filter(item => {
					return item.checked == true
				})
				uni.setStorageSync('toConfirm', arr)
				uni.navigateTo({
					url: '../confirm/confirm'
				})
			}
		},
		computed: {
			//总数量
			totalnum: function() {
				return this.list.reduce((current, item) => {
					return current += item.num
				}, 0)
			},
			total: function() {
				var result = 0
				this.list.forEach(item => {
					if (item.checked) {
						result += item.price * item.num
					}
				})
				return result
			},
			// isAllCheck:function(){
			// 	return this.list.every(item=>{
			// 	return	item.checked==true
			// 	})
			// }
			isAllCheck: {
				set: function(newval) {
					this.list.forEach(item => {
						item.checked = newval
					})
				},
				get: function() {
					if (this.list.length == 0) {
						return false
					}
					return this.list.every(item => {
						return item.checked == true;
					});
				}
			}
		}
	};
</script>

<style>
	@import url('../../common/css/cart.css');

	.cartInfo_image_img {
		width: 120rpx;
		height: 120rpx;
	}
</style>
