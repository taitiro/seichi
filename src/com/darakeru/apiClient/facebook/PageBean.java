package com.darakeru.apiClient.facebook;

import java.io.Serializable;

public class PageBean  implements Serializable {

    private long id;
    
    public PageBean(){
        //NOP
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }
}
