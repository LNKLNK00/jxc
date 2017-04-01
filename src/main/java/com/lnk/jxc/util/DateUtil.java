package com.lnk.jxc.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateFormatUtils;
import org.apache.commons.lang.time.DateUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DateUtil {

    private static Logger LOG = LoggerFactory.getLogger(DateUtil.class);

    public static final String YYYY_MM_FROMAT = "yyyy-MM";
    public static final String YYYY_MM_DD_FROMAT = "yyyy-MM-dd";

    /**
     * 获取上个月的字符串格式"yyyy-MM"
     * @param monthly
     * @return
     */
    public static String getPrevMonthly(String monthly) {
        String prevMonthly = "";
        if (StringUtils.isBlank(monthly)) {
            return prevMonthly;
        }
        try {
            Date date = DateUtils.parseDate(monthly, new String[] { YYYY_MM_FROMAT });
            Date prevDate = DateUtils.addMonths(date, -1);
            prevMonthly = DateFormatUtils.format(prevDate, "yyyy-MM");
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return prevMonthly;
    }

    /**
     * 获取前后N个月的字符串格式"yyyy-MM"
     * @param monthly
     * @return
     */
    public static String getDiffMonthly(String monthly, int month) {
        String prevMonthly = "";
        if (StringUtils.isBlank(monthly)) {
            return prevMonthly;
        }
        try {
            Date date = DateUtils.parseDate(monthly, new String[] { YYYY_MM_FROMAT });
            Date prevDate = DateUtils.addMonths(date, month);
            prevMonthly = DateFormatUtils.format(prevDate, "yyyy-MM");
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return prevMonthly;
    }

    /**
     * 任务计算时间范围
     * @return
     */
    public static Map<String, Object> taskTimeParams() {
        Date today = Calendar.getInstance().getTime();
        Date endDate = DateUtils.truncate(today, Calendar.DAY_OF_MONTH);
        Date startDate = DateUtils.truncate(today, Calendar.MONTH);
        Map<String, Object> params = new HashMap<>();
        params.put("startDate", startDate);
        params.put("endDate", endDate);
        return params;
    }

    public static Map<String, Object> taskTimeParams(String date, String pattern) {
        Date today = Calendar.getInstance().getTime();
        try {
            today = DateUtils.parseDate(date, new String[] { pattern });
        } catch (ParseException e) {
            LOG.error("日期解析错误，date={}， pattern={}", date, pattern);
        }
        Date startDate = DateUtils.truncate(today, Calendar.DAY_OF_MONTH);
        Date endDate = DateUtils.addMonths(startDate, 1);
        Map<String, Object> params = new HashMap<>();
        params.put("startDate", startDate);
        params.put("endDate", endDate);
        return params;
    }

    /**
     * 上月年月日期 , 例 2017-03
     * @return
     */
    public static Date truncateLastMonth() {
        Calendar date = Calendar.getInstance();
        date.add(Calendar.MONTH, -1);
        return DateUtils.truncate(date, Calendar.MONTH).getTime();
    }

    /**
     * 上月年月日期
     * @return
     */
    public static String formatLastMonth(String pattern) {
        Calendar date = Calendar.getInstance();
        date.add(Calendar.MONTH, -1);
        return DateFormatUtils.format(date, pattern);
    }

    /**
     * 当前年月
     * @param pattern
     * @return
     */
    public static String formatCurrentDate(String pattern) {
        Calendar date = Calendar.getInstance();
        return DateFormatUtils.format(date, pattern);
    }

    /**
     * 判断字符串是否合法时间
     * @param data
     * @param pattern
     * @return
     */
    public static boolean isLegitimate(String data, String pattern) {
        SimpleDateFormat format = new SimpleDateFormat(pattern);
        boolean flag = true;
        try {
            format.parse(data);
        } catch (ParseException e) {
            flag = false;
        }
        return flag;
    }

    /**
     * 获取当月第一天
     * @return
     */
    public static Date getFirstDayThisMonth() {
        Calendar c = Calendar.getInstance();
        c.add(Calendar.MONTH, 0);
        c.set(Calendar.DAY_OF_MONTH, 1);//设置为1号,当前日期既为本月第一天
        return c.getTime();
    }

    /**
     * 获取当月最后一天
     * @return
     */
    public static Date getLastDayThisMonth() {
        Calendar ca = Calendar.getInstance();
        ca.set(Calendar.DAY_OF_MONTH, ca.getActualMaximum(Calendar.DAY_OF_MONTH));
        return ca.getTime();
    }

    /***
     * 时间按格式格式化
     * @param date
     * @param pattern
     * @return
     */
    public static String format(Date date, String pattern) {
        SimpleDateFormat format = new SimpleDateFormat(pattern);
        return format.format(date);
    }

}
