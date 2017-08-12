开发过程说明：
1.创建实体类，实体类的属性与数据库的字段名一一对应
2.创建实体类对应的dao接口
3.创建dao接口对应的mapper.xml
4.在mabatis-config.xml中配置实体类和对应的dao的别名，以及注册mapper.xml文件
5.在dao接口对应的mapper.xml中实现接口中的方法（注意名字要一一对应）
7.创建dao接口的实现类
8.创建service