<template>
	<view>
		<button type="primary"  @click="handlePost">发送请求</button>
	</view>
</template>

<script>
	import {http} from '@/utils/http.js'
	export default {
		data() {
			return {
				
			}
		},
		methods: {
			handlePost(){
				var data={username:"八戒",weight:200}
				http("/api/test","POST",data)
			}
		}
	}
</script>

<style>

</style>
