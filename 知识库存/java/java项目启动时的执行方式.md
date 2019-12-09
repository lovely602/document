## 程序启动的多种方法
在程序启动时去执行的方法，比如说去读取某个配置，预加载缓存，定时任务的初始化等。

###第一种方法：@PostConstruct注解
    使用@PostConstruct注解。在spring加载这个类时执行一次。
	@Component
	public class Test {
			
			public Test(){
				System.out.println("我最先执行");
			}
			
			/**
			*我第二个执行
			*/
			@Autowired
			private T t;
			
			/**
			*我第三个个执行
			*/
			@PostConstruct
			private void init(){
				//假装有代码
			}
	 }
### 第二种方法：CommandLineRunner接口
    使用CommandLineRunner接口类似于main方法启动，可以接受一个字符串数组的命令行参数。
	@Component
	public class MyCommandLineRunner implements CommandLineRunner{

		@Override
		public void run(String... args) throws Exception{
			//假装有代码
		}
	}
### 第三种方法:ApplicationRunner接口
    这种方式与实现CommandLineRunner接口的区别就是他的参数是ApplicationArguments.
	@Order(value = 1)
	@Component
	public class MyApplicationRunner implements ApplicationRunner{

		@Override
		public void run(ApplicationArguments args) throws Exception{
			//假装有代码
		}
	}