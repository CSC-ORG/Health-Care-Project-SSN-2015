package notify.email;

import java.util.Calendar;

/**
 *
 * @author Keerthana
 */
public abstract class Misc {
	private static int getVal(String s)
    {
        int dows=0;
        switch(s)
        {
            case "Sun":
                dows=1;
                break;
            case "Mon":
                dows=2;
                break;
            case "Tue":
                dows=3;
                break;
            case "Wed":
                dows=4;
                break;
            case "Thu":
                dows=5;
                break;
            case "Fri":
                dows=6;
                break;
            case "Sat":
                dows=7;
                break;                
        }
    return dows;
    }
    public static String getDates(String selected)
    {
        String[] selectedsplit=selected.split(" ");
        String selDay=selectedsplit[0];
        int selv=getVal(selDay);
        Calendar cal = Calendar.getInstance();
        String tdate=cal.getTime().toString();
        String[] s=tdate.split(" ");
        int i;
        for(i=1;i<=7;i++)
        {
            cal.add(Calendar.DAY_OF_YEAR,+1);
            String tdaten=cal.getTime().toString();
        String[] sn=tdaten.split(" ");
            if(getVal(sn[0])==selv)
                break;
        }
        String d1=cal.getTime().toString();
        String[] s1=d1.split(" ");
        cal.add(Calendar.DAY_OF_YEAR,+7);
        String d2=cal.getTime().toString();
        String[] s2=d2.split(" ");
        
        String retDate=s1[2]+" "+s1[1]+" "+s1[5]+";"+s2[2]+" "+s2[1]+" "+s2[5];
        return retDate;
    }
    public static String Encrypt(String s) {
        String s1="";
        for(int i=0;i<s.length();i++)
        {
            s1+=(char)((float)s.charAt(i)-i+30);
        }
        return s1;
    }

    public static String Decrypt(String s) {
        String s1="";
        for(int i=0;i<s.length();i++)
        {
            s1+=(char)((float)s.charAt(i)+i-30);
        }
        return s1;
    }


}
