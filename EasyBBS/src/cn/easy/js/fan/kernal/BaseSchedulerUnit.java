package cn.easy.js.fan.kernal;

public class BaseSchedulerUnit implements ISchedulerUnit {
	int count = -1;

	public long lastTime = 0L;

	public long interval = 5000L;

	int TYPE_INTERVAL = 0;

	int type = this.TYPE_INTERVAL;

	public static String name = "Base Scheduler Unit";

	public static String getName() {
		return name;
	}

	public void OnTimer(long currentTime) {
		if (this.lastTime + this.interval > currentTime)
			;
		this.lastTime = currentTime;
	}

	public void setInterval(long interval) {
		this.interval = interval;
	}

	public long getInterval() {
		return this.interval;
	}

	public synchronized void action() {
	}

	public void registSelf() {
		Scheduler.getInstance().UnitsOperate(this, true);
	}
}
