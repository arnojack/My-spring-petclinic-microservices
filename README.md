[原项目地址](https://github.com/spring-petclinic/spring-petclinic-microservices)

扩展内容：
1.	前端方面，修改了主页格式，增加轮播图，将welcome页面美化。（如图2.1所示）

![image](https://user-images.githubusercontent.com/75239350/204224374-78ee6f0d-df1d-43a1-aa7f-05a027008781.png)
 
                                    图 2.1

增加了一个login页面和相关js（如图2.2所示），并注册路由。

 ![image](https://user-images.githubusercontent.com/75239350/204224411-c80add04-817d-412c-b780-825d1bb03dae.png)

                                    图 2.2

在app.js使用JavaScript实现了登录拦截（如图2.3所示），cookie（如图2.4所示）。

 ![image](https://user-images.githubusercontent.com/75239350/204224437-06fc67af-8613-4fa5-af10-bbdbe9d76b13.png)

                                    图 2.3
                                    
![image](https://user-images.githubusercontent.com/75239350/204224463-b0de8dec-52b9-4377-9cb4-f051478492a4.png)


                                    图 2.4

2.	后端方面，新增加了一个user-service微服务，（如图2.5所示）给api getway提供api用于登录验证。

 ![image](https://user-images.githubusercontent.com/75239350/204224498-0f6c3513-8c50-41d6-928e-936f031e787e.png)

                                    图 2.5


3.	数据库方面，新增加了一个user表，为user-service提供数据。如图2.6所示：

 ![image](https://user-images.githubusercontent.com/75239350/204224561-8811d45f-5006-4d10-966a-9288ecb50a25.png)

                                    图 2.6

软件结构：
软件组件如图2.7所示
API 网关没有任何后备数据库。它的端点通过调用其他支持服务并将结果聚合在一起来动态创建响应。它使那些支持服务不必公开可用。
客户、兽医和访问服务不需要公开，只需要 API 网关。管理服务器也不需要公共地址。相反，它可以使用 Azure 身份验证背后自动生成的“测试端点”。
 
应用程序仍将跟踪导出到 Zipkin 兼容服务。该服务提供了一个非常有用的地图，可通过 Azure Application Insights 中的 Application Map 深入了解详细信息。

 ![image](https://user-images.githubusercontent.com/75239350/204224582-c46d13a0-63cc-4e6e-a1c0-14b47a326e26.png)

图 2.7
