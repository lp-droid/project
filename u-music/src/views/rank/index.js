import react from "react";

// 引入css
import "../../assets/css/rank.css";
import { getHotSong, playDetail } from "../../utils/axios";

class rank extends react.Component {
  constructor() {
    super();
    this.state = {
      hotList: [],
      updateTime:0
    };
  }
  //封装一个时间转化函数
  formateTime(timer) {
    let date = new Date(timer);
    //获取年份
    let year = date.getFullYear();
    //获取月份
    let month = (date.getMonth() + 1 + "").padStart(2, "0");
    //获取天数
    let day = (date.getDate() + "").padStart(2, "0");
    let hour = (date.getHours() + "").padStart(2, "0");
    let minute = (date.getMinutes() + "").padStart(2, "0");
    let second = (date.getSeconds() + "").padStart(2, "0");
    return `${month}月${day}日`;
  }
  //封装跳转播放页方法
  toPlay(id){
      this.props.history.push(`/play?id=${id}`)
  }
  render() {
    const { hotList } = this.state;
    return (
      <div className="rank">
        <div className="hotImg"></div>
    <h1>{this.formateTime(this.state.updateTime)}</h1>
        <ul className="songList">
          {hotList.map((item, index) => {
            return (
              <li key={item.id} onClick={this.toPlay.bind(this,item.id)}>
                <h4>{item.name} </h4>
                <p>
                  {item.ar[0].name} - {item.al.name}{" "}
                </p>
                <span className="player"></span>
                <span className="sq"></span>
                <i className={index + 1 < 4 ? "num" : "numGray"}>
                  {(index + 1).toString().padStart(2, "0")}{" "}
                </i>
              </li>
            );
          })}
        </ul>
      </div>
    );
  }
  componentDidMount() {
    playDetail({
      id: 3778678,
    }).then((res) => {
      // console.log(res);
      if (res.code === 200) {
        this.setState({
          hotList: res.playlist.tracks.filter((item, i) => i < 20),
          updateTime:res.playlist.updateTime
        });
      }
    });
  }
}

export default rank;
