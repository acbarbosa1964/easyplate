package cn.easy.js.fan.kernal;

import java.util.Iterator;
import java.util.Vector;
import org.apache.log4j.Logger;

public class Scheduler extends Thread {
	static Logger logger = Logger.getLogger(Scheduler.class.getName());

	private static long updateInterval = 5000L;

	public static long currentTime;

	private Vector units = new Vector();

	private static Scheduler scheduler = null;

	final int DO_WORK = 1;

	final int DO_PAUSE = 2;

	final int DO_EXIT = 0;

	private int action = 1;

	public Scheduler(long updateInterval) {
		updateInterval = updateInterval;

		setDaemon(true);
		setName("cn.easy.js.fan.kernal.Scheduler");

		start();
	}

	public static synchronized void initInstance(long updateInterval) {
		if (scheduler == null)
			scheduler = new Scheduler(updateInterval);
	}

	public void run() {
		while (this.action != 0)
			while (true) {
				if (this.action == 1) {
					currentTime = System.currentTimeMillis();

					Iterator ir = this.units.iterator();
					while (ir.hasNext()) {
						ISchedulerUnit isu = (ISchedulerUnit) ir.next();
						isu.OnTimer(currentTime);
					}
				}
				try {
					sleep(updateInterval);
				} catch (InterruptedException ie) {
				}
			}
		logger.info("Scheduler exit.");
	}

	public void setUpdateInterval(long updateInterval) {
		updateInterval = updateInterval;
	}

	public synchronized void UnitsOperate(ISchedulerUnit isu,
			boolean AddTrueDelFalse) {
		if (AddTrueDelFalse) {
			this.units.addElement(isu);
		} else
			this.units.remove(isu);
	}

	public static synchronized Scheduler getInstance() {
		if (scheduler == null)
			initInstance(updateInterval);
		return scheduler;
	}

	public Vector getUnits() {
		return this.units;
	}

	public void ClearUnits() {
		this.units.clear();
	}

	public void doExit() {
		getInstance().action = 0;
	}

	public void doPause() {
		getInstance().action = 2;
	}

	public void doResume() {
		getInstance().action = 1;
	}
}
