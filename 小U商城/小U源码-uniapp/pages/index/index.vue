<template>
	<view class="">
		<!-- 顶部信息 -->
		<view class="HomeTop">
			<view class="logoView">
				<!-- logo -->
				<view class="logo">
					小U商城
				</view>
			</view>
			<view class="inputView">
				<input class="textinput" style="center" type="text" placeholder="寻找商品" />
			</view>
		</view>

		<!-- 顶部导航  scroll-view -->
		<view class="tabs">
			<scroll-view id="tab-bar" class="scroll-h" :scroll-x="true" :show-scrollbar="false">
				<view class="uni-tab-item" data-current="0" @click="tolist(item.id)" v-for="(item,index) in catelist" :v-key='item.id'>
					<text class="uni-tab-item-title " :class="cateIndex==index?'uni-tab-item-title-active':''" @click="cateclick(index)">
						{{item.catename}}
					</text>
				</view>
			</scroll-view>
		</view>
		<!-- 推荐轮播图 -->
		<view class="">
			<swiper :indicator-dots="true" :autoplay="true" :interval="2000" :duration="1000">
				<swiper-item v-for="(item,index) in banner" :key='item.id'>
					<view class="swiper-item">
						<image :src="baseUrl+item.img" mode=""></image>
					</view>
				</swiper-item>
			
			</swiper>
		</view>

		<!-- 功能导航开始 -->
		<!-- 功能导航 -->
		<view class="FunctNavCon">
			<view class="FunctNavLi">
				<image src="../../static/index/xiaohuoban.png" alt class="FunImg" />
				<p>限时抢购</p>
			</view>
			<view class="FunctNavLi">
				<image src="../../static/index/jifentixicopy.png" alt class="FunImg" />
				<p>积分商城</p>
			</view>
			<view class="FunctNavLi">
				<image src="../../static/index/lianxiwomen.png" alt class="FunImg" />
				<p>联系我们</p>
			</view>
			<view class="FunctNavLi" @click="toclassify">
				<image src="../../static/index/-shangpinfenlei-gai.png" alt class="FunImg" />
				<p>商品分类</p>
			</view>
		</view>

		<!-- 推荐部分 未写 -->
		<view class="HotGoods">
			<!-- 热推左侧 -->
	<!-- 		<view class="HotLeft" v-if="getseckill.length==null">
				<view class="LimitedContent">
					<image class="LimitedImg" src="../../static/index/xianshi.jpg" alt />
					<label class="Limited">限时秒杀</label>
				</view>
				<p class="LimitedTitle">每天零点场，好货秒不停</p>
				<!-- 倒计时 -->
				<!-- <view class="LimitTimeAll"> -->
					<!-- <label class="LimitTime">{{hour}}</label> -->
					<!-- <view class="maohao">:</view> -->
					<!-- <label class="LimitTime">{{minute}}</label> -->
					<!-- <view class="maohao">:</view> -->
					<!-- <label class="LimitTime">{{second}}</label> -->
					<!-- <view class="Seckill">秒杀</view> -->
				<!-- </view> -->
	<!-- <image mode="aspectFill" style="width: 128px;height: 93px;" :src="baseUrl+getseckill[0].img" alt=""> -->
			<!-- </view> -->
