
1. HTTP协议：连接器监听8080端口，负责建立HTTP连接。在通过浏览器访问Tomcat服务器的Web应用时，使用的就是这个连接器
2. AJP协议：连接器监听8009端口，负责和其他的HTTP服务器建立连接。在把Tomcat与其他HTTP服务器集成时，就需要用到这个连接器

注意：
- AJP(Apache JServ Protocol)是定向包协议。因为性能原因，使用二进制格式来传输可读性文本。WEB服务器通过TCP连接和SERVLET容器连接。
   
- WEB服务器一般维持和Web容器的多个TCP Connecions，即TCP连接池，多个request/respons循环重用同一个Connection。
   
- 但是当Connection被分配（Assigned）到某个请求时，该请求完成之前，其他请求不得使用该连接