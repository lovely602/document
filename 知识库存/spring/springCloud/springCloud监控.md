## SpringCloud监控

actuator是SpringBoot的一个starter，Spring Boot Actuator。
我们使用SpringCloud的时候需要使用这个组件对应用程序进行监控与管理

actuator可以为我们提供以下端点：

|访问路径|描述|
|---|---|
|/actuator/auditevents	|显示当前应用程序的审计事件信息|
|/actuator/beans	|显示一个应用中所有Spring Beans的完整列表|
|/actuator/conditions	|显示配置类和自动配置类的状态及它们被应用或未被应用的原因|
|/actuator/configprops	|显示一个所有@ConfigurationProperties的集合列表|
|/actuator/env	|显示来自Spring的 ConfigurableEnvironment的属性|
|/actuator/features	|显示系统启动的一些features|
|/actuator/health	|显示应用的健康信息|
|/actuator/httptrace	|最后100个HTTP请求|
|/actuator/info	|显示任意的应用信息|
|/actuator/metrics	|展示当前应用的metrics信息|
|/actuator/mappings	|显示一个所有@RequestMapping路径的集合列表|
|/actuator/refresh	|更新配置|
|/actuator/scheduledtasks	|显示应用程序中的定时任务|
|/actuator/service-registry	|当前应用在注册中心的状态|
|/actuator/shutdown	|允许应用以优雅的方式关闭|
|/actuator/threaddump	|执行一个线程dump|
|/actuator/heapdump	|返回一个GZip压缩的hprof堆dump文件|
|/actuator/loggers	|返回系统的一些日志|