<view class="HotLeft">
<view class="LimitedContent">
<image class="LimitedImg" src="../../static/index/xianshi.jpg" alt />
<label class="Limited">限时秒杀</label>
</view>
<p class="LimitedTitle">每天零点场，好货秒不停</p>
<!-- 倒计时 -->
<view class="LimitTimeAll">
<label class="LimitTime">02</label>
<view class="maohao">:</view>
<label class="LimitTime">16</label>
<view class="maohao">:</view>
<label class="LimitTime">45</label>
<label class="Seckill">秒杀</label>
</view>
<image src="../../static/index/goods2.jpg" class="LimitedgoodsImg" alt="">
</view>
			<!-- 热推右侧 -->
			<view class="HotRight">
				<!-- 右侧顶部部分 -->
				<view class="HotTop">
					<view class="HomeTopInfo">
						<view class="HomeTopInfoOne">
							<label class="BrandNew">品牌上新</label>
							<label class="Discount">折</label>
						</view>
						<view class="HomeTopRobbig">
							<label>每日九点，抢大牌</label>
						</view>
					</view>
					<!-- <div> -->
					<view class="Cloth">
						<image src="../../static/index/goods1.jpg" alt="">
					</view>

					<!-- </div> -->
				</view>
				<!-- 右侧底部 -->
				<view class="HotBottom">
					<view class="HotBottomLeft">
						<view class="HotBottomLeftInfo">
							<label class="HotBottomLeftInfoTitle">每日十件</label>
							<label class="HotBottomLeftInfoDetail">只为你选好货</label>
						</view>
						<view class="HotBottomLeftImage">
							<image src="../../static/index/goods1.jpg" mode=""></image>
						</view>
					</view>
					<view class="HotBottomRight">
						<view class="HotBottomRightInfo">
							<label class="HotBottomRightInfoTitle">每日十件</label>
							<label class="HotBottomRightInfoDetail">只为你选好货</label>
						</view>
						<view class="HotBottomRightImage">
							<image src="../../static/index/goods1.jpg" mode=""></image>
						</view>
					</view>
				</view>
			</view>
		</view>
		<!-- 轮播图2 -->
		<div class="Swiper2">
			<image class="Swiper2Img" src="../../static/index/swiper1.jpg" alt />
		</div>

		<!-- 底部商品列表 -->
		<view class="products">
			<!-- 商品标签 -->
			<view class="tags">
				<view class="tag_list " :class="taga==0?'active_tag_list':''" @click="tag(0)">
					<label for="">热门推荐</label>
				</view>
				<view class="tag_list" :class="taga==1?'active_tag_list':''" @click="tag(1)">
					<label>发现好货</label>
				</view>
				<view class="tag_list" :class="taga==2?'active_tag_list':''" @click="tag(2)">
					<label for="">只看专场</label>
				</view>
			</view>
			<!-- 标签对应的商品 -->
			<view class="tags_product" v-if="list.length>0">
				<view class="product" v-for="(item ,index) in list[taga].content" @click="todetail(item.id)">
					<view class="GoodsLeft">
						<image class="GoodsImg" :src="baseUrl+item.img" alt />
					</view>
					<view class="GoodsCont">
						<view class="GoodConTit">{{item.goodsname}}</view>
						<view class="GoodsPrice">{{item.price}}</view>
						<view class="yimai">已售8000件</view>
						<view class="Immed">立即抢购</view>
					</view>
				</view>

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
				catelist: [],
				cateIndex: 0,
				getseckill: [],
				baseUrl,
				hour: "",
				minute: "",
				second: "",
				list: [],
				taga: 0,
				banner:[]
			}

		},

		async onLoad() {
			//轮播图
			var banner = await this.$http('api/getbanner').catch(err => {
				console.log(err);
			})
			this.banner=banner.data.list
			console.log(banner.data.list);
			//商品接口
			var result = await this.$http('api/getcate').catch(err => {
				console.log(err);
			})
			this.catelist = result.data.list
			//限时秒杀
			var result = await this.$http('api/getseckill').catch(err => {
				console.log(err);
			})
			//秒杀
			setInterval(() => {
				//现在时间
				var nowtime = new Date().getTime()
				
			if(result.data.list!==null){
				//结束时间	
				var time = result.data.list[0].endtime - nowtime
				console.log( time);
				var distance = Math.floor(time / 1000)
				//小时
				this.hour = (Math.floor(distance / 3600) + '').padStart(2, '0')
				//分钟
				this.minute = (Math.floor(distance % 3600 / 60) + '').padStart(2, '0')
				//秒
				this.second = (distance % 60 + '').padStart(2, '0');
			}
			}, 1000)
			this.getseckill = result.data.list
			//热门推荐
			var result1 = await this.$http('api/getindexgoods').catch(err => {
				console.log(err);
			})
			this.list = result1.data.list
			console.log(this.list[0].content);
		},

		methods: {
			tolist(id) {
				uni.navigateTo({
					url: '../product/product?id=' + id
				})
			},
			cateclick(index) {
				this.cateIndex = index
			},
			//跳转分类
			toclassify() {
				uni.navigateTo({
					url: "../classify/classify"
				})
			},

			tag(index) {
				this.taga = index
			},
			//跳转详情
			todetail(id) {
				uni.navigateTo({
					url: '../details/details?id=' + id
				})
			}
		}
	}
</script>

<style>
	/* 导入外部的样式文件 */
	@import url("../../common/css/index.css");
</style>
