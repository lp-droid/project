<template>
	<view>
		<view class="search">
			<icon type="search" color="white" size="10"></icon>
			<input type="text" value="" placeholder="搜索商品" placeholder-class="placeholder" />
		</view>
		<view class="list" v-if="list!==null">
			<view class="row" v-for="(item,index) in list " @click="todetail(item.id)" :key='item.id'>
				<image :src="baseUrl+item.img" mode="widthFix"></image>
				<view class="info">
					<text>{{item.goodsname}}</text>
					<text>￥{{item.price}}</text>
					<text>3565评论</text>
				</view>
			</view>
			
		

		</view>
		<view class="tishi" v-else>
			没有数据亲！
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
				baseUrl,
				list:[]
			}
		},
		async onLoad(e) {
			console.log(e.id);
			var result = await this.$http('api/getcategoods' ,{
				fid: e.id
			}).catch(err => {
				console.log(err);
			})
			this.list=result.data.list
			console.log(result.data.list);
		},
		methods:{
			todetail(id){
				uni.navigateTo({
					url:'../details/details?id='+id
				})
			}
		}

	}
</script>

<style>
	.search {
		margin: 50rpx;
		height: 80rpx;
		background-color: #f26b11;
		border-radius: 80rpx;
		color: white;
		display: flex;
		justify-content: center;
		align-items: center;
	}

	icon {
		margin: 0 10rpx 0 250rpx;
	}

	.placeholder {
		color: white;
		font-size: 25rpx;
	}

	.row {
		position: relative;
		margin: 10rpx 20rpx;
		height: 330rpx;
		border-bottom: 1rpx solid #AAAAAA;
	}

	image {
		position: absolute;
		top: 0;
		left: 10rpx;
		width: 160rpx;
	}

	.info {
		height: 85%;
		width: 100%;
		position: absolute;
		top: 0;
		left: 200rpx;
		display: flex;
		justify-content: space-around;
		flex-direction: column;
		font-size: 25rpx;
	}

	.info text:nth-of-type(2) {
		color: red;
	}

	.info text:nth-of-type(3) {
		font-size: 20rpx;
		color: #AAAAAA;
	}

	.tishi {
		line-height: 200rpx;
		text-align: center;
		font-size: 40rpx;
		color: #006699;
	}
</style>
