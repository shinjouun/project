package cving.util;
import java.time.LocalDate;

public class Calage //연령대를만들어주기 위한 기능함수
{
	LocalDate now = LocalDate.now(); // 이번년도 가져오기 위한 클래스
	
	public String age(String birth)
	{
		birth = birth.substring(0,4); //년도
		int year = this.now.getYear(); // 이번년도
		int birthyear = Integer.parseInt(birth);
		int realAge = year - birthyear + 1;
		if(realAge>=10 && realAge < 20)
		{
			birth = "teenage";
		}
		else if(realAge>=20 && realAge < 30)
		{
			birth ="twenty";
		}
		else if(realAge>=30 && realAge < 40)
		{
			birth = "thirty";
		}
		else if(realAge>=40 && realAge < 50)
		{
			birth = "forty";
		}
		else
		{
			birth = "fifty";
		}
		return birth;
	}
}
