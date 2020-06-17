package ForTest;


import java.util.*;

import org.json.*;

public class testJsonArrayNodubble {
	
	
public static void main(String[] args) throws JSONException{
	//收前面進來的
	try {
	JSONArray alldates = new JSONArray();
	JSONObject jso = new JSONObject();
	JSONObject js2 = new JSONObject();
	JSONObject js3 = new JSONObject();
	
	jso.put("2020-06-04","早上");//duplicate
	js2.put("2020-06-03","早上");
	js3.put("2020-06-03","早上");
	
	alldates.put(jso);
	alldates.put(js2);
	alldates.put(js3);

     
	//-----------
     JSONArray alldates2 = new JSONArray();
     
     JSONObject js4 = new JSONObject();
     JSONObject js5 = new JSONObject();
     JSONObject js6 = new JSONObject();
     js4.put("2020-06-02","早上");//duplicate
     js5.put("2020-06-05","早上");
     js6.put("2020-06-03","早上");

     alldates2.put(js4);
     alldates2.put(js5);
     alldates2.put(js6);
//System.out.println(alldates);
//System.out.println(alldates2);

    String str; 
    String str2;
     
 	for(int i = 0 ; i <alldates.length(); i++) {
 		for(int j = 0; j< alldates2.length() ; j++) {
 			 str = alldates.get(i).toString();
 			 str2 = alldates2.get(j).toString();
 				if( str.equals(str2)) {
 					System.out.print(alldates.get(i).toString());
 					System.out.print("時間重複了");
 				}
 				
 		}
 		
 	}
//
 //    Set<JSONObject> it = getsame(alldates, alldates2);
////   輸出返回的不同 json物件。   
//		for (JSONObject j:it) {
//			System.out.println( "   j  "+j);
//			
//		}
//	
	
//	boolean duplicate = ;
//	if (duplicate) {
//		System.out.println("重複 請改時間");
//	}else {
//		System.out.println("OK 可以新增成功~");
//	}
	} catch (JSONException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

}


private void  getsame(JSONArray alldates, JSONArray alldates2) throws JSONException {
//	Set<JSONObject> diff = new HashSet<JSONObject>(); // 用來存放兩個陣列中相同的元素
//	Set<JSONObject> temp = new HashSet<JSONObject>(); // 用來存放陣列alldates中的元素
	
	for(int i = 0 ; i <alldates.length(); i++) {
		
	alldates.getJSONObject(i);
	alldates2.getJSONObject(i);
	}
	
//	for (int i = 0; i < alldates.length(); i++) {
//		JSONObject jo=new JSONObject();
//
//		jo.put("1",alldates.getJSONObject(i).get("1")); // 把陣列a中的元素放到Set中，可以去除重複的元素
//		jo.put("2", alldates.getJSONObject(i).get("2"));
//		temp.add(jo);
//	}
//
//	for (int j = 0; j < alldates2.length(); j++) {
//		// 把陣列b中的元素新增到temp中
//		JSONObject jo=new JSONObject();
//		jo.put("1",alldates2.getJSONObject(j).get("1")); // 把陣列a中的元素放到Set中，可以去除重複的元素
//		jo.put("2", alldates2.getJSONObject(j).get("2"));
//		// 如果temp中已存在相同的元素，則temp.add（b[j]）返回false
//		if (temp.add(jo)) {
//			diff.add(jo);
//		}
//	}
//	return diff;
}
}