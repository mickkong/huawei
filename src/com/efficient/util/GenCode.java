package com.efficient.util;

/**
 * 自动生成订单编号
 * 
 * @author mickkong
 * @Date 2017/07
 */
public class GenCode {

	private final long workerId = 2;
	private final static long twepoch = 1288834974657L;
	private long sequence = 0L;
	private final static long workerIdBits = 4L;
	public final static long maxWorkerId = -1L ^ -1L << workerIdBits;
	private final static long sequenceBits = 10L;
	private final static long workerIdShift = sequenceBits;
	private final static long timestampLeftShift = sequenceBits + workerIdBits;
	public final static long sequenceMask = -1L ^ -1L << sequenceBits;
	private long lastTimestamp = -1L;

	public GenCode() {
	}

	/**
	 * 主要生成代码
	 * 
	 * @return
	 */
	public synchronized String nextCode() {
		long timestamp = System.currentTimeMillis();
		if (this.lastTimestamp == timestamp) {
			this.sequence = (this.sequence + 1) & sequenceMask;
			if (this.sequence == 0) {
				System.out.println("###########" + sequenceMask);
				timestamp = this.tilNextMillis(this.lastTimestamp);
			}
		} else {
			this.sequence = 0;
		}
		if (timestamp < this.lastTimestamp) {
			try {
				throw new Exception(
						String
								.format(
										"Clock moved backwards. Refusing to generate id for %d milliseconds",
										this.lastTimestamp - timestamp));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		this.lastTimestamp = timestamp;
		long nextId = ((timestamp - twepoch << timestampLeftShift))
				| (this.workerId << workerIdShift) | (this.sequence);
		String nextCode = new String(nextId + "");
		return nextCode;
	}

	private long tilNextMillis(final long lastTimestamp) {
		long timestamp = System.currentTimeMillis();
		while (timestamp <= lastTimestamp) {
			timestamp = System.currentTimeMillis();
		}
		return timestamp;
	}

	/**
	 * 测试类
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
		GenCode genCode = new GenCode();
		System.out.println("编码：" + genCode.nextCode());
	}

}
