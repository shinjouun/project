package cving.util;
import java.time.LocalDate;

public class Calage //���ɴ븦������ֱ� ���� ����Լ�
{
	LocalDate now = LocalDate.now(); // �̹��⵵ �������� ���� Ŭ����
	
	public String age(String birth)
	{
		birth = birth.substring(0,4); //�⵵
		int year = this.now.getYear(); // �̹��⵵
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
