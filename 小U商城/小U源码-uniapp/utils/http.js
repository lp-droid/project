import {
	baseUrl
} from './config.js'

function http(url, data = {}, method = "get", token='') {
	return new Promise((resolve, reject) => {
		uni.request({
			url: baseUrl + url,
			method: method,
			data: data,
			header: {
				'content-type': 'application/x-www-form-urlencoded',
				authorization: token,
			},
			success: res => {
				resolve(res)
			},
			fali: err => {
				reject(err)
			}
		})
	})
}
export {
	http
}
