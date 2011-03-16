package cn.easy.js.fan.kernal;

public interface ISchedulerUnit {
	  public abstract void OnTimer(long paramLong);
	  public abstract void action();
	  public abstract void registSelf();
}
