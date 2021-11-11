package com.whale.base.util;

import java.util.HashMap;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.ReentrantLock;

/**
 * @Author: sy
 * @Date: Created by 2021/9/8 9:01
 * @description:
 */
public class SegmentLockUtil {


    /**
     * //默认分段数量
     */
    private Integer segments = 30;
    private final HashMap<Integer, ReentrantLock> lockMap = new HashMap<>();

    public  SegmentLockUtil() {
        init(null, false);
    }

    public SegmentLockUtil(Integer counts, boolean fair) {
        init(counts, fair);
    }

    private void init(Integer counts, boolean fair) {
        if (counts != null) {
            segments = counts;
        }
        for (int i = 0; i < segments; i++) {
            lockMap.put(i, new ReentrantLock(fair));
        }
    }

    public void lock(String key) {
        int  hash = key.hashCode() & Integer.MAX_VALUE;
        ReentrantLock lock = lockMap.get(hash % segments );
        lock.lock();
    }

    /**
     * 等待时间
     * @param key 锁的key
     * @param time 等待时间
     * @throws InterruptedException
     */
    public boolean tryLock(String key,long time) throws InterruptedException {
        ReentrantLock lock = lockMap.get(key.hashCode() % segments);
        return lock.tryLock(time, TimeUnit.SECONDS);
    }

    public void unlock(String key) {
        int  hash = key.hashCode() & Integer.MAX_VALUE;
        ReentrantLock lock = lockMap.get(hash % segments);
        if(lock.isHeldByCurrentThread()){
            lock.unlock();
        }
    }
}
