package cving.vo;

public class UserVO 
{
	private String uno;		//ȸ����ȣ
	private String uid;		//���̵�
	private String uname;	//�̸�
	private String uage;	//����
	private String ugender; //����
	private String uhobby;	//��ȣ �帣
	
	public void setUno(String uno)         { this.uno = uno;        }
	public void setUid(String uid)         { this.uid = uid;        }
	public void setUname(String uname)     { this.uname = uname;    }
	public void setUage(String uage)  	   { this.uage = uage;   	}
	public void setUhobby(String uhobby)   { this.uhobby = uhobby;  }
	public void setUgender(String ugender) { this.ugender = ugender;}
	
	
	public String getUno()     { return uno;     }
	public String getUid()     { return uid;     }
	public String getUname()   { return uname;   }
	public String getUage()	   { return uage;    }
	public String getUhobby()  { return uhobby;  }
	public String getUgender() { return ugender; }
	
}
