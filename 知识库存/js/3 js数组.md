## JavaScript Array 对象
Array 对象用于在变量中存储多个值
````
var cars = ["Saab", "Volvo", "BMW"];
````
### 数组属性
- constructor	返回创建数组对象的原型函数。
- length	设置或返回数组元素的个数
- prototype	允许你向数组对象添加属性或方法

### Array对象方法
- concat()	连接两个或更多的数组，并返回结果
- every()	检测数值元素的每个元素是否都符合条件
- some()	检测数组元素中是否有元素符合指定条件
- filter()	检测数值元素，并返回符合条件所有元素的数组
- find()	返回符合传入测试（函数）条件的数组元素
- forEach()	数组每个元素都执行一次回调函数
- isArray()	判断对象是否为数组
- shift()	删除并返回数组的第一个元素
- splice()	从数组中添加或删除元素
- pop()	删除数组的最后一个元素并返回删除的元素
- push()	向数组的末尾添加一个或更多元素，并返回新的长度


## 遍历数组的方法
### 使用变量循环
````   
var array = [1,2,3,4,5,6,7];
for (var i = 0; i < array.length; i) {
    console.log(i,array[i]);
}
````        
### 使用forEach迭代数组
````   
array.forEach(v=>{
console.log(v);
});
array.forEach（function(v){
    console.log(v);
});
````
### 使用for in遍历数组，遍历的是key.是ES5标准
````   
for(let index in array) {
    console.log(index,array[index]);
};

var A = {a:1,b:2,c:3,d:"hello world"};
for(let k in A) {
    console.log(k,A[k]);
}
````
### 使用for of 迭代，遍历的是value,是ES6标准
````   
for(let v of array) {
    console.log(v);
};
let s = "helloabc";
for(let c of s) {
console.log(c);
}
````

## 查找数组的方法
### find()：返回通过测试的数组的第一个元素的值
````    
array.find(function(value, index, arr),thisValue)

例子：
var arr = [1,2,3,4,5,6,7];
var ar = arr.find(function(elem){
 return elem>5;
});
console.log(ar);//6
console.log(arr);//[1,2,3,4,5,6,7]
````
### filter()：创建一个新数组，新数组中的元素是通过检查指定数组中符合条件的所有元素
````
array.filter(function(value, index, arr),thisValue)

例子：
var arr = [1,2,3,4,5,6,7];
var ar = arr.filter(function(elem){
 return elem>5;
});
console.log(ar);//[6,7]
console.log(arr);//[1,2,3,4,5,6,7]
````
### map()：返回一个新数组，数组中的元素为原始数组元素调用函数处理后的值，map()方法按照原始数组元素顺序依次处理元素
````
array.map(function(value, index, arr),thisValue)

var arr = [1,2,3,4,5,6,7];
var ar = arr.map(function(elem){
return elem*4;
});
console.log(ar);//[4, 8, 12, 16, 20, 24, 28]
console.log(arr);//[1,2,3,4,5,6,7]
````
### forEach()：用于调用数组每个元素，并将元素传递给回调函数（注意没有办法跳出或终止forEach语句，除非抛出异常）
````
array.forEach(function(value, index, arr),thisValue)

var arr = [1,2,3,4,5,6,7];
var sum = 0;
var ar = arr.forEach(function(elem){
sum+=elem*4;
});
console.log(ar);//undefined
console.log(arr);//[1,2,3,4,5,6,7]
console.log(sum);//112
````
### every()是对数组中的每一项运行给定函数，如果数组的每一项返回true，则返回true。
````
every从迭代开始，一旦有一个不符合条件，则不会继续迭代下去

var arr = [ 1, 2, 3, 4, 5, 6 ];
console.log( arr.every( function( item, index, array ){
    console.log( 'item=' + item + ',index='+index+',array='+array );
    return item > 3;
}));
````
### some()是对数组中每一项运行指定函数，如果该函数对任一项返回true，则返回true。
````
some一直在找符合条件的值，一旦找到，则不会继续迭代下去

var arr = [ 1, 2, 3, 4, 5, 6 ];
console.log( arr.some( function( item, index, array ){
    console.log( 'item=' + item + ',index='+index+',array='+array );
    return item > 3;
}));
````