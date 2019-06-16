/**
 * 文件名：DateUtils.java
 * 描述：〈描述〉
 * 修改时间：2015-8-16 
 * 修改内容：〈修改内容〉
 */
/*
 * 文件名：DateUtils.java
 * 描述：〈描述〉
 * 修改时间：2015-8-16
 * 修改内容：〈修改内容〉
 */

package com.ssm.common.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

/**
 * 〈一句话功能简述〉 <br/>
 * 〈功能详细描述〉
 * 
 * @author Li
 * @version [版本号, 2015-8-16]
 * @see [相关类/方法]
 * @since [产品/模块版本]
 */
public class DateUtils {
	private static final Logger LOGGER = LogManager.getLogger(DateUtils.class);

	private static Map<Integer, String> numMap = new TreeMap<Integer, String>();

	private static final SimpleDateFormat sdf = new SimpleDateFormat();

	/** yyyy-MM-dd HH:mm:ss */
	public static final String DEFAULT_DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";

	public static final String PATTERN_YYYYMMDDHHMMSS = "yyyyMMddHHmmss";

	public static final String PATTERN_YYYYMMDD = "yyyyMMdd";

	/** ddHHmmss */
	public static final String VERSION_DATE_FORMAT = "ddHHmmss";

	/** yyyy-MM-dd*HH:mm:ss */
	public static final String DEFAULT_DATE_FORMAT2 = "yyyy-MM-dd*HH:mm:ss";

	/** HH:mm */
	public static final String DEFAULT_HOUR_FORMAT = "HH:mm";

	/** yyyy-MM-dd */
	public static final String DEFAULT_DAY_FORMAT = "yyyy-MM-dd";

	/** MddHHmmss */
	public static final String DEFAULT_IDEN_FORMAT = "MddHHmmss";

	/** HHmm */
	public static final String DEFAULT_IDEN_FORMAT2 = "HHmm";

	/** yyyy */
	public static final String DEFAULT_TO_YEAR = "yyyy";

	public static final String PATTERN_YYYYMMDDHH = "yyyyMMddHH";
	public static final String PATTERN_YYYYMMDDHHMM = "yyyyMMddHHmm";

	public static final int YEAR = 1;
	public static final int MONTH = 2;
	public static final int DAY = 3;
	public static final int HOUR = 4;
	public static final int MINUTE = 5;
	public static final int SECOND = 6;

