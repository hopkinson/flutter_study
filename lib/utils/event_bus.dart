// EVENT-BUS

//订阅者回调签名
typedef void EventCallback(arg);

class _EventBus {
  var _emap = new Map<Object, List<EventCallback>>();

  // 添加订阅者
  void on(eventName, EventCallback f) {
    if (eventName == null || f == null) return;
    _emap[eventName] ??= new List<EventCallback>();
    _emap[eventName].add(f);
  }

  void off(eventName, [EventCallback f]) {
    var list = _emap[eventName];
    if (eventName == null || f == null) return;
    if (f == null) {
      _emap[eventName] = null;
    } else {
      list.remove(f);
    }
  }

  //触发事件，事件触发后该事件所有订阅者会被调用
  void emit(eventName, [arg]) {
    var list = _emap[eventName];
    if (list == null) return;
    int len = list.length - 1;
    //反向遍历，防止在订阅者在回调中移除自身带来的下标错位
    for (var i = len; i > -1; --i) {
      list[i](arg);
    }
  }
}

_EventBus eventBus = new _EventBus();

/**
* 页面A中
* 监听登录事件
* bus.on("login", (arg) {
*   doFunction
* });
*
* 登录页B中
* 登录成功后触发登录事件，页面A中订阅者会被调用
* bus.emit("login", userInfo);
*
*/
