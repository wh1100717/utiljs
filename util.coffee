
###
 *  判断变量类型
 *  obj = {}
 *  str = "str"
 *  
 *  console.log obj.isType("obJect")    #true
 *  console.log str.isType("striNg")    #true
 *  console.log str.isType("array")     #false
 *  
 *  console.log obj.isObject()          #true
 *  console.log str.isString()          #true
 *  console.log str.isObject()          #false
###

_isType = (type) -> -> 
    {}.toString.call(this) is "[object #{type.toLowerCase().replace(/\w/, (w) -> w.toUpperCase())}]"

Object.prototype.isType = (type) -> _isType(type).call(this)
Object.prototype.isObject = _isType("object")
Object.prototype.isString = _isType("string")
Object.prototype.isArray = Array.isArray() || _isType("array")
Object.prototype.isFunction = _isType("function")
Object.prototype.isNumber = _isType("number")

###
 *  非原生Object.prototype污染方式
 *
 *  a = {}
 *  b = [1,2,3]
 *  console.log isType(a, "object")
 *  console.log isArray(b)
###

isType = (ele, type) -> _isType(type).call(ele)
isObject = (ele) -> _isType("object").call(ele)
isString = (ele) -> _isType("string").call(ele)
isArray = Array.isArray || (ele) -> _isType("array").call(ele)
isFunction = (ele) -> _isType("function").call(ele)
isNumber = (ele) -> _isType("number").call(ele)

###
 *  非原生Object.prototype污染方式2
 *
 *  a = {}
 *  str = "string"
 *  console.log isType(a, "object")
 *  console.log isObject(a)
 *  console.log isString(a)
 *  console.log isString(str)
 *  console.log isType(str, "string")
###
_isType = (type) -> (obj) -> {}.toString.call(obj) is "[object #{type.toLowerCase().replace(/\w/, (w) -> w.toUpperCase())}]"
isType = (ele, type) -> _isType(type)(ele)
isObject = _isType("object")
isString = _isType("string")
isArray = _isType("array")
isFunction = _isType("function")
isNumber = _isType("number")