	/**
	 * 
	 * 〈一句话功能简述〉 日期格式化 yyyy-MM-dd HH:mm:ss <br/>
	 * 〈功能详细描述〉
	 * 
	 * @param time
	 *            long转String
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public static String longToDateStrByDefault(long time) {
		return dateToStrByDefault(new Date(time));
	}

	/**
	 * 
	 * 〈一句话功能简述〉 日期格式化 pattern <br/>
	 * 〈功能详细描述〉
	 * 
	 * @param time
	 *            long转String
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public static String longToDateStrByPattern(String pattern, long time) {
		return dateToString(pattern, new Date(time));
	}

	/**
	 * 
	 * 〈一句话功能简述〉 日期格式化 yyyy-MM-dd HH:mm:ss <br/>
	 * 〈功能详细描述〉
	 * 
	 * @param date
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public static String dateToStrByDefault(Date date) {
		return dateToString(DEFAULT_DATE_FORMAT, date);
	}

	/**
	 * 
	 * 〈一句话功能简述〉日期格式化yyyy-MM-dd <br/>
	 * 〈功能详细描述〉
	 * 
	 * @param date
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public static String dateToStrByDay(Date date) {
		return dateToString(DEFAULT_DAY_FORMAT, date);
	}

	/**
	 * 
	 * 〈一句话功能简述〉 日期转换字符串 <br/>
	 * 〈功能详细描述〉
	 * 
	 * @param pattern
	 * @param date
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public static String dateToString(String pattern, Date date) {
		return dateFormatByPattern(pattern).format(date);
	}

	/**
	 * 
	 * 〈一句话功能简述〉 日期格式化 <br/>
	 * 〈功能详细描述〉
	 * 
	 * @param pattern
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public static DateFormat dateFormatByPattern(String pattern) {
		return new SimpleDateFormat(pattern);
	}

	/**
	 * 获取当前时间的前一天 〈一句话功能简述〉 〈功能详细描述〉
	 * 
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public static Date getDayBefore() {
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DATE, -1); // 得到前一天
		Date date = calendar.getTime();
		return date;
	}

	/**
	 * 获取指定时间的前一天 〈一句话功能简述〉 〈功能详细描述〉
	 * 
	 * @param date
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public static Date getDayBefore(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_MONTH, -1);
		date = calendar.getTime();
		return date;
	}

	public static boolean isParseDateOK(String str, String pattern) {
		SimpleDateFormat format = new SimpleDateFormat(pattern);
		try {
			format.parse(str);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	/**
	 * 获得指定日期的前一天
	 * 
	 * @param specifiedDay
	 * @return
	 * @throws Exception
	 */
	public static String getSpecifiedDayBefore(String specifiedDay) {// 可以用new
		// Date().toLocalString()传递参数
		Calendar c = Calendar.getInstance();
		Date date = null;
		try {
			date = new SimpleDateFormat(DEFAULT_DAY_FORMAT).parse(specifiedDay);
		} catch (ParseException e) {
			LOGGER.error(e);
		}
		c.setTime(date);
		int day = c.get(Calendar.DATE);
		c.set(Calendar.DATE, day - 1);

		String dayBefore = new SimpleDateFormat(DEFAULT_DAY_FORMAT).format(c.getTime());
		return dayBefore;
	}

	/**
	 * 获得指定日期的后一天
	 * 
	 * @param specifiedDay
	 * @return
	 */
	public static String getSpecifiedDayAfter(String specifiedDay) {
		Calendar c = Calendar.getInstance();
		Date date = null;
		try {
			date = new SimpleDateFormat(DEFAULT_DAY_FORMAT).parse(specifiedDay);
		} catch (ParseException e) {
			LOGGER.error(e);
		}
		c.setTime(date);
		int day = c.get(Calendar.DATE);
		c.set(Calendar.DATE, day + 1);

		String dayAfter = new SimpleDateFormat(DEFAULT_DAY_FORMAT).format(c.getTime());
		return dayAfter;
	}

	public static Date parseString2Date(String pattern, String dateStr) {

		try {
			return dateFormatByPattern(pattern).parse(dateStr);
		} catch (Exception e) {
			LOGGER.error(e);
		}
		return null;
	}

	public static Date parseString2Date(String dateStr) {

		try {
			return dateFormatByPattern(DEFAULT_DATE_FORMAT).parse(dateStr);
		} catch (Exception e) {
			LOGGER.error(e);
		}

		return null;
	}

	/**
	 * 计算两个日期之间相差的天数
	 * 
	 * @param smdate
	 *            较小的时间
	 * @param bdate
	 *            较大的时间
	 * @return 相差天数
	 * @throws ParseException
	 */
	public static int daysBetween(Date smdate, Date bdate) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		smdate = sdf.parse(sdf.format(smdate));
		bdate = sdf.parse(sdf.format(bdate));
		Calendar cal = Calendar.getInstance();
		cal.setTime(smdate);
		long time1 = cal.getTimeInMillis();
		cal.setTime(bdate);
		long time2 = cal.getTimeInMillis();
		long between_days = (time2 - time1) / (1000 * 3600 * 24);

