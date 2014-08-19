Unrecognized selector
=======
在调用performSelector时如果忘记了检查selector是否存在(respondsToSelector)，则很容易造成unrecognized selector exception,  这里提供一个简单方便的方案解决unrecognized selector报错的问题

<img src="https://raw.githubusercontent.com/achellies/iOSNoUnRecognizedSelectorException/master/snapshot.png" width=480>
