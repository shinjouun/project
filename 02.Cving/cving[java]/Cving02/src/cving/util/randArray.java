package cving.util;
import java.util.*;

public class randArray 
{
	public String[] shuffle(String[] array)
	{
		List<String> list = Arrays.asList(array);
	    
		list.toArray(array);
	    Collections.shuffle(list);
		return array;
	}
}
