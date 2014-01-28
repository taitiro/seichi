package com.darakeru.checkparam;

import java.util.regex.Pattern;

public class CheckStr {
    private String str;
    
/*    
   public static void main(String[] args){
        System.out.println(new CheckStr("http://darakeru.com/").urlCheck());
    }
*/
    public CheckStr(){
        //NOP
    }
    
    public CheckStr(String str){
        this.setStr(str);
    }
    public String getStr() {
        return str;
    }

    public void setStr(String str) {
        this.str = str;
    }
    
    public boolean urlCheck(){
        return Pattern.compile("^https?://[a-zA-Z0-9/:%#&~=_!'\\$\\?\\(\\)\\.\\+\\*\\-]+$").matcher(str).matches();
    }
}
