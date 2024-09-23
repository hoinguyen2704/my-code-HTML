package com.javaweb.enums;

import java.util.HashMap;
import java.util.Map;

public enum typeCode {

    TANG_TRET("Tâng trệt"),
    NGUYEN_CAN("Nguyên căn"),
    NOI_THAT("Nội thất");


    private final String typeCodeName;

    typeCode(String typeCodeName){
        this.typeCodeName = typeCodeName;
    }

    public String getTypeCodeName() {
        return typeCodeName;
    }

    public static Map<String, String> getTypeCode(){
        Map<String, String> listTypeCode = new HashMap<>();
        for(typeCode it : typeCode.values()){
            listTypeCode.put(it.toString(), it.getTypeCodeName());
        }
        return listTypeCode;
    }
}
