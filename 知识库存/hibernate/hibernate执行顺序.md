# hibernate执行顺序

hibernate的执行顺序如下：
1. 生成一个事务的对象，并标记当前的 Session 处于事务状态（注：此时并未启动数据库级事务）。 
2. 应用使用 s.save 保存对象，这个时候 Session 将这个对象放入 entityEntries ，用来标记对象已经和当前的会话建立了关联，
由于应用对对象做了保存的操作， Session 还要在 insertions 中登记应用的这个插入行为（行为包括：对象引用、对象 id 、 Session 、持久化处理类）。
3. s.evict 将对象从 s 会话中拆离，这时 s 会从 entityEntries 中将这个对象移出。 
4. 事务提交，需要将所有缓存 flush 入数据库， Session 启动一个事务，并按照 insert,update,……,delete 的顺序提交所有之前登记的操作
（注意：所有 insert 执行完毕后才会执行 update ，这里的特殊处理也可能会将你的程序搞得一团糟，如需要控制操作的执行顺序，要善于使用flush ），
现在对象不在 entityEntries 中，但在执行 insert 的行为时只需要访问 insertions 就足够了，
所以此时不会有任何的异常。异常出现在插入后通知 Session 该对象已经插入完毕这个步骤上，
这个步骤中需要将 entityEntries 中对象的 existsInDatabase 标志置为 true ，
由于对象并不存在于 entityEntries 中，此时 Hibernate 就认为 insertions 和 entityEntries 可能因为线程安全的问题产生了不同步
（也不知道 Hibernate 的开发者是否考虑到例子中的处理方式，如果没有的话，这也许算是一个 bug 吧），
于是一个 net.sf.hibernate.AssertionFailure 就被抛出，程序终止。