		return Integer.parseInt(String.valueOf(between_days));
	}

	/**
	 * 字符串的日期格式的计算
	 */
	public static int daysBetween(String smdate, String bdate) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.setTime(sdf.parse(smdate));
		long time1 = cal.getTimeInMillis();
		cal.setTime(sdf.parse(bdate));
		long time2 = cal.getTimeInMillis();
		long between_days = (time2 - time1) / (1000 * 3600 * 24);

		return Integer.parseInt(String.valueOf(between_days));
	}

	public static void setPhaseNumMap() {
		// numMap.put(0, "120");
		numMap.put(5, "001");
		numMap.put(10, "002");
		numMap.put(15, "003");
		numMap.put(20, "004");
		numMap.put(25, "005");
		numMap.put(30, "006");
		numMap.put(35, "007");
		numMap.put(40, "008");
		numMap.put(45, "009");
		numMap.put(50, "010");
		numMap.put(55, "011");
		numMap.put(60, "012");
		numMap.put(65, "013");
		numMap.put(70, "014");
		numMap.put(75, "015");
		numMap.put(80, "016");
		numMap.put(85, "017");
		numMap.put(90, "018");
		numMap.put(95, "019");
		numMap.put(100, "020");
		numMap.put(105, "021");
		numMap.put(110, "022");
		numMap.put(115, "023");

		numMap.put(600, "024");
		numMap.put(610, "025");
		numMap.put(620, "026");
		numMap.put(630, "027");
		numMap.put(640, "028");
		numMap.put(650, "029");
		numMap.put(660, "030");
		numMap.put(670, "031");
		numMap.put(680, "032");
		numMap.put(690, "033");
		numMap.put(700, "034");
		numMap.put(710, "035");
		numMap.put(720, "036");
		numMap.put(730, "037");
		numMap.put(740, "038");
		numMap.put(750, "039");
		numMap.put(760, "040");
		numMap.put(770, "041");
		numMap.put(780, "042");
		numMap.put(790, "043");
		numMap.put(800, "044");
		numMap.put(810, "045");
		numMap.put(820, "046");
		numMap.put(830, "047");
		numMap.put(840, "048");
		numMap.put(850, "049");
		numMap.put(860, "050");
		numMap.put(870, "051");
		numMap.put(880, "052");
		numMap.put(890, "053");
		numMap.put(900, "054");
		numMap.put(910, "055");
		numMap.put(920, "056");
		numMap.put(930, "057");
		numMap.put(940, "058");
		numMap.put(950, "059");
		numMap.put(960, "060");
		numMap.put(970, "061");
		numMap.put(980, "062");
		numMap.put(990, "063");
		numMap.put(1000, "064");
		numMap.put(1010, "065");
		numMap.put(1020, "066");
		numMap.put(1030, "067");
		numMap.put(1040, "068");
		numMap.put(1050, "069");
		numMap.put(1060, "070");
		numMap.put(1070, "071");
		numMap.put(1080, "072");
		numMap.put(1090, "073");
		numMap.put(1100, "074");
		numMap.put(1110, "075");
		numMap.put(1120, "076");
		numMap.put(1130, "077");
		numMap.put(1140, "078");
		numMap.put(1150, "079");
		numMap.put(1160, "080");
		numMap.put(1170, "081");
		numMap.put(1180, "082");
		numMap.put(1190, "083");
		numMap.put(1200, "084");
		numMap.put(1210, "085");
		numMap.put(1220, "086");
		numMap.put(1230, "087");
		numMap.put(1240, "088");
		numMap.put(1250, "089");
		numMap.put(1260, "090");
		numMap.put(1270, "091");
		numMap.put(1280, "092");
		numMap.put(1290, "093");
		numMap.put(1300, "094");
		numMap.put(1310, "095");
		numMap.put(1320, "096");

		numMap.put(1325, "097");
		numMap.put(1330, "098");
		numMap.put(1335, "099");
		numMap.put(1340, "100");
		numMap.put(1345, "101");
		numMap.put(1350, "102");
		numMap.put(1355, "103");
		numMap.put(1360, "104");
		numMap.put(1365, "105");
		numMap.put(1370, "106");
		numMap.put(1375, "107");
		numMap.put(1380, "108");
		numMap.put(1385, "109");
		numMap.put(1390, "110");
		numMap.put(1395, "111");
		numMap.put(1400, "112");
		numMap.put(1405, "113");
		numMap.put(1410, "114");
		numMap.put(1415, "115");
		numMap.put(1420, "116");
		numMap.put(1425, "117");
		numMap.put(1430, "118");
		numMap.put(1435, "119");

		numMap.put(1440, "120");
	}

	public static String getPhasenum() {
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat time = new SimpleDateFormat("yyyyMMdd");
		String strDay = time.format(new java.util.Date());

		int hour = calendar.get(Calendar.HOUR_OF_DAY);
		int min = calendar.get(Calendar.MINUTE);

		return getPhasenum(strDay, hour, min);
	}

	public static String getPhasenum(String strDay, int hour, int min) {
		String realPhaseNum = null;
		int curInt = hour * 60 + min;
		Set<Integer> set = numMap.keySet();
		Iterator<Integer> it = set.iterator();
		while (it.hasNext()) {
			int tempInt = it.next();
			if (curInt < tempInt) {
				realPhaseNum = strDay + numMap.get(tempInt);
				return realPhaseNum;
			}

		}
		return "";
	}



	/**
	 * 
	 * 〈一句话功能简述〉 获取指定月的第一天 <br/>
	 * 〈功能详细描述〉
	 * 
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public static String getMonthFirstDay(String pattern,String date) {
		try {
			Calendar cal = Calendar.getInstance();
			cal.setTime(parseString2Date(pattern, date));
			cal.set(Calendar.DAY_OF_MONTH, 1);
			return dateToStrByDay(cal.getTime());
		} catch (Exception e) {
			LOGGER.error(e);
		}

		return "";
	}

	/**
	 * 
	 * 〈一句话功能简述〉获取指定月的最后一天 <br/>
	 * 〈功能详细描述〉
	 * 
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public static String getMonthLastDay(String pattern,String date) {
		try {
			Calendar cal = Calendar.getInstance();
			cal.setTime(parseString2Date(pattern, date));
			cal.set(Calendar.DAY_OF_MONTH, 1);
			cal.roll(Calendar.DAY_OF_MONTH, -1);
			return dateToStrByDay(cal.getTime());
		} catch (Exception e) {
			LOGGER.error(e);
		}

		return "";
	}

	/**
	 * 
	 * 〈一句话功能简述〉 获取当前月的第一天 <br/>
	 * 〈功能详细描述〉
	 * 
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public static String getCurrentMonthFirstDay() {
		try {
			Calendar cal = Calendar.getInstance();
			cal.setTime(new Date());
			cal.set(Calendar.DAY_OF_MONTH, 1);
			return dateToStrByDay(cal.getTime());
		} catch (Exception e) {
			LOGGER.error(e);
		}

		return "";
	}

	/**
	 * 
	 * 〈一句话功能简述〉获取当前月的最后一天 <br/>
	 * 〈功能详细描述〉
	 * 
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public static String getCurrentMonthLastDay() {
		try {
			Calendar cal = Calendar.getInstance();
			cal.setTime(new Date());
			cal.set(Calendar.DAY_OF_MONTH, 1);
			cal.roll(Calendar.DAY_OF_MONTH, -1);
			return dateToStrByDay(cal.getTime());
		} catch (Exception e) {
			LOGGER.error(e);
		}

		return "";
	}

	/**
	 * 
	 * 〈一句话功能简述〉 获取当前周的第一天 <br/>
	 * 〈功能详细描述〉
	 * 
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public static String getCurrentWeekFirstDay() {
		try {
			Calendar cal = new GregorianCalendar();
			cal.setFirstDayOfWeek(Calendar.MONDAY);
			cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
			cal.set(Calendar.HOUR_OF_DAY, 0);
			cal.set(Calendar.MINUTE, 0);
			cal.set(Calendar.SECOND, 0);

			return dateToStrByDay(cal.getTime());
		} catch (Exception e) {
			LOGGER.error(e);
		}

		return "";
	}

	/**
	 * 
	 * 〈一句话功能简述〉获取当前周的最后一天 <br/>
	 * 〈功能详细描述〉
	 * 
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public static String getCurrentWeekLastDay() {
		try {
			Calendar cal = new GregorianCalendar();
			cal.setFirstDayOfWeek(Calendar.MONDAY);
			cal.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
			cal.set(Calendar.HOUR_OF_DAY, 23);
			cal.set(Calendar.MINUTE, 59);
			cal.set(Calendar.SECOND, 59);

			return dateToStrByDay(cal.getTime());
		} catch (Exception e) {
			LOGGER.error(e);
		}

		return "";
	}

	/**
	 * 
	 *〈一句话功能简述〉 判断时间time是否落在startMin ~ endMin 或者 startMin2 ~ endMin2 <br/>
	 * 〈功能详细描述〉
	 * @param time
	 * @param startMin     开始时间    值为小于0的表示不比较
	 * @param endMin       结束时间    值为小于0的表示不比较
	 * @param startMin2         开始时间2   值为小于0的表示不比较
	 * @param endMin2              结束时间2   值为小于0的表示不比较
	 * @return        true：区间内     false：区间外
	 * @see  [类、类#方法、类#成员]
	 */
	public static boolean betweenDesignTime(Date time, int startMin, int endMin, int startMin2, int endMin2)
	{
		try
		{
			int curMin = Integer.parseInt(dateToString(DEFAULT_IDEN_FORMAT2, time));

			if((startMin>=0 && endMin>=0) && (curMin >= startMin) && (curMin <= endMin))
			{
				return true;
			}

			if((startMin2>=0 && endMin2>=0) && (curMin >= startMin2) && (curMin <= endMin2))
			{
				return true;
			}
		}
		catch(Exception e)
		{
			LOGGER.error(e);
		}

		return false;
	}

	@SuppressWarnings("deprecation")
	public static String getTodayInLastYear(){
		sdf.applyPattern(DEFAULT_DAY_FORMAT);
		Date now = new Date();
		now.setYear(now.getYear()-1);
		now.setDate(now.getDate()+1);
		return sdf.format(now);
	}

	/**
	 * yyyy-MM-dd HH:mm:ss
	 * @return
	 */
	public static String getNowFullDate(){
		sdf.applyPattern(DEFAULT_DATE_FORMAT);
		return sdf.format(System.currentTimeMillis());
	}

	/**
	 * yyyy-MM-dd
	 * @return
	 */
	public static String getNowDate(){
		sdf.applyPattern(DEFAULT_DAY_FORMAT);
		return sdf.format(System.currentTimeMillis());
	}

	@SuppressWarnings("deprecation")
	public static String getDateOffSet(String datet, int offset, int type,String inPatt,String outPatt) throws ParseException {
		sdf.applyPattern(inPatt);
		Date cur = sdf.parse(datet);
		sdf.applyPattern(outPatt);
		switch (type) {
		case YEAR:
			cur.setYear(cur.getYear()+offset);
			return sdf.format(cur);
		case MONTH:
			cur.setMonth(cur.getMonth()+offset);
			return sdf.format(cur);
		case DAY:
			cur.setDate(cur.getDate()+offset);
			return sdf.format(cur);
		case HOUR:
			cur.setHours(cur.getHours()+offset);
			return sdf.format(cur);
		case MINUTE:
			cur.setMinutes(cur.getMinutes()+offset);
			return sdf.format(cur);
		case SECOND:
			cur.setSeconds(cur.getSeconds()+offset);
			return sdf.format(cur);
		default:
			throw new ParseException("错误时间偏移类型", type);
		}
	}
}
