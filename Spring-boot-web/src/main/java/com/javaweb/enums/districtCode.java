package com.javaweb.enums;

import java.util.HashMap;
import java.util.Map;

public enum districtCode {
    QUAN_1("Nam từ liêm"),
    QUAN_2("Bắc từ liêm"),
    QUAN_3("Tây hồ"),
    QUAN_4("Hai bà trưng");

    private final String districtName;

    districtCode(String districtName){
        this.districtName = districtName;
    }

    public String getDistrictName() {
        return districtName;
    }

    public static Map<String, String> district(){
        Map<String, String> listDistrict = new HashMap<>();
        for(districtCode it : districtCode.values()){
            listDistrict.put(it.toString(), it.getDistrictName());
        }
        return listDistrict;
    }
}
