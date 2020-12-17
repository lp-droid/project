
/*
   根据views获取到星星数量
         0       0个黄星星
         1-10    1个黄星星
         11-20  2个黄星星
         11-30  3个黄星星
         31-40  4个黄星星
         41……    5个黄星星
 */
function getStar(views) {
  var star = 0;
  if (views == 0) {
    star = 0
  } else if (views >= 1 && views <= 10) {
    star = 1
  } else if (views >= 11 && views <= 20) {
    star = 2
  } else if (views >= 31 && views <= 40) {
    star = 3
  } else if (views >= 41 && views <= 50) {
    star = 4
  } else {
    star = 5
  }
  return star;

}
export {getStar}