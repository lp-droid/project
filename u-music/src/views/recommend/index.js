// 利用类的方式创建组件
// 引入核心库
import React from "react";
//引入swiper插件
import Swiper from "swiper";
// 引入css文件
import "../../assets/css/recom.css";
//引入轮播图的样式
import "../../assets/css/swiperInfo.css";
// 引入接口
import { getRecommed, getNewSong, getBanner } from "../../utils/axios";
import axios from "axios";
// 引入路由相关属性和方法
import { NavLink } from "react-router-dom";

class Home extends React.Component {
  constructor() {
    super();
    // state属性-管理数据用的
    this.state = {
      imgList: [],
      songList: [],
      bannerList: [],
      bList: [],
    };
  }
  // componentDidMount() {
  //   //组件一加载就调用banner
  //   getBanner().then((res) => {
  //     console.log(res, "轮播图列表");
  //     if (res.code == 200) {
  //       this.setState(
  //         {
  //           bList: res.banners,
  //         },
  //         () => {
  //           //组件一加载就实现轮播图
  //           let swiper = new Swiper(".swiper-container", {
  //             pagination: {
  //               el: ".swiper-pagination",
  //             },
  //             autoplay: {
  //               //自动播放
  //               delay: 2000,
  //             },
  //             loop: true,
  //           });
  //         }
  //       );
  //     }
  //   });
  // }
  //封装一个跳转详情列表事件
  toDetail(id){
    this.props.history.push(`/list?id=${id}`)
  }
  render() {
    const { imgList, songList, bannerList, bList } = this.state;
    return (
      <div className="recom">
        {/* 轮播图 */}

        <div className="swiper-container">
          <div className="swiper-wrapper">
            {bannerList.map((item) => {
              return (
                <div key={item.imageUrl} className="swiper-slide">
                  <img src={item.imageUrl} alt="" />
                </div>
              );
            })}
          </div>
          {/* 分页器 */}
          <div className="swiper-pagination"></div>
        </div>
        <div className="cont1">
          <h2>推荐歌单</h2>
          <ul className="imgList">
            {imgList.map((item) => {
              return (
                // <NavLink to="/list">
                  <li key={item.id} onClick={this.toDetail.bind(this,item.id)}>
                    <img src={item.picUrl}></img>
                    <p>{item.name} </p>
                    <div className="count">
                      <em></em>
                      <span>{(item.playCount / 10000).toFixed(1)} 万</span>
                    </div>
                  </li>
                // </NavLink>
              );
            })}
          </ul>
        </div>
        <div className="cont2">
          <h2>最新音乐</h2>
          <ul className="songList">
            {songList.map((item) => {
              return (
                <li key={item.id}>
                  <h4>{item.name} </h4>
                  <p>
                    {item.song.artists[0].name} - {item.song.album.name}{" "}
                  </p>
                  <span className="player"></span>
                  <span className="sq"></span>
                </li>
              );
            })}
          </ul>
        </div>
      </div>
    );
  }
  // 加载完成
  componentDidMount() {
    //  axios并发处理
    axios.all([getRecommed(), getNewSong(), getBanner()]).then(
      axios.spread((getRecommed, getNewSong, getBanner) => {
        // console.log(getNewSong);
        if (getRecommed.code === 200) {
          this.setState({
            imgList: getRecommed.result,
          });
        }
        if (getNewSong.code === 200) {
          this.setState({
            songList: getNewSong.result,
          });
        }
        if (getBanner.code === 200) {
          console.log(getBanner);
          this.setState(
            {
              bannerList: getBanner.banners.filter((item,i)=>i<4),
            },
            () => {
              //组件一加载就实现轮播图
              let swiper = new Swiper(".swiper-container", {
                pagination: {
                  el: ".swiper-pagination",
                },
                autoplay: {
                  //自动播放
                  delay: 2000,
                },
                loop: true,
              });
            }
          );
        }
      })
    );
  }
}

// 导出子类
export default Home;
