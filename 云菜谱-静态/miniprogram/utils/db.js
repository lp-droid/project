const db = wx.cloud.database()

//添加
function add(url, data) {
  return db.collection(url).add({
    data: data
  })
}
//查询
function get(url, _where = {}, _skip=0, _limit=10,_order={field:"_id",sort:"asc"},_field={}) {
  return db.collection(url).field(_field).skip(_skip).limit(_limit).orderBy(_order.field,_order.sort).where(_where).get()
}
//修改
function update(url, _id, _data = {}) {
  return db.collection(url).doc(_id).update({
    data: _data
  })
}

function del(url, _id) {
  return db.collection(url).doc(_id).remove()
}
function getbyId(_url,_id){
  return db.collection(_url).doc(_id).get()
}
export {
  add,
  get,
  update,
  del,
  getbyId
}