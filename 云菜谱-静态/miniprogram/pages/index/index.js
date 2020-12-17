import {
    get
} from "../../utils/db"
Page({
    data: {
        page: 1,
        pagesize: 10,
        sort: [],
        types: [{
                src: "../../imgs/index_07.jpg",
                typename: "营养菜谱"
            },
            {
                src: "../../imgs/index_09.jpg",
                typename: "儿童菜谱"
            },
        ],
        recipes: []
    },
    sort() {
        wx.navigateTo({
            url: "../type/type",
        })
    },
    async onLoad() {
        let {
            page,
            pagesize
        } = this.data;
        this.getpage(page, pagesize)
        var result = await get('type', {}, 0, 3, {
            field: "name",
            sort: "asc"
        }, {
            name: true
        }).catch(err => {
            console.log(err);
        })
        this.setData({
            sort: result.data
        })
    },
    async onReachBottom() {
        this.data.page += 1
        let {
            page,
            pagesize
        } = this.data
        this.getpage(page, pagesize)
    },
    async getpage(page, pagesize) {
        var skip = (page - 1) * pagesize
        console.log(skip);
        var result = await get('menu', {}, skip, pagesize).catch(err => {
            console.log(err);
        })
        console.log(result);
        this.setData({
            recipes: this.data.recipes.concat(result.data)
        })
    },
    detail(e) {
        wx.navigateTo({
            url: '../detail/detail?id=' + e.currentTarget.id,
        })
    },
    tolist(e) {
        wx.navigateTo({
            url: '../list/list?id=' + e.currentTarget.id,
        })
    }
})