using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Globalization;
using System.Text;

/// <summary>
/// Summary description for persiandate
/// </summary>
public class persiandate
{
    public static string Miladi2Shamsi(DateTime _date)
    {

        PersianCalendar pc = new PersianCalendar();
        StringBuilder sb = new StringBuilder();
        sb.Append(pc.GetYear(_date).ToString("0000"));
        sb.Append("/");
        sb.Append(pc.GetMonth(_date).ToString("00"));
        sb.Append("/");
        sb.Append(pc.GetDayOfMonth(_date).ToString("00"));
        return sb.ToString();



    }
  
    public static string GetDeffYear(DateTime _date)
    {

        PersianCalendar pc = new PersianCalendar();
        StringBuilder sb = new StringBuilder();
        sb.Append(pc.GetYear(_date).ToString("0000"));
        return sb.ToString();



    }
    public DateTime Shamsi2Miladi(string _date)
    {
        int year = int.Parse(_date.Substring(0, 4));
        int month = int.Parse(_date.Substring(5, 2));
        int day = int.Parse(_date.Substring(8, 2));
        PersianCalendar p = new PersianCalendar();

        DateTime date = p.ToDateTime(year, month, day, 0, 0, 0, 0);
        return date;


    }

    public static string dtcur(string sal, string mah, string rooz)
    {
        if (mah.Length < 2)
        {
            mah = "0" + mah;
        }
        if (rooz.Length < 2)
        {
            rooz = "0" + rooz;
        }
        return sal + "/" + mah + "/" + rooz;
    }
}